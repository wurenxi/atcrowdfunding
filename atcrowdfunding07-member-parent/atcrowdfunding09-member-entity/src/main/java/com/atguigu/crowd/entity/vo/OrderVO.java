package com.atguigu.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/28 23:46
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderVO implements Serializable {
    private Integer id;

    // 订单号
    private String orderNum;

    // 支付宝流水单号
    private String payOrderNum;

    // 订单金额
    private Double orderAmount;

    // 是否开发票
    private  Integer invoice;

    // 发票抬头
    private  String invoiceTitle;

    // 备注
    private String orderRemark;

    private String addressId;

    private OrderProjectVO orderProjectVO;
}
