package com.plantynet.warning.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.plantynet.warning.dao.ServerListDAO;
import com.plantynet.warning.vo.ServerVO;

public class ServerListDAOImpl implements ServerListDAO {

	@Autowired
	SqlSession sqlSession;
	private static final String namespace = "com.plantynet.warning.sql.serverListMapper";

	public List<ServerVO> getServerListByIp(String ip) {
		return sqlSession.selectList(namespace + ".getServerListByIp", ip);
	}

	public List<ServerVO> getServerListByServerNm(String serverNm) {
		return sqlSession.selectList(namespace + ".getServerListByServerNm", serverNm);
	}
}
