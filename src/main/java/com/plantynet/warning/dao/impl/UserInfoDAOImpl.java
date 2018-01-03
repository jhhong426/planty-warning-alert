package com.plantynet.warning.dao.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plantynet.warning.dao.UserInfoDAO;
import com.plantynet.warning.vo.ManagerVO;

@Repository
public class UserInfoDAOImpl implements UserInfoDAO
{
    @Autowired
    SqlSession session;
    
    String namespace="com.plantynet.warning.sql.userInfoMapper";

    @Override
    public ManagerVO getUserInfo(int managerId)
    {
        return session.selectOne(namespace+".getManagerInfo", managerId);
    }

    @Override
    public void changeUserPassword(Map<String, Object> map)
    {
        session.update(namespace+".changeUserPassword", map);
    }

    @Override
    public void changeUserInfo(ManagerVO vo)
    {
        session.update(namespace+".changeUserInfo", vo);
    }
    
}
