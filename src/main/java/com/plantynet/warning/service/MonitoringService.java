package com.plantynet.warning.service;

import java.util.List;

import com.plantynet.warning.vo.MonitoringVO;

public interface MonitoringService {

	String getDate();
    List<MonitoringVO> getServerList(Integer teamId);
    List<MonitoringVO> getCodeList(int serverId);
    List<MonitoringVO> getGlobalLineStat(Integer teamId);
    List<MonitoringVO> getGlobalBarStat(Integer teamId);
    List<MonitoringVO> getErrorLogList(Integer teamId);
    List<MonitoringVO> getServerInfo(int serverId);
    List<MonitoringVO> getErrorLineStat(int serverId);
    List<MonitoringVO> getErrorBarStat(int serverId);
}
