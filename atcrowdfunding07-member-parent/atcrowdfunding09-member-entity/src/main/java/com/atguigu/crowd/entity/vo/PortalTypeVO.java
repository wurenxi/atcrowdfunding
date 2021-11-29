package com.atguigu.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/25 15:46
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PortalTypeVO {
    private Integer id;

    private String name;

    private String remark;

    private List<PortalProjectVO> portalProjectVOList;
}
