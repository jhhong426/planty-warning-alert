package com.plantynet.warning.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plantynet.warning.dao.impl.ServerListDAOImpl;


@Controller
public class ServerListController {
	@Autowired
	ServerListDAOImpl serverListDAO; 
	
	@RequestMapping(value = "/serverList", method = RequestMethod.GET)
	public void login(Model model, HttpServletRequest request) {
		
	}

}
