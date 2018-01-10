package com.plantynet.warning.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plantynet.warning.dao.AdminDAO;
import com.plantynet.warning.vo.ManagerVO;
@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "com.plantynet.warning.sql.adminMapper";
	
	public void addAdmin(ManagerVO managerVO) {
		sqlSession.insert(namespace+".addAdmin", managerVO);
	}
	
	public List<ManagerVO> getManagerListByTeamId(int teamId){
		return sqlSession.selectList(namespace+".getManagerListByTeamId",teamId);
	}

	@Override
	public void deleteAdmin(int managerId) {
		sqlSession.delete(namespace+".deleteAdmin",managerId);
	}

	@Override
	public int getLoginIdCount(String loginId) {
		return sqlSession.selectOne(namespace+".getLoginIdCount", loginId);
	}

	@Override
	public void updateEvntMngrByManagerId(int managerId) {
		sqlSession.update(namespace+".updateEvntMngrByManagerId", managerId);
	}
	
	
	
}
