package com.atguigu.crowd.util;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.common.comm.ResponseMessage;
import com.aliyun.oss.model.PutObjectResult;
import com.atguigu.crowd.constant.CrowdConstant;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author gxl
 * @description 尚筹网项目通用工具方法类
 * @createDate 2021/10/25 18:20
 */
public class CrowdUtil {

    /**
     * 专门负责上传文件到 OSS 服务器的工具方法
     *
     * @param endpoint        OSS 参数
     * @param accessKeyId     OSS 参数
     * @param accessKeySecret OSS 参数
     * @param inputStream     要上传的文件的输入流
     * @param bucketName      OSS 参数
     * @param bucketDomain    OSS 参数
     * @param originalName    要上传的文件的原始文件名
     * @return 包含上传结果以及上传的文件在 OSS 上的访问路径
     */
    public static ResultEntity<String> uploadFileToOss(
            String endpoint,
            String accessKeyId,
            String accessKeySecret,
            InputStream inputStream,
            String bucketName,
            String bucketDomain,
            String originalName) {
        // 创建 OSSClient 实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        // 生成上传文件的目录
        String folderName = new SimpleDateFormat("yyyyMMdd").format(new Date());
        // 生成上传文件在 OSS 服务器上保存时的文件名
        // 原始文件名：beautfulgirl.jpgwet3
        // 生成文件名：wer234234efwer235346457dfs46235.jpg
        // 使用 UUID 生成文件主体名称
        String fileMainName = UUID.randomUUID().toString().replace("-", "");
        // 从原始文件名中获取文件扩展名
        String extensionName = originalName.substring(originalName.lastIndexOf("."));
        // 使用目录、文件主体名称、文件扩
        //  展名称拼接得到对象名称
        String objectName = folderName + "/" + fileMainName + extensionName;
        try {
            // 调用 OSS 客户端对象的方法上传文件并获取响应结果数据
            PutObjectResult putObjectResult = ossClient.putObject(bucketName, objectName,inputStream);
            // 从响应结果中获取具体响应消息
            ResponseMessage responseMessage = putObjectResult.getResponse();
            // 根据响应状态码判断请求是否成功
            if (responseMessage == null) {
                // 拼接访问刚刚上传的文件的路径
                String ossFileAccessPath = bucketDomain + "/" + objectName;
                // 当前方法返回成功
                return ResultEntity.successWithData(ossFileAccessPath);
            } else {
                // 获取响应状态码
                int statusCode = responseMessage.getStatusCode();
                // 如果请求没有成功，获取错误消息
                String errorMessage = responseMessage.getErrorResponseAsString();
                // 当前方法返回失败
                return ResultEntity.failed(" 当前响应状态码 =" + statusCode + " 错误消息"+errorMessage);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 当前方法返回失败
            return ResultEntity.failed(e.getMessage());
        } finally {
            if (ossClient != null) {
                // 关闭 OSSClient。
                ossClient.shutdown();
            }
        }
    }


    /**
     * 给远程第三方短信接口发送请求把验证码发送到用户手机上
     *
     * @param host    短信接口调用的URL地址
     * @param path    具体发送短信功能的地址
     * @param phone   接收验证码的手机号
     * @param appcode 调用第三方短信API的AppCode
     * @param sign    签名编号
     * @param skin    模板编号
     * @return 返回调用结果是否成功，以及失败消息
     * 成功：返回验证码
     * 失败：返回失败消息
     */
    public static ResultEntity<String> sendCodeByShortMessage(String host,
                                                              String path,
                                                              String phone,
                                                              String appcode,
                                                              String sign,
                                                              String skin) {
        // 生成验证码
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            int random = (int) (Math.random() * 10);
            builder.append(random);
        }
        String param = builder.toString(); // 【4】请求参数，详见文档描述
        String urlSend = host + path + "?param=" + param + "&phone=" + phone + "&sign=" + sign + "&skin=" + skin; // 【5】拼接请求链接
        try {
            URL url = new URL(urlSend);
            HttpURLConnection httpURLCon = (HttpURLConnection) url.openConnection();
            httpURLCon.setRequestProperty("Authorization", "APPCODE " + appcode);// 格式Authorization:APPCODE
            // (中间是英文空格)
            int httpCode = httpURLCon.getResponseCode();
            if (httpCode == 200) {
                System.out.println("正常请求计费(其他均不计费)");
                // 操作成功，把生成的验证码返回
                return ResultEntity.successWithData(param);
            } else {
                Map<String, List<String>> map = httpURLCon.getHeaderFields();
                String error = map.get("X-Ca-Error-Message").get(0);
                String failedMsg = "";
                if (httpCode == 400 && error.equals("Invalid AppCode `not exists`")) {
                    failedMsg = "AppCode错误 ";
                } else if (httpCode == 400 && error.equals("Invalid Url")) {
                    failedMsg = "请求的 Method、Path 或者环境错误";
                } else if (httpCode == 400 && error.equals("Invalid Param Location")) {
                    failedMsg = "参数错误";
                } else if (httpCode == 403 && error.equals("Unauthorized")) {
                    failedMsg = "服务未被授权（或URL和Path不正确）";
                } else if (httpCode == 403 && error.equals("Quota Exhausted")) {
                    failedMsg = "套餐包次数用完 ";
                } else {
                    failedMsg = "参数名错误 或 其他错误";
                    System.out.println(error);
                    return ResultEntity.failed(failedMsg + " : " + error);
                }
                return ResultEntity.failed(failedMsg);
            }

        } catch (MalformedURLException e) {
            System.out.println("URL格式错误");
            return ResultEntity.failed("URL格式错误");
        } catch (UnknownHostException e) {
            System.out.println("URL地址错误");
            return ResultEntity.failed("URL地址错误");

        } catch (Exception e) {
            // 打开注释查看详细报错异常信息
            // e.printStackTrace();
            return ResultEntity.failed(e.getMessage());
        }
    }

    /**
     * 对明文字符串进行MD5加密
     *
     * @param source 传入的明文字符串
     * @return 加密结果
     */
    public static String md5(String source) {
        //1.判断source是否有效
        if (source == null || source.length() == 0) {
            throw new RuntimeException(CrowdConstant.MESSAGE_STRING_INVALIDATE);
        }

        try {
            //3.获取MessageDigest对象
            String algorithm = "md5";
            MessageDigest messageDigest = MessageDigest.getInstance(algorithm);

            // 4.获取明文字符串对应的字节数组
            byte[] input = source.getBytes();

            //5.执行加密
            byte[] output = messageDigest.digest(input);

            // 6.创建BigInteger对象
            int signum = 1;
            BigInteger bigInteger = new BigInteger(signum, output);

            // 7.按照16进制将bigInteger的值转换为字符串
            int radix = 16;
            String encoded = bigInteger.toString(radix).toUpperCase();

            return encoded;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 判断当前请求是否为Ajax请求
     *
     * @param request
     * @return true：当前请求是Ajax请求
     * false：当前请求不是Ajax请求
     */
    public static boolean judgeRequestType(HttpServletRequest request) {

        //1.获取请求消息头
        String acceptHeader = request.getHeader("Accept");
        String xRequestHeader = request.getHeader("X-Requested-with");

        //2.判断
        return (acceptHeader != null && acceptHeader.contains("application/json"))
                || (xRequestHeader != null && xRequestHeader.equals("XMLHttpequest"));
    }
}
