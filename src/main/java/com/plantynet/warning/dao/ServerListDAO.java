package com.plantynet.warning.dao;

import java.util.List;

import com.plantynet.warning.vo.ServerVO;

public interface ServerListDAO {
	public List<ServerVO> getServerList(int teamId);
	public List<ServerVO> getServerListByIp(String ip);
	public List<ServerVO> getServerListByServerNm(String ServerNm);
	public void addServer(ServerVO serverVo);
	public void deleteServer(int serverId);
	public void updateServer(ServerVO servervo);
	
}