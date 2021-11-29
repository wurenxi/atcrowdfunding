package com.atguigu.crowd.test;

import com.atguigu.crowd.mapper.AdminMapper;
import com.atguigu.crowd.mapper.RoleMapper;
import com.atguigu.crowd.service.api.AdminService;
import entity.Admin;
import entity.Role;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.util.Base64;

//在类上标记必要的注解，Spring整合Junit
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-persist-mybatis.xml","classpath:spring-persist-tx.xml"})
public class CrowdTest {

    @Autowired
    private DataSource dataSource;

    @Resource
    private AdminMapper adminMapper;

    @Autowired
    private AdminService adminService;

    @Resource
    private RoleMapper roleMapper;

    @Test
    public void testRoleSave(){
        for (int i = 0; i < 235; i++) {
            roleMapper.insert(new Role(null,"role"+i));
        }
    }

    @Test
    public void testTx(){
        Admin admin = new Admin(null, "jerry", "213", "杰瑞", "jerry@qq.com", null);
        adminService.saveAdmin(admin);
    }

    @Test
    public void test(){
        for (int i = 0; i < 238; i++) {
            adminMapper.insert(new Admin(null,"loginAcct"+i,"userPwsd"+i,"userName"+i,"email"+i,null));
        }
    }

    @Test
    public void testLog(){
        //1.获取Logger对象，这里传入的Class对象就是当前打印日志的类
        Logger logger = LoggerFactory.getLogger(CrowdTest.class);

        //2.根据不同日志级别打印日志
        logger.debug("Hello I am DeBUG level");
        logger.info("Hello I am Info level");
        logger.warn("Hello I am Warn level");
        logger.error("Hello I am Error level");
    }

    @Test
    public void testInsertAdmin(){
        Admin admin = new Admin(null, "tom", "123", "汤姆", "tom@qq.com", null);
        int count = adminMapper.insert(admin);

        //如果在实际开发中，所有想查看数值的地方都使用sout方式打印，会给项目上线运行带来问题
        //sout本质上是一个IO操作，通常IO操作比较消耗性能的。如果项目中sout很多，那么对性能的影响就比较大了
        //即使上线前专门花时间删除代码中的sout，也很可能有遗漏，而且非常麻烦
        //如果使用日志系统，那么通过日志级别就可以批量的控制信息的打印
        System.out.println("受影响的行数："+count);
    }

    @Test
    public void testConnection() throws Exception{
        Connection connection = dataSource.getConnection();
        System.out.println(connection);
    }
}
