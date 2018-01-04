package com.plantynet.warning.dao;

import java.util.List;

import com.plantynet.warning.vo.EventVO;
import com.plantynet.warning.vo.ManagerInChargeVO;
import com.plantynet.warning.vo.ServerVO;

public interface ServerInfoDAO
{
    public ServerVO getServerInfo(int serverId);
    
    public List<EventVO> getServerEventList(int serverId);
    
    public List<ManagerInChargeVO> getManagerInChargeList(int eventId);
    
    public void updateEvent(EventVO vo);
    
    public void deleteEvent(int eventId);
    
    public void updateEvntMngr(ManagerInChargeVO vo);
}
