package com.plantynet.warning.controller;

import org.springframework.ui.Model;

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
		
		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		
		model.addAttribute("today", monitoringService.getDate());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("teamId", sessionVO.getTeamId());
		
		for (int i=0; i<7; i++){
			map.put("index", i);
			model.addAttribute("day"+String.valueOf(i), monitoringService.getGlobalLineStat(map));
		}
		model.addAttribute("serverList", monitoringService.getGlobalBarStat(sessionVO.getTeamId()));
		return "monitoring";
	}
	
	// 모니터링 리스트 페이지
	@RequestMapping(value = "/monitoringList", method = RequestMethod.GET)
	public String monitoringList(Model model, HttpSession session) 
		throws Exception {

		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		
		model.addAttribute("serverList", monitoringService.getServerList(sessionVO.getTeamId()));
		model.addAttribute("errorLogList", monitoringService.getErrorLogList(sessionVO.getTeamId()));
		
		return "monitoringList";
	}
	
	// 모니터링 상세 페이지
	@RequestMapping(value = "/monitoringServer", method = RequestMethod.GET)
	public String monitoringServer(Integer serverId, Model model)
		throws Exception {
		
		// 일주일 전 날짜 ~ 오늘 날짜
		model.addAttribute("today", monitoringService.getDate());

		// 해당 서버 정보 (서버명, IP)
		model.addAttribute("serverInfo", serverInfoService.getServerInfo(serverId));
		
		// 서버 선형 그래프
		model.addAttribute("serverLineChart", monitoringService.getErrorLineStat(serverId));
		
		//서버 막대 그래프
		model.addAttribute("serverBarChart", monitoringService.getErrorBarStat(serverId));
		
		return "monitoringServer";
	}

	// 모니터링 리스트 페이지의 서버 카테고리 변경 시 해당 서버의 에러코드 목록
	@ResponseBody
	@RequestMapping(value = "/monitoringList/changeServer", method = RequestMethod.POST)
	public Map<String, Object> changeServer(@RequestParam("serverId") int serverId, HttpSession session) 
		throws Exception {
			
			Map<String, Object> map = new HashMap<String,Object>();
			List<MonitoringVO> list = (List<MonitoringVO>) monitoringService.getCodeList(serverId);
			
			map.put("result", list);

		return map;
	}

	// MonitoringServer.jsp의 Line-Chart Tooltip 가져오기
	@ResponseBody
	@RequestMapping(value = "/monitoringServer/topCode", method = RequestMethod.POST)
	public Map<String, Object> topCode(@RequestParam("serverId") int serverId, @RequestParam("rgsde") String rgsde,  HttpSession session) 
		throws Exception {
		
			HashMap<String, Object> map = new HashMap<String,Object>();
			HashMap<String, Object> resultMap = new HashMap<String,Object>();
			
			map.put("rgsde", rgsde);
			map.put("serverId", serverId);
			
			List<MonitoringVO> list = (List<MonitoringVO>) monitoringService.getTopCode(map);
			resultMap.put("result", list);

		return resultMap;
	}
	
}
