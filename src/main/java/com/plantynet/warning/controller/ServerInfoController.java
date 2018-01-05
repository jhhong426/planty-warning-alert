package com.plantynet.warning.controller;


import java.util.HashMap;
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
    	SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
    	int teamId = sessionVO.getTeamId();
    	List<ServerVO> serverList = serverListService.getServerList(teamId);
    	model.addAttribute("serverList",serverList);
        return "serverList";
    }
    
    @RequestMapping(value = "/searchServer", method = RequestMethod.GET)
    public String serverListBy(Model model,@RequestParam("method") String method,@RequestParam("keyword")String keyword){
    	List<ServerVO> serverList;
    	if(method.equals("serverNm")) {
    		serverList = serverListService.getServerListByServerNm(keyword);
    	}else if(method.equals("ip")) {
    		serverList =serverListService.getServerListByIp(keyword);
    	}else {
    		System.out.println("값이 이상한데 .? \n메소드:"+method + "\n 키워드:"+keyword);
    		serverList = null;
    	}
    	System.out.println(method +keyword);
    	model.addAttribute("serverList",serverList);
        return "serverList";
    }
    
    @RequestMapping(value = "/addServer", method = RequestMethod.GET)
    public String addServer(Model model, ServerVO serverVO,HttpSession session ){
    	System.out.println("삽입 수행\n ip:"+serverVO.getIp()+"\n serverNm :"+serverVO.getServerNm());
    	SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
    	int teamId = sessionVO.getTeamId();
    	serverVO.setTeamId(teamId);
    	serverListService.addServer(serverVO);
        return "redirect:/serverList";
    }
    
    @RequestMapping(value = "/updateServer", method = RequestMethod.POST)
    public String updateServer(Model model, ServerVO serverVO ){
    	System.out.println(serverVO.toString());
    	serverListService.updateServer(serverVO);
        return "redirect:/serverList";
    }
    
    @RequestMapping(value = "/deleteServer", method = RequestMethod.POST)
    public String updateServer(Model model, @RequestParam("serverId")int serverId ){
    	System.out.println("삭제 수행\n 서버 아이디:"+serverId);
    	serverListService.deleteServer(serverId);
        return "redirect:/serverList";
    }
    
	@RequestMapping(value = "/serverInfo", method = RequestMethod.GET)
	public String serverInfoGET(Model model,HttpServletRequest request, HttpSession session, Integer id) {
	    
	    SessionVO sessionVo = (SessionVO) session.getAttribute("sessionVO");   
	    String prePath = request.getHeader("referer");
	    if(prePath == null)
	    {
	        return "errorPage";
	    }
	    model.addAttribute("managerList", adminService.getManagerListByTeamId(sessionVo.getTeamId()));
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
    public Map<String, Boolean> updateEvntMngr(ManagerInChargeVO vo){
        
        Map<String, Boolean> map = new HashMap<>();
        
        serverInfoService.updateEvntMngr(vo);
        map.put("flag", true);
        
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
    public Map<String, Boolean> plusEvntMngr(ManagerInChargeVO vo){
        Map<String, Boolean> map = new HashMap<>();
        
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