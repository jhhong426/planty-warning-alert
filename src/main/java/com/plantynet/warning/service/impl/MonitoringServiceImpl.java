package com.plantynet.warning.service.impl;

import java.util.HashMap;
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
	public List<MonitoringVO> getGlobalLineStat(HashMap<String, Object> map) {
		return monitoringDAO.getGlobalLineStat(map);
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
	public List<MonitoringVO> getErrorLineStat(HashMap<String, Object> map) {
		return monitoringDAO.getErrorLineStat(map);
	}
	@Override
	public List<MonitoringVO> getErrorLineHover(HashMap<String, Object> map) {
		return monitoringDAO.getErrorLineHover(map);
	}
	@Override
	public List<MonitoringVO> getErrorBarStat(int serverId) {
		return monitoringDAO.getErrorBarStat(serverId);
	}
    

    
    
    
	
}
