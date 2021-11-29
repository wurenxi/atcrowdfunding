package com.atguigu.crowd.service.api;

import com.github.pagehelper.PageInfo;
import entity.Admin;

import java.util.List;

/**
 * @description:
 * @author: gxl
 * @createDate: 2021/10/23 18:22
 */
public interface AdminService {

    void saveAdmin(Admin admin);

    List<Admin> getAll();

    Admin getAdminByLoginAcct(String loginAcct, String userPwd);

    PageInfo<Admin> getPageInfo(String keyword,Integer pageNum,Integer pageSize);

    void remove(Integer adminId);

    Admin getAdminById(Integer adminId);

    void update(Admin admin);

    void saveAdminRoleRelationship(Integer adminId, List<Integer> roleIdList);

    Admin getAdminByLoginAcct(String username);
}
