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
	
}
