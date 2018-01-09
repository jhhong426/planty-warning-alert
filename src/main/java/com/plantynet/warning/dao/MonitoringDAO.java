package com.plantynet.warning.dao;

import java.util.HashMap;
import java.util.List;

import com.plantynet.warning.vo.MonitoringVO;

public interface MonitoringDAO {
    
	public String getDate();
    
    public List<MonitoringVO> getGlobalLineStat(HashMap<String, Object> map);
    public List<MonitoringVO> getTopServer(HashMap<String, Object> map);
    public List<MonitoringVO> getGlobalBarStat(Integer teamId);
    
    // 모니터링 리스트 페이지
    public List<MonitoringVO> getServerList(Integer teamId);
    public List<MonitoringVO> getCodeList(int serverId);
    public List<MonitoringVO> getErrorLogList(Integer teamId);
    
    // 모니터링 상세 페이지
    public List<MonitoringVO> getErrorLineStat(Integer serverId);
    public List<MonitoringVO> getTopCode(HashMap<String, Object> map);
    public List<MonitoringVO> getErrorBarStat(int serverId);
}
