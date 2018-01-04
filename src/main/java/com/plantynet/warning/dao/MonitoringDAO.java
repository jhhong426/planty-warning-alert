package com.plantynet.warning.dao;

import java.util.List;

import com.plantynet.warning.vo.MonitoringVO;

public interface MonitoringDAO {
    
	public String getDate();
    public List<MonitoringVO> getServerList(int teamId);
    public List<MonitoringVO> getCodeList(int serverId);
    public List<MonitoringVO> getGlobalLineStat(int teamId);
    public List<MonitoringVO> getGlobalBarStat(int teamId);
    public List<MonitoringVO> getErrorLogList(int teamId);
    public List<MonitoringVO> getServerInfo(int serverId);
    public List<MonitoringVO> getErrorLineStat(int serverId);
    public List<MonitoringVO> getErrorBarStat(int serverId);
    
}
