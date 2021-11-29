package com.atguigu.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/26 11:17
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class DetailReturnVO {
    // 回报信息主键
    private Integer returnId;

    // 当前档位需支持的金额
    private Integer supportMoney;

    // 单笔限购，取值为0时无限购。取值为1时有限额
    private Integer signalPurchase;

    // 具体限额数量
    private Integer purchase;

    // 当前该档位支持者数量
    private Integer supporterCount;

    // 运费：取值为0表示包邮
    private Integer freight;

    // 众筹成功后多少天发货
    private Integer returnDate;

    // 回报内容
    private String content;

}
