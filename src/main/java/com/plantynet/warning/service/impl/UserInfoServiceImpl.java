package com.plantynet.warning.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.omg.PortableInterceptor.USER_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.warning.dao.LoginDAO;
import com.plantynet.warning.dao.UserInfoDAO;
import com.plantynet.warning.service.UserInfoService;
import com.plantynet.warning.vo.ManagerVO;

@Service
public class UserInfoServiceImpl implements UserInfoService, USER_EXCEPTION
{
    @Autowired
    UserInfoDAO userInfoDao;
    
    @Autowired
    LoginDAO loginDao;

    @Override
    public ManagerVO getUserInfo(int managerId)
    {
        return userInfoDao.getUserInfo(managerId);
    }

    @Override
    public int checkPassword(HashMap<String, String> map)
    {
        return loginDao.login(map);
    }

    @Override
    public void changeUserPassword(Map<String, Object> map)
    {
        userInfoDao.changeUserPassword(map);
    }

    @Override
    public void changeUserInfo(ManagerVO vo)
    {
        userInfoDao.changeUserInfo(vo);
    }

}
