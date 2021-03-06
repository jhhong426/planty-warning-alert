package com.plantynet.warning.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.warning.dao.MonitoringDAO;
import com.plantynet.warning.service.MonitoringService;
import com.plantynet.warning.vo.MonitoringVO;
import com.plantynet.warning.vo.SearchParamVO;
import com.plantynet.warning.vo.SessionVO;
import com.plantynet.warning.vo.TeamTopFiveVO;

@Service
public class MonitoringServiceImpl implements MonitoringService{

	@Autowired
	private MonitoringDAO monitoringDAO;
	
	@Override
	public String getDate() {
		return monitoringDAO.getDate();
	}
	
	// 모니터링 리스트 페이지
	@Override
	public List<MonitoringVO> getServerList(Integer managerId) {
		return monitoringDAO.getServerList(managerId);
	}
	@Override
	public List<MonitoringVO> getCodeList(MonitoringVO vo) {
		return monitoringDAO.getCodeList(vo);
	}
	@Override
	public List<MonitoringVO> getErrorLogList(SearchParamVO vo) {
		
		String fullPreDate = vo.getPreDate() + " 00:00:00";
		String fullPostDate = vo.getPostDate() + " 23:59:59";
		
		vo.setPreDate(fullPreDate);
		vo.setPostDate(fullPostDate);
		return monitoringDAO.getErrorLogList(vo);
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
    @Override
    public Collection<Integer> getDailyStat(SessionVO vo)
    {
        Map<String, Integer> map = monitoringDAO.getDailyStat(vo);
        Collection<Integer> temp = map.values();
        return temp;
    }
    @Override
    public List<TeamTopFiveVO> getTeamTopFive(SessionVO vo)
    {
        return monitoringDAO.getTeamTopFive(vo);
    }
    @Override
    public List<TeamTopFiveVO> getDailyTopFive(Map<String, Object> map)
    {
        return monitoringDAO.getDailyTopFive(map);
    }

}
