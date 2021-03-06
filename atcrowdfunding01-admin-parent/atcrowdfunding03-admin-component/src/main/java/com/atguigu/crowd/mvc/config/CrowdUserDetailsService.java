package com.atguigu.crowd.mvc.config;

import com.atguigu.crowd.service.api.AdminService;
import com.atguigu.crowd.service.api.AuthService;
import com.atguigu.crowd.service.api.RoleService;
import entity.Admin;
import entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/13 16:49
 */
@Component
public class CrowdUserDetailsService implements UserDetailsService {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private AuthService authService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 1.根据帐号名称查询Admin对象
        Admin admin = adminService.getAdminByLoginAcct(username);

        // 2.获取adminId
        Integer adminId = admin.getId();

        // 3.根据adminId查询角色信息
        List<Role> assignedRoleList = roleService.getAssignedRole(adminId);

        // 4.根据adminId查询权限信息
        List<String> authNameList = authService.getAssignedAuthNameByAdminId(adminId);

        // 5.创建集合对象用来存储GrantedAuthority
        List<GrantedAuthority> authorities = new ArrayList<>();

        // 6.遍历assignedRoleList存入角色信息
        for (Role role : assignedRoleList) {
            String roleName = "ROLE_" + role.getName();

            SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority(roleName);

            authorities.add(simpleGrantedAuthority);
        }

        // 7.遍历authNameList存入权限信息
        for (String authName : authNameList) {
            SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority(authName);

            authorities.add(simpleGrantedAuthority);
        }

        // 8.封装SecurityAdmin对象
        SecurityAdmin securityAdmin = new SecurityAdmin(admin, authorities);

        return securityAdmin;
    }
}
