package com.plantynet.warning.service;

import java.util.List;

import com.plantynet.warning.vo.EventVO;
import com.plantynet.warning.vo.ManagerInChargeVO;
import com.plantynet.warning.vo.ServerVO;

public interface ServerInfoService
{
    public ServerVO getServerInfo(int serverId);
    
    public List<EventVO> getServerEventList(int serverId);
    
    public List<ManagerInChargeVO> getManagerInChargeList(int serverId);
    
    public void updateEvent(EventVO vo);
    
    public void deleteEvent(int eventId);
    
    public boolean updateEvntMngr(ManagerInChargeVO vo);
    
    public void deleteEvntMntr(ManagerInChargeVO vo);
    
    public boolean plusEvent(EventVO vo);
    
    public boolean plusEvntMngr(ManagerInChargeVO vo);
    
    public Integer getServerIdByName(String serverNm);
}
