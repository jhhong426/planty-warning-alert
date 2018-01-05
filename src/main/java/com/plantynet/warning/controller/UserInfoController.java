package com.plantynet.warning.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantynet.warning.service.UserInfoService;
import com.plantynet.warning.vo.ManagerVO;
import com.plantynet.warning.vo.SessionVO;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController
{
    @Autowired
    UserInfoService userInfoService;
    
    
    //사용자 정보 페이지 접근 
    @RequestMapping(value="", method=RequestMethod.GET)
    public String userInfoGET(Model model, HttpSession session)
    {
        SessionVO sessionVo = (SessionVO) session.getAttribute("sessionVO");
        ManagerVO managerVo = userInfoService.getUserInfo(sessionVo.getManagerId());
        
        
        String phoneNo = managerVo.getPhoneNo();
        String email = managerVo.getEmail();
        
        String phoneNoOne = phoneNo.substring(0,3);
        String phoneNoTwo = phoneNo.substring(3,7);
        String phoneNoThree = phoneNo.substring(7,11);
        String[] splitEmail = email.split("@");
        
        model.addAttribute("phoneNoOne", phoneNoOne);
        model.addAttribute("phoneNoTwo", phoneNoTwo);
        model.addAttribute("phoneNoThree", phoneNoThree);
        model.addAttribute("splitEmail", splitEmail);
        
        StringBuffer buffer = new StringBuffer(managerVo.getPhoneNo());
        buffer.insert(3, "-");
        buffer.insert(8, "-");
        managerVo.setPhoneNo(buffer.toString());
        
        model.addAttribute("userInfo", managerVo);
        
        return "userInfo";
    }
    
    @ResponseBody
    @RequestMapping(value="/changeInfo", method=RequestMethod.POST)
    public Map<String, Boolean> changeUserInfo(ManagerVO vo)
    {
        Map<String, Boolean> map = new HashMap<>();
        
        try
        {
            userInfoService.changeUserInfo(vo);
            map.put("flag", true);
        } catch (Exception e)
        {
            map.put("flag", false);
        }
        
        return map;
    }
    
    @ResponseBody
    @RequestMapping(value="/changePw", method=RequestMethod.POST)
    public Map<String, Boolean> changeUserPassword(HttpSession session, String orginPassword, String changePassword)
    {   
        SessionVO sessionVo = (SessionVO) session.getAttribute("sessionVO");
        Map<String, Boolean> resultMap = new HashMap<>();
        HashMap<String, String> loginMap = new HashMap<>();
        Map<String, Object> changeMap = new HashMap<>();
        
        loginMap.put("id", sessionVo.getLoginId());
        loginMap.put("password", orginPassword);
        
        if(userInfoService.checkPassword(loginMap) == 0)
        {
            resultMap.put("flag", false);
        }
        else{
            changeMap.put("managerId", sessionVo.getManagerId());
            changeMap.put("changePassword", changePassword);
            userInfoService.changeUserPassword(changeMap);
            resultMap.put("flag", true);
        }
        return resultMap;
    }
    
}
