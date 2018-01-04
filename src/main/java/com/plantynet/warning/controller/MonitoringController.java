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
import com.plantynet.warning.vo.ManagerVO;
import com.plantynet.warning.vo.MonitoringVO;

@Controller
public class MonitoringController<MonitoringVO> {

	@Autowired
	MonitoringService service;
	
	// 모니터링 페이지
	@RequestMapping(value = "/monitoring", method = RequestMethod.GET)
	public String monitoring(Model model, HttpSession session) 
		throws Exception {
		//model.addAttribute("", service.getGlobalLineStat(teamId));
		//model.addAttribute("", service.getGlobalBarStat(teamId));
		return "monitoring";
	}
	
	// 모니터링 리스트 페이지
	@RequestMapping(value = "/monitoringList", method = RequestMethod.GET)
	public String monitoringList(Model model, HttpSession session) 
		throws Exception {
		

		ManagerVO loginSession = (ManagerVO) session.getAttribute("login");
		
		model.addAttribute("serverList", service.getServerList(1));
		model.addAttribute("codeList", service.getCodeList(1));
		model.addAttribute("errorLogList", service.getErrorLogList(1));
		return "monitoringList";
	}
	
	//모니터링 상세 페이지
	@RequestMapping(value = "/monitoringServer", method = RequestMethod.GET)
	public String monitoringServer(@RequestParam("serverId") int serverId, Model model)
		throws Exception {
		//model.addAttribute("", service.getServerInfo(serverId));
		//model.addAttribute("", service.getServerLineStat(serverId));
		//model.addAttribute("", service.getServerBarStat(serverId));
		return "monitoringServer";
	}

	@ResponseBody
	@RequestMapping(value = "/monitoring/list/changeServer", method = RequestMethod.POST)
	public Map<String, Object> changeServer(@RequestParam("serverId") int serverId, HttpSession session) 
		throws Exception {
		
			Map<String, Object> map = new HashMap<String,Object>();
			
			@SuppressWarnings("unchecked")
			List<MonitoringVO> list = (List<MonitoringVO>) service.getCodeList(serverId);
			map.put("result", list);
			
			

//        Map<String, Integer> serverIdMap = new HashMap<>();
//        List<MonitoringVO> list = new ArrayList<>();
//        list = (List<MonitoringVO>) service.getCodeList(serverId);
//        System.out.println(list);


		return map;
	}
	
}
