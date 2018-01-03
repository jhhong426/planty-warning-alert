package com.plantynet.warning.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServerInfoController {
	@RequestMapping(value = "/serverInfo", method = RequestMethod.GET)
	public String userInfoGET() {
		return "serverInfo";
	}

}
