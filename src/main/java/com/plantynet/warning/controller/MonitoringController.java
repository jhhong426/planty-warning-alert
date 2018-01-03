package com.plantynet.warning.controller;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MonitoringController {

	// 모니터링 페이지
	@RequestMapping(value = "/monitoring", method = RequestMethod.GET)
	public String monitoring(Model model) {
		return "monitoring";
	}
	
	// 모니터링 리스트 페이지
	@RequestMapping(value = "/monitoring/list", method = RequestMethod.GET)
	public String monitoringList(Model model) {
		return "monitoringList";
	}

	
}
