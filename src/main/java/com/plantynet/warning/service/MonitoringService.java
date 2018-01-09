package com.plantynet.warning.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.plantynet.warning.vo.MonitoringVO;
import com.plantynet.warning.vo.SessionVO;

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
    
    List<MonitoringVO> getErrorLineHover(HashMap<String, Object> map);
    
    public Collection<Integer> getDailyStat(SessionVO vo);

}
