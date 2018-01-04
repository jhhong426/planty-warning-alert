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
}
