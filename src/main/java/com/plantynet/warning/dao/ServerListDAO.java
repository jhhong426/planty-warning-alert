package com.plantynet.warning.dao;

import java.util.List;

import com.plantynet.warning.vo.ServerVO;

public interface ServerListDAO {
	public List<ServerVO> getServerListByIp(String ip);
	public List<ServerVO> getServerListByServerNm(String ServerNm);
}
