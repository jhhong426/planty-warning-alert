package com.plantynet.warning.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.plantynet.warning.dao.NotificationDAO;
import com.plantynet.warning.vo.NotiInfoVO;
import com.plantynet.warning.vo.ParamVO;

@Repository
public class NotificationDAOImpl implements NotificationDAO
{

    
    @Autowired
    private SqlSession sqlSession;
    private static final String namespace = "com.plantynet.warning.sql.notificationMapper";
    
    @Override
    public void setNotiInfo(NotiInfoVO vo)
    {
        sqlSession.insert(namespace+".setNotiInfo", vo);
        
    }

    @Override
    public List<NotiInfoVO> getManagerInfo(ParamVO vo)
    {
        return sqlSession.selectList(namespace+".getManagerInfo", vo);
    }

    @Override
    public int ipAllowCheck(String ip)
    {
        return sqlSession.selectOne(namespace+".ipAllowCheck",ip);
    }
    
}
