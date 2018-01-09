package com.plantynet.warning.service;

import java.util.HashMap;
import java.util.List;

import com.plantynet.warning.vo.MonitoringVO;

public interface MonitoringService {

	String getDate();
    
    List<MonitoringVO> getGlobalLineStat(HashMap<String, Object> map);
    List<MonitoringVO> getTopServer(HashMap<String, Object> map);
    List<MonitoringVO> getGlobalBarStat(Integer teamId);
    
    List<MonitoringVO> getServerList(Integer teamId);
    List<MonitoringVO> getCodeList(int serverId);
    List<MonitoringVO> getErrorLogList(Integer teamId);
    
    List<MonitoringVO> getServerInfo(int serverId); //안씀, 삭제예정
    
    List<MonitoringVO> getErrorLineStat(Integer serverId);
    List<MonitoringVO> getTopCode(HashMap<String, Object> map);
    List<MonitoringVO> getErrorBarStat(int serverId);
    
    List<MonitoringVO> getErrorLineHover(HashMap<String, Object> map);
    
    
}
