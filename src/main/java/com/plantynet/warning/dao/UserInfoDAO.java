package com.plantynet.warning.dao;

import java.util.Map;

import com.plantynet.warning.vo.ManagerVO;

public interface UserInfoDAO
{
    public ManagerVO getUserInfo(int managerId);
    
    public void changeUserPassword(Map<String, Object> map);
    
    public void changeUserInfo(ManagerVO vo);
}
