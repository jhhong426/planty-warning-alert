package com.plantynet.warning.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantynet.warning.service.NotificationService;
import com.plantynet.warning.vo.ParamVO;

@Controller
@RequestMapping("/alert/*")
public class AlertAPIController
{
    @Autowired
    NotificationService service;
    
    @ResponseBody
    @RequestMapping(value="/api", method=RequestMethod.GET)
    public Map<String, Integer> setNotiInfoForAlert(HttpServletRequest req, ParamVO vo)
    {
        
        Map<String, Integer> map = new HashMap<>();
        
        //예외 처리 1. 값이 제대로 전달 되지 않았을 때(response_code = 3)
        if(vo.getIp() == null || vo.getEventCode() == null || vo.getLodge() == null || vo.getMsg() == null)
        {
            map.put("response_code", 3);
            return map;
        }
        //예외처리 2. 파라미터로 넘어온 IP값과 송신 서버의 IP가 일치 하지 않을 때(response_code = 2)
//        if(!vo.getIp().equals(req.getRemoteAddr()))
//        {
//            map.put("response_code", 2);
//            return map;
//        }
        
        //예외 처리 3. IP가 현재 DB에 저장되어 있지 않을 때(response_code = 0)
        if(service.ipAllowCheck(vo.getIp()) == 0)
        {
            map.put("response_code", 0);
            return map;
        }
        else
        {
            //정상 저장 (response_code = 1)
            service.setNotiInfo(vo);
            map.put("response_code", 1);
            return map;
        }
        
    }
}
