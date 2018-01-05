package com.plantynet.warning.dao;

import java.util.HashMap;
import java.util.List;

import com.plantynet.warning.vo.MonitoringVO;

public interface MonitoringDAO {
    
	public String getDate();
    public List<MonitoringVO> getServerList(Integer teamId);
    public List<MonitoringVO> getCodeList(int serverId);
    public List<MonitoringVO> getGlobalLineStat(HashMap<String, Object> map);
    public List<MonitoringVO> getGlobalBarStat(Integer teamId);
    public List<MonitoringVO> getErrorLogList(Integer teamId);
    public List<MonitoringVO> getServerInfo(int serverId);
    public List<MonitoringVO> getErrorLineStat(HashMap<String, Object> map);
    public List<MonitoringVO> getErrorLineHover(HashMap<String, Object> map);
    public List<MonitoringVO> getErrorBarStat(int serverId);
    
}
