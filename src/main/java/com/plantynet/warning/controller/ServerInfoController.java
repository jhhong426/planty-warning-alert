package com.plantynet.warning.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ServerInfoController {
	@RequestMapping(value = "/serverInfo", method = RequestMethod.GET)
	public String userInfoGET() {
		return "serverInfo";
	}

}
