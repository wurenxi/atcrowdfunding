package com.atguigu.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/25 15:48
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PortalProjectVO {
    private Integer projectId;

    private String projectName;

    private String headerPicturePath;

    private Integer money;

    private String deployDate;

    private Integer percentage;

    private Integer supporter;
}
