package com.plantynet.warning.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.plantynet.warning.dao.MonitoringDAO;
import com.plantynet.warning.vo.MonitoringVO;

@Repository
public class MonitoringDAOImpl implements MonitoringDAO{
	
	@Autowired
    private SqlSession sqlSession;
    private static final String namespace = "com.plantynet.warning.sql.monitoringMapper";
    
    @Override
    public String getDate(){
    	return sqlSession.selectOne(namespace+".getDate");
    }
    @Override
    public List<MonitoringVO> getServerList(int teamId){
    	return sqlSession.selectList(namespace+".getServerList");
    }
    @Override
    public List<MonitoringVO> getCodeList(int serverId){
    	return sqlSession.selectList(namespace+".getCodeList");
    }
    @Override
    public List<MonitoringVO> getGlobalLineStat(int teamId){
    	return sqlSession.selectList(namespace+".getGlobalLineStat");
    }
    @Override
    public List<MonitoringVO> getGlobalBarStat(int teamId){
    	return sqlSession.selectList(namespace+".getGlobalBarStat");
    }
    @Override
    public List<MonitoringVO> getErrorLogList(int teamId){
    	return sqlSession.selectList(namespace+".getErrorLogList");
    }
    @Override
    public List<MonitoringVO> getServerInfo(int serverId){
    	return sqlSession.selectOne(namespace+".getServerInfot");
    }
    @Override
    public List<MonitoringVO> getErrorLineStat(int serverId){
    	return sqlSession.selectList(namespace+".getErrorLineStat");
    }
    @Override
    public List<MonitoringVO> getErrorBarStat(int serverId){
    	return sqlSession.selectList(namespace+".getErrorBarStat");
    }
}
