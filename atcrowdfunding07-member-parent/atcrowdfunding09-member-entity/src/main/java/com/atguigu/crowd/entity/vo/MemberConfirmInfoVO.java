package com.atguigu.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/22 14:34
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberConfirmInfoVO implements Serializable {
    // 易付宝帐号
    private String paynum;

    // 法人身份证号
    private String cardnum;
}
