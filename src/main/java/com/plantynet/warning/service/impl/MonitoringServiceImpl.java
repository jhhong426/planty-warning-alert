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
	public List<MonitoringVO> getGlobalLineStat(HashMap<String, Object> map) {
		return monitoringDAO.getGlobalLineStat(map);
	}
	@Override
	public List<MonitoringVO> getTopServer(HashMap<String, Object> map) {
		return monitoringDAO.getTopServer(map);
	}
	@Override
	public List<MonitoringVO> getGlobalBarStat(Integer teamId) {
		return monitoringDAO.getGlobalBarStat(teamId);
	}
	
	// 모니터링 리스트 페이지
	@Override
	public List<MonitoringVO> getServerList(Integer teamId) {
		return monitoringDAO.getServerList(teamId);
	}
	@Override
	public List<MonitoringVO> getCodeList(int serverId) {
		return monitoringDAO.getCodeList(serverId);
	}
	@Override
	public List<MonitoringVO> getErrorLogList(Integer teamId) {
		return monitoringDAO.getErrorLogList(teamId);
	}

	// 모니터링 상세 페이지
	@Override
	public List<MonitoringVO> getErrorLineStat(Integer serverId) {
		return monitoringDAO.getErrorLineStat(serverId);
	}
	@Override
	public List<MonitoringVO> getTopCode(HashMap<String, Object> map) {
		return monitoringDAO.getTopCode(map);
	}
	@Override
	public List<MonitoringVO> getErrorBarStat(int serverId) {
		return monitoringDAO.getErrorBarStat(serverId);
	}
}
