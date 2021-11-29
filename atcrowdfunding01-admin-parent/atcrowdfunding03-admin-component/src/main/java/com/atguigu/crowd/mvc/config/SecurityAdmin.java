package com.atguigu.crowd.mvc.config;

import entity.Admin;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.List;

/**
 * 考虑到User对象中仅仅包含帐号和密码，为了能够获取到原始的Admin对象，专门创建这个类对User类进行扩展
 * @author gxl
 * @description
 * @createDate 2021/11/13 16:39
 */
public class SecurityAdmin extends User {

    // 原始的Admin对象，包含Admin对象的全部属性
    private Admin originalAdmin;

    public SecurityAdmin(Admin originalAdmin, List<GrantedAuthority> authorities){
        // 调用父类构造器
        super(originalAdmin.getLoginAcct(),originalAdmin.getUserPswd(),authorities);

        this.originalAdmin = originalAdmin;

        // 将原始Admin对象中的密码擦除
        this.originalAdmin.setUserPswd(null);
    }

    // 获取原始Admin对象
    public Admin getOriginalAdmin() {
        return originalAdmin;
    }
}
