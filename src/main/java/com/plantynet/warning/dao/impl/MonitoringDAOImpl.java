package com.plantynet.warning.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.plantynet.warning.dao.MonitoringDAO;
import com.plantynet.warning.vo.MonitoringVO;
import com.plantynet.warning.vo.SessionVO;
import com.plantynet.warning.vo.TeamTopFiveVO;

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
    public List<MonitoringVO> getGlobalLineStat(HashMap<String, Object> map){
    	return sqlSession.selectList(namespace+".getGlobalLineStat", map);
    }
    @Override
    public List<MonitoringVO> getTopServer(HashMap<String, Object> map){
    	return sqlSession.selectList(namespace+".getTopServer", map);
    }
    @Override
    public List<MonitoringVO> getGlobalBarStat(Integer teamId){
    	return sqlSession.selectList(namespace+".getGlobalBarStat", teamId);
    }
    
    // 모니터링 리스트 페이지
    @Override
    public List<MonitoringVO> getServerList(Integer teamId){
    	return sqlSession.selectList(namespace+".getServerList", teamId);
    }
    @Override
    public List<MonitoringVO> getCodeList(int serverId){
    	return sqlSession.selectList(namespace+".getCodeList", serverId);
    }
    @Override
    public List<MonitoringVO> getErrorLogList(Integer teamId){
    	return sqlSession.selectList(namespace+".getErrorLogList", teamId);
    }

    // 모니터링 상세 페이지
    @Override
    public List<MonitoringVO> getErrorLineStat(Integer serverId){
    	return sqlSession.selectList(namespace+".getErrorLineStat", serverId);
    }
    @Override
    public List<MonitoringVO> getTopCode(HashMap<String,Object> map){
    	return sqlSession.selectList(namespace+".getTopCode", map);
    }
    @Override
    public List<MonitoringVO> getErrorBarStat(int serverId){
    	return sqlSession.selectList(namespace+".getErrorBarStat", serverId);
    }
    @Override
    public Map<String, Integer> getDailyStat(SessionVO vo)
    {
        return sqlSession.selectOne(namespace+".getDailyStat", vo);
    }
    @Override
    public List<TeamTopFiveVO> getTeamTopFive(SessionVO vo)
    {
        return sqlSession.selectList(namespace+".getTeamTopFive", vo);
    }
    @Override
    public List<TeamTopFiveVO> getDailyTopFive(Map<String, Object> map)
    {
        return sqlSession.selectList(namespace+".getDailyTopFive", map);
    }
}
