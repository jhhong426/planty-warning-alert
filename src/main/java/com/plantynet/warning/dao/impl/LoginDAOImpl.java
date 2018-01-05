package com.plantynet.warning.dao.impl;

import java.util.HashMap;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plantynet.warning.dao.LoginDAO;
import com.plantynet.warning.vo.ManagerVO;
@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "com.plantynet.warning.sql.loginMapper";

	@Override
	public int login(HashMap<String,String> map) {
		return sqlSession.selectOne(namespace+".login",map);
	}
	
	public ManagerVO getManagerByLoginId(String id) {
		return sqlSession.selectOne(namespace+".getManagerByLoginId",id);
	}

	@Override
	public String getTeamNmByTeamId(int teamId) {
		return sqlSession.selectOne(namespace+".getTeamNmByTeamId",teamId);
	}


	
//	public void create(BoardVO vo) throws Exception {
//	    session.insert(namespace + ".create", vo);
//	  }
//
//	  @Override
//	  public BoardVO read(Integer bno) throws Exception {
//	    return session.selectOne(namespace + ".read", bno);
//	  }
//
//	  @Override
//	  public void update(BoardVO vo) throws Exception {
//	    session.update(namespace + ".update", vo);
//	  }
//
//	  @Override
//	  public void delete(Integer bno) throws Exception {
//	    session.delete(namespace + ".delete", bno);
//	  }
//
//	  @Override
//	  public List<BoardVO> listAll() throws Exception {
//	    return session.selectList(namespace + ".listAll");
//	  }
	
	
}
