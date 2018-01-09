package com.plantynet.warning.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.plantynet.warning.vo.MonitoringVO;
import com.plantynet.warning.vo.SessionVO;
import com.plantynet.warning.vo.TeamTopFiveVO;

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
    
    public Collection<Integer> getDailyStat(SessionVO vo);
    public List<TeamTopFiveVO> getTeamTopFive(SessionVO vo);

}
