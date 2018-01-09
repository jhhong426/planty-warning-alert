package com.plantynet.warning.dao;

import java.util.List;

import com.plantynet.warning.vo.NotiInfoVO;
import com.plantynet.warning.vo.ParamVO;

public interface NotificationDAO
{
    public List<NotiInfoVO> getManagerInfo(ParamVO vo);
    
    public void setNotiInfo(NotiInfoVO vo);
    
    public int ipAllowCheck(String ip);
    
    public void plusEventHistory(ParamVO vo);
    
}
