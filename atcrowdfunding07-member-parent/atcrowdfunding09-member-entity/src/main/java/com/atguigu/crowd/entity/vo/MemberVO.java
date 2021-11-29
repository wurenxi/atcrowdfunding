package com.atguigu.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/20 17:33
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
    private String loginacct;

    private String userpswd;

    private String username;

    private String email;

    private String phoneNum;

    private String code;
}
