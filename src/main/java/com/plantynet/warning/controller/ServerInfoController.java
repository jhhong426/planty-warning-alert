package com.plantynet.warning.controller;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantynet.warning.service.AdminService;
import com.plantynet.warning.service.ServerInfoService;
import com.plantynet.warning.service.impl.ServerListServiceImpl;
import com.plantynet.warning.vo.EventVO;
import com.plantynet.warning.vo.ManagerInChargeVO;
import com.plantynet.warning.vo.ServerVO;
import com.plantynet.warning.vo.SessionVO;

@Controller
public class ServerInfoController {
	
	@Autowired
	ServerListServiceImpl serverListService;
	
	@Autowired
	ServerInfoService serverInfoService;
	
	@Autowired
	AdminService adminService;
	
    @RequestMapping(value = "/serverList", method = RequestMethod.GET)
    public String serverListGET(Model model,HttpSession session){
    	List<ServerVO> serverList = serverListService.getServerList();
    	model.addAttribute("serverList",serverList);
        return "serverList";
    }
    
    @RequestMapping(value = "/checkServerList", method = RequestMethod.POST)
    public @ResponseBody HashMap<String,Boolean> checkServerList(Model model,HttpSession session, ServerVO serverVO){
    	
    	HashMap<String,Boolean> map = new HashMap<>();
    	
    	// IP 중복 허용으로 주석처리
//    	List<ServerVO> serverListByIp = serverListService.getServerListByIp(serverVO.getIp());
//    	if(serverListByIp.size()==0) {
//    		map.put("isIpExist", false);
//    	}else {
//    		map.put("isIpExist", true);
//    	}

    	map.put("isIpExist", false);
    	
    	List<ServerVO> serverListByServerNm = serverListService.getServerListByServerNmAndTeamId(serverVO);
    	if(serverListByServerNm.size()==0) {
    		map.put("isServerNmExist", false);
    	}else {
    		map.put("isServerNmExist", true);
    	}
    	return map;
    }

    @RequestMapping(value = "/addServer", method = RequestMethod.POST)
    public String addServer(Model model, ServerVO serverVO,HttpSession session ){
    	serverListService.addServer(serverVO);
        return "redirect:/serverList";
    }
    
    @RequestMapping(value = "/updateServer", method = RequestMethod.POST)
    public String updateServer(Model model, ServerVO serverVO ){
    	serverListService.updateServer(serverVO);
        return "redirect:/serverList";
    }
    
    @RequestMapping(value = "/deleteServer", method = RequestMethod.POST)
    public String deleteServer(Model model, @RequestParam("serverId")int serverId ){
        
    	serverListService.deleteServer(serverId);
        return "redirect:/serverList";
    }
    
	@RequestMapping(value = "/serverInfo", method = RequestMethod.GET)
	public String serverInfoGET(Model model,HttpServletRequest request, HttpSession session, Integer id) {
	    
	    String prePath = request.getHeader("referer");
	    if(prePath == null)
	    {
	        return "errorPage";
	    }
	    
	    model.addAttribute("managerList", adminService.getManagerList());
	    model.addAttribute("serverInfo", serverInfoService.getServerInfo(id));
	    model.addAttribute("eventList", serverInfoService.getServerEventList(id));
	    model.addAttribute("eventMngrInfoList", serverInfoService.getManagerInChargeList(id));
	    
		return "serverInfo";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateEvent", method=RequestMethod.POST)
	public Map<String, Boolean> updateEvent(EventVO vo){
	    
	    Map<String, Boolean> map = new HashMap<>();
	    serverInfoService.updateEvent(vo);
	    map.put("flag", true);
	    
	    return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteEvent", method=RequestMethod.POST)
	public Map<String, Boolean> deleteEvent(int eventId){
	    
	    Map<String, Boolean> map = new HashMap<>();
        
	    serverInfoService.deleteEvent(eventId);
        map.put("flag", true);
        
        return map;
	}
	
	@ResponseBody
    @RequestMapping(value="/updateEvntMngr", method=RequestMethod.POST)
    public Map<String, Boolean> updateEvntMngr(ManagerInChargeVO vo, Integer inputTermVal){
        
        Map<String, Boolean> map = new HashMap<>();
        
        if(vo.getAlertTerm() != 99999999 && vo.getAlertTerm() != 0)
        {
        	vo.setAlertTerm(inputTermVal);
        }
        if(serverInfoService.updateEvntMngr(vo))
        {
            map.put("flag", true);
        }
        else
        {
            map.put("flag", false);
        }
        
        return map;
        
    }
	
	@ResponseBody
    @RequestMapping(value="/deleteEvntMngr", method=RequestMethod.POST)
    public Map<String, Boolean> deleteEvntMngr(ManagerInChargeVO vo){
        Map<String, Boolean> map = new HashMap<>();
        
        serverInfoService.deleteEvntMntr(vo);
        map.put("flag", true);
        
        return map;
        
    }
	
	@ResponseBody
    @RequestMapping(value="/plusEvent", method=RequestMethod.POST)
    public Map<String, Boolean> plusEvent(EventVO vo){
        Map<String, Boolean> map = new HashMap<>();
        
        if(serverInfoService.plusEvent(vo))
        {
            map.put("flag", true);
        }
        else
        {
            map.put("flag", false);
        }
        
        return map;
        
    }
	
	@ResponseBody
    @RequestMapping(value="/plusEvntMngr", method=RequestMethod.POST)
    public Map<String, Boolean> plusEvntMngr(ManagerInChargeVO vo, Integer inputTermVal){
        
		Map<String, Boolean> map = new HashMap<>();
        
        if(vo.getAlertTerm() != 99999999 && vo.getAlertTerm() != 0)
        {
        	vo.setAlertTerm(inputTermVal);
        }
        
        if(serverInfoService.plusEvntMngr(vo))
        {
            map.put("flag", true);
        }
        else
        {
            map.put("flag", false);
        }
        
        return map;
        
    }

}