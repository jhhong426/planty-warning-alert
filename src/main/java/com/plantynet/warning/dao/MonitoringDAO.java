package com.plantynet.warning.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.plantynet.warning.vo.MonitoringVO;
import com.plantynet.warning.vo.SearchParamVO;
import com.plantynet.warning.vo.SessionVO;
import com.plantynet.warning.vo.TeamTopFiveVO;

public interface MonitoringDAO {
    
	public String getDate();
    
    // 모니터링 리스트 페이지
    public List<MonitoringVO> getServerList(Integer managerId);
    public List<MonitoringVO> getCodeList(MonitoringVO vo);
    public List<MonitoringVO> getErrorLogList(SearchParamVO vo);
    
    // 모니터링 상세 페이지
    public List<MonitoringVO> getErrorLineStat(Integer serverId);
    public List<MonitoringVO> getTopCode(HashMap<String, Object> map);
    public List<MonitoringVO> getErrorBarStat(int serverId);
    
    public Map<String, Integer> getDailyStat(SessionVO vo);
    public List<TeamTopFiveVO> getTeamTopFive(SessionVO vo);
    public List<TeamTopFiveVO> getDailyTopFive(Map<String,Object> map);
}
