package com.atguigu.crowd.service.impl;

import com.atguigu.crowd.entity.po.MemberPO;
import com.atguigu.crowd.entity.po.MemberPOExample;
import com.atguigu.crowd.mapper.MemberPOMapper;
import com.atguigu.crowd.service.api.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author gxl
 * @description
 * @createDate 2021/11/17 19:16
 */
@Transactional(readOnly = true)
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberPOMapper memberPOMapper;

    @Override
    public MemberPO getMemberPOByLoginAcct(String loginacct) {
        // 创建Example对象
        MemberPOExample example = new MemberPOExample();
        // 创建Criteria对象
        MemberPOExample.Criteria criteria = example.createCriteria();

        // 封装查询条件
        criteria.andLoginacctEqualTo(loginacct);
        // 执行查询
        List<MemberPO> list = memberPOMapper.selectByExample(example);

        // 获取结果
        if(list == null || list.size() == 0){
            return null;
        }
        return list.get(0);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW,
            rollbackFor = Exception.class,
            readOnly = false)
    @Override
    public void saveMember(MemberPO memberPO) {
        memberPOMapper.insertSelective(memberPO);
    }
}
