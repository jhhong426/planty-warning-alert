package com.plantynet.warning.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plantynet.warning.dao.ServerInfoDAO;
import com.plantynet.warning.vo.EventVO;
import com.plantynet.warning.vo.ManagerInChargeVO;
import com.plantynet.warning.vo.ServerVO;

@Repository
public class ServerInfoDAOImpl implements ServerInfoDAO
{
    
    @Autowired
    SqlSession session;
    
    String namespace = "com.plantynet.warning.sql.serverInfoMapper";

    @Override
    public ServerVO getServerInfo(int serverId)
    {
        return session.selectOne(namespace+".getServerInfo", serverId);
    }

    @Override
    public List<EventVO> getServerEventList(int serverId)
    {
        return session.selectList(namespace+".getServerEventList", serverId);
    }

    @Override
    public List<ManagerInChargeVO> getManagerInChargeList(int eventId)
    {
        return session.selectList(namespace+".getEventManagerInfoList", eventId);
    }

}
