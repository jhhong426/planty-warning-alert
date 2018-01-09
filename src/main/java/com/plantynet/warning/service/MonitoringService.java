package com.plantynet.warning.service;

import java.util.HashMap;
import java.util.List;

import com.plantynet.warning.vo.MonitoringVO;

public interface MonitoringService {

	String getDate();
    
    List<MonitoringVO> getGlobalLineStat(HashMap<String, Object> map);
    List<MonitoringVO> getTopServer(HashMap<String, Object> map);
    List<MonitoringVO> getGlobalBarStat(Integer teamId);
    
    // 모니터링 리스트 페이지
    List<MonitoringVO> getServerList(Integer teamId);
    List<MonitoringVO> getCodeList(int serverId);
    List<MonitoringVO> getErrorLogList(Integer teamId);
    
    // 모니터링 상세 페이지
    List<MonitoringVO> getErrorLineStat(Integer serverId);
    List<MonitoringVO> getTopCode(HashMap<String, Object> map);
    List<MonitoringVO> getErrorBarStat(int serverId);
}
