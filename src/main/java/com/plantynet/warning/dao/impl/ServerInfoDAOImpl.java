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

    @Override
    public void updateEvent(EventVO vo)
    {
        session.update(namespace+".updateEvent", vo);
    }

    @Override
    public void deleteEvent(int eventId)
    {
        session.update(namespace+".updateEventForDel", eventId);
        session.update(namespace+".updateEvntMngrForDel", eventId);
    }

    @Override
    public void updateEvntMngr(ManagerInChargeVO vo)
    {
        session.update(namespace+".updateEvntMngr", vo);
    }

    @Override
    public void deleteEvntMntr(ManagerInChargeVO vo)
    {
        session.update(namespace+".deleteEvntMngr", vo);
    }

    @Override
    public int checkPlusEvent(EventVO vo)
    {
        return session.selectOne(namespace+".checkPlusEvent", vo);
    }

    @Override
    public void plusEvent(EventVO vo)
    {
        session.insert(namespace+".plusEvent", vo);
    }

    @Override
    public int checkPlusEvntMngr(ManagerInChargeVO vo)
    {
        return session.selectOne(namespace+".checkPlusEvntMngr", vo);
    }

    @Override
    public void plusEvntMngr(ManagerInChargeVO vo)
    {
        session.insert(namespace+".plusEvntMngr", vo);
    }

	@Override
	public Integer getServerIdByName(String serverNm) {
		return session.selectOne(namespace+".getServerIdByName", serverNm);
	}

}
