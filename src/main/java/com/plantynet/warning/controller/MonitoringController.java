package com.plantynet.warning.controller;

import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantynet.warning.service.MonitoringService;
import com.plantynet.warning.service.ServerInfoService;
import com.plantynet.warning.vo.ManagerVO;
import com.plantynet.warning.vo.MonitoringVO;
import com.plantynet.warning.vo.SessionVO;

@Controller
public class MonitoringController {

	@Autowired
	MonitoringService monitoringService;
	@Autowired
	ServerInfoService serverInfoService;
	
	// 모니터링 페이지
	@RequestMapping(value = "/monitoring", method = RequestMethod.GET)
	public String monitoring(Model model, HttpSession session) 
		throws Exception {
		model.addAttribute("today", monitoringService.getDate());
		//model.addAttribute("", service.getGlobalLineStat(teamId));
		//model.addAttribute("", service.getGlobalBarStat(teamId));
		return "monitoring";
	}
	
	// 모니터링 리스트 페이지
	@RequestMapping(value = "/monitoringList", method = RequestMethod.GET)
	public String monitoringList(Model model, HttpSession session) 
		throws Exception {
		

		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		
		model.addAttribute("serverList", monitoringService.getServerList(sessionVO.getTeamId()));
		//model.addAttribute("codeList", service.getCodeList(1));
		model.addAttribute("errorLogList", monitoringService.getErrorLogList(sessionVO.getTeamId()));
		return "monitoringList";
	}
	
	//모니터링 상세 페이지
	@RequestMapping(value = "/monitoringServer", method = RequestMethod.GET)
	public String monitoringServer(Integer serverId, Model model)
		throws Exception {
		model.addAttribute("serverInfo", serverInfoService.getServerInfo(serverId));
		//model.addAttribute("", service.getServerLineStat(serverId));
		//model.addAttribute("", service.getServerBarStat(serverId));
		return "monitoringServer";
	}

	@ResponseBody
	@RequestMapping(value = "/monitoringList/changeServer", method = RequestMethod.POST)
	public Map<String, Object> changeServer(@RequestParam("serverId") int serverId, HttpSession session) 
		throws Exception {
		
			Map<String, Object> map = new HashMap<String,Object>();
			List<MonitoringVO> list = (List<MonitoringVO>) monitoringService.getCodeList(serverId);
			map.put("result", list);
			
			

//        Map<String, Integer> serverIdMap = new HashMap<>();
//        List<MonitoringVO> list = new ArrayList<>();
//        list = (List<MonitoringVO>) service.getCodeList(serverId);
//        System.out.println(list);


		return map;
	}
	
}
