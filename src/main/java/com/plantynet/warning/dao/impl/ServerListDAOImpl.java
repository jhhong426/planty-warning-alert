package com.plantynet.warning.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plantynet.warning.dao.ServerListDAO;
import com.plantynet.warning.vo.ServerVO;

@Repository
public class ServerListDAOImpl implements ServerListDAO {

	@Autowired
	SqlSession sqlSession;
	private static final String namespace = "com.plantynet.warning.sql.serverListMapper";
	
	@Override
	public List<ServerVO> getServerList(int teamId){
		return sqlSession.selectList(namespace + ".getServerList",teamId);
	}
	
	@Override
	public List<ServerVO> getServerListByIp(String ip) {
		return sqlSession.selectList(namespace + ".getServerListByIp", ip);
	}

	@Override
	public List<ServerVO> getServerListByServerNm(String serverNm) {
		return sqlSession.selectList(namespace + ".getServerListByServerNm", serverNm);
	}

	@Override
	public void addServer(ServerVO serverVO) {
		sqlSession.insert(namespace + ".addServer", serverVO);

	}

	@Override
	public void deleteServer(int serverId) {
		sqlSession.delete(namespace + ".deleteServer", serverId);

	}

	@Override
	public void updateServer(ServerVO serverVO) {
		sqlSession.update(namespace + ".updateServer", serverVO);
	}

}
