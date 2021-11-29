package com.atguigu.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/28 17:00
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderProjectVO implements Serializable {
    private Integer id;

    private String projectName;

    private String launchName;

    private String returnContent;

    private Integer returnCount;

    private Integer supportPrice;

    private Integer freight;

    private Integer orderId;

    private Integer signalPurchase;

    private Integer purchase;
}
