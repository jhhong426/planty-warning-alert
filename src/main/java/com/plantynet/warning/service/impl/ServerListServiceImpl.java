package com.plantynet.warning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.warning.dao.impl.ServerListDAOImpl;
import com.plantynet.warning.service.ServerListService;
import com.plantynet.warning.vo.ServerVO;

@Service
public class ServerListServiceImpl implements ServerListService {

	@Autowired
	ServerListDAOImpl dao;

	public List<ServerVO> getServerList(int teamId) {
		return dao.getServerList(teamId);
	}

	public List<ServerVO> getServerListByIp(String ip) {
		return dao.getServerListByIp(ip);
	}

	public List<ServerVO> getServerListByServerNm(String ServerNm) {
		return dao.getServerListByServerNm(ServerNm);
	}

	public void addServer(ServerVO serverVo) {
		dao.addServer(serverVo);
	}

	public void deleteServer(int serverId) {
		dao.deleteServer(serverId);
	}

	public void updateServer(ServerVO servervo) {
		dao.updateServer(servervo);
	}
}
