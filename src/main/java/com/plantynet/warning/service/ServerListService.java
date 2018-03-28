package com.plantynet.warning.service;

import java.util.List;

import com.plantynet.warning.vo.ServerVO;

public interface ServerListService {
	public List<ServerVO> getServerList();
	public List<ServerVO> getServerListByIp(String ip);
	public List<ServerVO> getServerListByServerNmAndTeamId(ServerVO serverVO);
	public void addServer(ServerVO serverVo);
	public void deleteServer(int serverId);
	public void updateServer(ServerVO servervo);
}
