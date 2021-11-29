package com.atguigu.crowd.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/22 10:15
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
@ConfigurationProperties(prefix = "aliyun.oss")
public class OSSProperties {
    private String endPoint;

    private String bucketName;

    private String accessKeyId;

    private String accessKeySecret;

    private String bucketDomain;
}
