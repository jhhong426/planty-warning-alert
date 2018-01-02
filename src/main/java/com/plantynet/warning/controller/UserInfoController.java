package com.plantynet.warning.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/userInfo/*")
public class UserInfoController
{
    
    //사용자 정보 페이지 접근 
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String userInfoGET()
    {
        return "userInfo";
    }
    
    @RequestMapping(value="/changeInfo", method=RequestMethod.POST)
    public String changeUserInfo(String test)
    {
        System.out.println(test);
        return "userInfo";
    }
    
    @ResponseBody
    @RequestMapping(value="/changePw", method=RequestMethod.POST)
    public Map<String, Boolean> changeUserPassword()
    {
        
        Map<String, Boolean> map = new HashMap<>();
        
        return map;
    }
    
}
