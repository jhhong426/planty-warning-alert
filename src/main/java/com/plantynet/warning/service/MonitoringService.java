package com.plantynet.warning.service;

import java.util.List;

import com.plantynet.warning.vo.MonitoringVO;

public interface MonitoringService {

	String getDate();
    List<MonitoringVO> getServerList(int teamId);
    List<MonitoringVO> getCodeList(int serverId);
    List<MonitoringVO> getGlobalLineStat(int teamId);
    List<MonitoringVO> getGlobalBarStat(int teamId);
    List<MonitoringVO> getErrorLogList(int teamId);
    List<MonitoringVO> getServerInfo(int serverId);
    List<MonitoringVO> getErrorLineStat(int serverId);
    List<MonitoringVO> getErrorBarStat(int serverId);
}
