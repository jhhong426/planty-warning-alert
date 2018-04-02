package com.plantynet.warning.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.warning.dao.NotificationDAO;
import com.plantynet.warning.service.NotificationService;
import com.plantynet.warning.vo.NotiInfoVO;
import com.plantynet.warning.vo.ParamVO;

@Service
public class NotificationServiceImpl implements NotificationService
{
    
    @Autowired
    NotificationDAO dao;
    
    @Override
    public boolean setNotiInfo(ParamVO vo)
    {
        List<NotiInfoVO> managerInfos = dao.getManagerInfo(vo);
        
        Date nowTime = null;
        Date lastRegistTime = null;
        long alertTermToMilliSecond = 0;
        
        if(managerInfos.isEmpty()){
            return false;
        }
        
        for (NotiInfoVO manager : managerInfos)
        {
        	//알림 간격 설정 안함 
        	if(manager.getAlertTerm() == 99999999) 
        	{
        		manager.setNtfcNeed("ALN02");
        	}
        	else
        	{
        		alertTermToMilliSecond = manager.getAlertTerm() * 60 * 1000;
        		nowTime = new Date();
            	lastRegistTime = manager.getLastTime();
            	
            	// 처음 들어오는 장애 매세지
            	if (lastRegistTime == null)
            	{
            		manager.setNtfcNeed("ALN01");
            		dao.updateLastTime(manager);
            	}
            	else 
            	{	
            		// 현재 시간과 마지막 알림 시간 차이를 설정한 알림 간격과 비교 후 저장
            		if ((nowTime.getTime() - lastRegistTime.getTime()) >= alertTermToMilliSecond)
                	{
                		manager.setNtfcNeed("ALN01");
                		dao.updateLastTime(manager);
                	}
                	else
                	{
                		manager.setNtfcNeed("ALN02");
                	}
            	}
        	}
            manager.setMsg(vo.getMsg());
            manager.setLogde(vo.getLogde());
            dao.setNotiInfo(manager);
        }
        
        return true;
        
    }

    @Override
    public int ipAllowCheck(String ip)
    {
        return dao.ipAllowCheck(ip);
    }

    @Override
    public void plusEventHistory(ParamVO vo)
    {
        dao.plusEventHistory(vo);
    }
    
}
