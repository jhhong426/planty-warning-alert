package com.plantynet.warning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.warning.dao.MonitoringDAO;
import com.plantynet.warning.service.MonitoringService;
import com.plantynet.warning.vo.MonitoringVO;
import com.plantynet.warning.vo.MonitoringVO;

@Service
public class MonitoringServiceImpl implements MonitoringService{

	@Autowired
	private MonitoringDAO monitoringDAO;
	
	@Override
	public String getDate() {
		return monitoringDAO.getDate();
	}
	@Override
	public List<MonitoringVO> getServerList(Integer teamId) {
		return monitoringDAO.getServerList(teamId);
	}
	@Override
	public List<MonitoringVO> getCodeList(int serverId) {
		return monitoringDAO.getCodeList(serverId);
	}
	@Override
	public List<MonitoringVO> getGlobalLineStat(Integer teamId) {
		return monitoringDAO.getGlobalLineStat(teamId);
	}
	@Override
	public List<MonitoringVO> getGlobalBarStat(Integer teamId) {
		return monitoringDAO.getGlobalBarStat(teamId);
	}
	@Override
	public List<MonitoringVO> getErrorLogList(Integer teamId) {
		return monitoringDAO.getErrorLogList(teamId);
	}
	@Override
	public List<MonitoringVO> getServerInfo(int serverId) {
		return monitoringDAO.getServerInfo(serverId);
	}
	@Override
	public List<MonitoringVO> getErrorLineStat(int serverId) {
		return monitoringDAO.getErrorLineStat(serverId);
	}
	@Override
	public List<MonitoringVO> getErrorBarStat(int serverId) {
		return monitoringDAO.getErrorBarStat(serverId);
	}
    

    
    
    
	
}
