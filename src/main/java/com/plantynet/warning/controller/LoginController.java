package com.plantynet.warning.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void submit(Model model,@RequestParam("id") String id , @RequestParam("password") String password) {
		System.out.println("�� ����");
		System.out.println("id : " + id + "\npass :" + password);
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void submit1(Model model,@RequestParam("id") String id , @RequestParam("password") String password) {
		System.out.println("�� ����");
		System.out.println("id : " + id + "\npass :" + password);
	}
}
