package com.plantynet.warning.service.impl;

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
    public void setNotiInfo(ParamVO vo)
    {
        List<NotiInfoVO> managerInfos = dao.getManagerInfo(vo);
        
        for (NotiInfoVO manager : managerInfos)
        {
            manager.setMsg(vo.getMsg());
            manager.setLogde(vo.getLogde());
            dao.setNotiInfo(manager);
        }
        
        
    }

    @Override
    public int ipAllowCheck(String ip)
    {
        return dao.ipAllowCheck(ip);
    }
    
}
