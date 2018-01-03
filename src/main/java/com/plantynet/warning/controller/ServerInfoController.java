package com.plantynet.warning.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServerInfoController {
    @RequestMapping(value = "/serverList", method = RequestMethod.GET)
    public String serverListGET(){
        return "serverList";
    }
	@RequestMapping(value = "/serverInfo", method = RequestMethod.GET)
	public String serverInfoGET() {
		return "serverInfo";
	}
}