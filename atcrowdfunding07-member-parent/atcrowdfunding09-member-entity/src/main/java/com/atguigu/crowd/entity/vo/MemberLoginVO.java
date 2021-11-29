package com.atguigu.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/21 14:04
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberLoginVO implements Serializable{
    private Integer id;

    private String username;

    private String email;
}
