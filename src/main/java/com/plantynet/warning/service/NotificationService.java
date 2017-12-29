package com.plantynet.warning.service;

import com.plantynet.warning.vo.ParamVO;

public interface NotificationService
{
    public void setNotiInfo(ParamVO vo);
    
    public int ipAllowCheck(String ip);
}
