package com.plantynet.warning.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.plantynet.warning.vo.MonitoringVO;
import com.plantynet.warning.vo.SessionVO;

public interface MonitoringDAO {
    
	public String getDate();
    
    public List<MonitoringVO> getGlobalLineStat(HashMap<String, Object> map);
    public List<MonitoringVO> getTopServer(HashMap<String, Object> map);
    public List<MonitoringVO> getGlobalBarStat(Integer teamId);
    
    public List<MonitoringVO> getServerList(Integer teamId);
    public List<MonitoringVO> getCodeList(int serverId);
    public List<MonitoringVO> getErrorLogList(Integer teamId);
    
    // 사용 안함
    public List<MonitoringVO> getServerInfo(int serverId);
    
    public List<MonitoringVO> getErrorLineStat(HashMap<String, Object> map);
    public List<MonitoringVO> getTopCode(HashMap<String, Object> map);
    public List<MonitoringVO> getErrorBarStat(int serverId);
    
    // 사용, 그러나 변경 후삭제 예정
    public List<MonitoringVO> getErrorLineHover(HashMap<String, Object> map);
    
    public Map<String, Integer> getDailyStat(SessionVO vo);
    
    
}
