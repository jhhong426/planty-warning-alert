package com.plantynet.warning.service;

import com.plantynet.warning.vo.ParamVO;

public interface NotificationService
{
    public boolean setNotiInfo(ParamVO vo);
    
    public int ipAllowCheck(String ip);
    
    public void plusEventHistory(ParamVO vo);
}
