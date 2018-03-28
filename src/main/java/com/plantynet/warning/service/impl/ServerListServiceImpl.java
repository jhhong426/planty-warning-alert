package com.plantynet.warning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.warning.dao.impl.ServerInfoDAOImpl;
import com.plantynet.warning.dao.impl.ServerListDAOImpl;
import com.plantynet.warning.service.ServerListService;
import com.plantynet.warning.vo.EventVO;
import com.plantynet.warning.vo.ServerVO;

@Service
public class ServerListServiceImpl implements ServerListService {

	@Autowired
	ServerListDAOImpl dao;
	
	@Autowired
	ServerInfoDAOImpl serverInfoDAO;

	public List<ServerVO> getServerList() {
		return dao.getServerList();
	}

	public List<ServerVO> getServerListByIp(String ip) {
		return dao.getServerListByIp(ip);
	}

	public List<ServerVO> getServerListByServerNmAndTeamId(ServerVO serverVO) {
		return dao.getServerListByServerNmAndTeamId(serverVO);
	}

	public void addServer(ServerVO serverVo) {
		dao.addServer(serverVo);
	}

	public void deleteServer(int serverId) {
		List<EventVO> eventList = serverInfoDAO.getServerEventList(serverId);
		for (EventVO eventVO : eventList) {
			dao.updateEvntMngrByEventId(eventVO.getEventId());
		}
		dao.deleteServer(serverId);
		//dao.deleteEventHistoryByServerId(serverId);
		dao.deleteEventByServerId(serverId);
		
	}

	public void updateServer(ServerVO servervo) {
		dao.updateServer(servervo);
	}

}
