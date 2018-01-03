package com.plantynet.warning.service;

import java.util.HashMap;
import java.util.Map;

import com.plantynet.warning.vo.ManagerVO;

public interface UserInfoService
{
    public ManagerVO getUserInfo(int managerId);
    
    public int checkPassword(HashMap<String, String> map);
    
    public void changeUserPassword(Map<String, Object> map);
    
    public void changeUserInfo(ManagerVO vo);
}
