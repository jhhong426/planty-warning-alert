package com.plantynet.warning.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.warning.dao.ServerInfoDAO;
import com.plantynet.warning.service.ServerInfoService;
import com.plantynet.warning.vo.EventVO;
import com.plantynet.warning.vo.ManagerInChargeVO;
import com.plantynet.warning.vo.ServerVO;

@Service
public class SeverInfoServiceImpl implements ServerInfoService
{
    @Autowired
    ServerInfoDAO serverInfoDao;

    @Override
    public ServerVO getServerInfo(int serverId)
    {
        return serverInfoDao.getServerInfo(serverId);
    }

    @Override
    public List<EventVO> getServerEventList(int serverId)
    {
        return serverInfoDao.getServerEventList(serverId);
    }

    // 해당 서버가 가진 에러코드들에 대한 각각의 담당자들을 담아 전송(전체 장애별 담당자 데이터를 가져오는 것을 막기 위함)
    @Override
    public List<ManagerInChargeVO> getManagerInChargeList(int serverId)
    {
        List<EventVO> eventList = serverInfoDao.getServerEventList(serverId);
        List<ManagerInChargeVO> finalMICVo = new ArrayList<>();
        
        for (EventVO eventVO : eventList)
        {
            List<ManagerInChargeVO> tempMICVo = serverInfoDao.getManagerInChargeList(eventVO.getEventId());
            
            for (ManagerInChargeVO managerInChargeVO : tempMICVo)
            {
                finalMICVo.add(managerInChargeVO);
            }
            
        }
        return finalMICVo;
    }

    @Override
    public void updateEvent(EventVO vo)
    {
        serverInfoDao.updateEvent(vo);
    }

    @Override
    public void deleteEvent(int eventId)
    {
        serverInfoDao.deleteEvent(eventId);
    }

    @Override
    public void updateEvntMngr(ManagerInChargeVO vo)
    {
        serverInfoDao.updateEvntMngr(vo);
    }

    @Override
    public void deleteEvntMntr(ManagerInChargeVO vo)
    {
        serverInfoDao.deleteEvntMntr(vo);
    }

    @Override
    public boolean plusEvent(EventVO vo)
    {
        if(serverInfoDao.checkPlusEvent(vo) == 0)
        {
            serverInfoDao.plusEvent(vo);
            return true;
        }
        else
        {
            return false;
        }
    }

    @Override
    public boolean plusEvntMngr(ManagerInChargeVO vo)
    {
        if(serverInfoDao.checkPlusEvntMngr(vo) == 0)
        {
            serverInfoDao.plusEvntMngr(vo);
            return true;
        }
        else
        {
            return false;
        }
    }

}
