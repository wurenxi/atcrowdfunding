package com.atguigu.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/28 19:59
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class AddressVO implements Serializable {

    private Integer id;

    private String receiveName;

    private String phoneNum;

    private String address;

    private Integer memberId;
}
