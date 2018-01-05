package com.plantynet.warning.dao.impl;

import java.util.HashMap;
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
    public List<MonitoringVO> getServerList(Integer teamId){
    	return sqlSession.selectList(namespace+".getServerList", teamId);
    }
    @Override
    public List<MonitoringVO> getCodeList(int serverId){
    	return sqlSession.selectList(namespace+".getCodeList", serverId);
    }
    @Override
    public List<MonitoringVO> getGlobalLineStat(Integer teamId){
    	return sqlSession.selectList(namespace+".getGlobalLineStat", teamId);
    }
    @Override
    public List<MonitoringVO> getGlobalBarStat(Integer teamId){
    	return sqlSession.selectList(namespace+".getGlobalBarStat", teamId);
    }
    @Override
    public List<MonitoringVO> getErrorLogList(Integer teamId){
    	return sqlSession.selectList(namespace+".getErrorLogList", teamId);
    }
    @Override
    public List<MonitoringVO> getServerInfo(int serverId){
    	return sqlSession.selectOne(namespace+".getServerInfo", serverId);
    }
    @Override
    public List<MonitoringVO> getErrorLineStat(HashMap<String,Object> map){
    	
    	
    	return sqlSession.selectList(namespace+".getErrorLineStat", map);
    }
    @Override
    public List<MonitoringVO> getErrorBarStat(int serverId){
    	return sqlSession.selectList(namespace+".getErrorBarStat", serverId);
    }
}
