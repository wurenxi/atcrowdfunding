package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号（使用沙箱环境的APPID）
	public static String app_id = "2021000118656482";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCmJtdJ/mD1KSCIdbJR5UIr3VFzmblcT0Sv4xzmjYSYioc6IdlG5Rq8pG77YIGY3IXl379TBiUGbG5p7v+k6q+s/D/5NkLWH0xho9X1TbivL0zU8FQYPp3+ABL51xHGaj+xsCNBlCNpf0kWfkphMsbHySdT3rsHcpv9wB99ahRut5QCJBJ5s4E8HGSERcxeyHI01pAZ7xVHXouNyzeubCB13CzJiaaEpyd7kKrQaJx7ZZfCh/BBU/nK6LHIPR31zD3Cp+bXY0UL7b/DCDNQ7dxVihedaXqJKvIrknV0TbLAb1/saWKWipQvyNMYOXqU4hmN9e3MB9URA1sHLL4pGrhdAgMBAAECggEAPY2QHmpt0wUsd0FbEXnkXMm9/hyKDgeTw7FYqJTu9XAEjuWxT9FaaV5lex0SheXUeQe+ImzZVJrhAL+414jWEjjVHmcataacrmN6xUjIzaWxSgXKsbyo3Ut7vDEP9biw5gwB066ku9Wa5wlcVsvv1l3QAwM1uJmd7pC5WcXt0eH4ywrkAleJMq2Q6jvl0cse+cKaCNIsm0fQ84XQkjIqQ7EEW8f2vYfOc0PNKPbImamRGYbZ8YMiEixk+306iNUnnY4Q1rqvCVImUfNDFKtHKfr4IZCHVLKUYVs/ZQ7IrXexKA5F36gspSn9x25at/wPqlB0qHpuwgxJz3/lHTuF5QKBgQDntnCVfcYTQqlotRcgSTRFl/hdIMGPZXC6ctEtGi02/b+tFSTi8x3aRcPIe1zMUJJGFGlWliEnOFmowLWTuKplpnX07ISi37/SKbIGNAAMr3Cor4RN3xEd4QF72G4eVGxux5RtKS+2r1WjfcDDi6UIXqHLJCNQshSE8IR7pYxjowKBgQC3kTNYZ3iwtKl4IFIx1t+sIl8EuPZMj1/0RC99A5Vme0AgdkZkNousmg+6qvXCbyZAN9jTNu2SxwrU8V0Rce4D5x6XqYW9HNipbixr2eAS7Y4lCowOkblRgMcEIPAa63GISRlZMjO7oWzWyTux2vkwHgZHMRoZgw54VSpuQo4z/wKBgFzl3R9iLJ6eNFNhfyMXllhshEu6DUBTeC2YSNrfSs9oToezGXXP6OEQ5VykcOENUIe+OTlYuXQC+Jdao7HU8KQOZ+5JQSgXss0soE4yXO65C97ld5LM4wzqn/CqJgQM7ug/JffZ8mI4y4nfqf/8Ja9EWXObSnlY3DcsQsFb7vwnAoGBAKyuCJD29Q+1Q15feTKtIUe6JYw5umgWz3rm0Y1WW6pF8vMWj+0hao75diZxQDKhgGgUoQE/wIi8eLIMQzJv7Cj7t0mQDODzS9VGcL8b+6+SjI7HtyzVZHEJJS37FiMcrHY53YCMuyGcHtiGAIO0q4jaFanOxPCO2oPUCdAjB8ZdAoGBAL+ERbhP7OUmIxWuJUtdTsOuvw3RcEqbfoG9bDVAKGvsfuvxaIcB8uSuF6RC2EbpN/0QAQlG3dt6ZQwlUuS3jXaHfnYPUqJ8DBquky6S3Hy8dMIAEUMvOUCz7d6j6ibTNO/UP/hbcDJ141xPwRRGZj4liM32byBe1UIbqSESRN/L";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi9ZrA27cisfA50Kow3ppTqcu8RxvSx3aOW8rp63vLoSal3PSM42kht60dKm1Tb4dnoS4sgA9Ridb+q9rVGlYi+KNPE/lYbNr24c7sgzpM2foQGRwjks2NeC2V2eKx8z/0V8MWzbHS93q5tjHEEdAl5UHTSUHZPq8BjepzxipJzTep1UIgOogzdOgyNz2mjnBP4gFpoTOOL6ZAtfEGAfWosXN/QxHO+LO2KSutNN8SbVAzXGUkktfo3jqzQPHyJzj7N4i47+YQwy+HXqZ/qUZ13uGPxrF/c2vIU+h5TnUGnuYDE2tFYKjrXOd3U/9Ci2851OE/Ms5PuUMmOOwWJaMzQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    // 工程公网访问地址使用内网穿透客户端提供的域名
	public static String notify_url = "http://hh4ijh.natappfree.cc/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    // 工程公网访问地址使用内网穿透客户端提供的域名
	public static String return_url = "http://hh4ijh.natappfree.cc/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关（正式环境）
//	public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";

    // 支付宝网关（沙箱环境）
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	// 日志路径
	public static String log_path = "D:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

