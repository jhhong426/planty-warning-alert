package com.plantynet.warning.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.plantynet.warning.dao.LoginDAO;
import com.plantynet.warning.dao.TestDAO;
@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.plantynet.warning.sql.loginMapper";

	@Override
	public int login(HashMap<String,String> map) {
		return sqlSession.selectOne(namespace+".login",map);
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
