package com.plantynet.warning.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void admin(Model model) {
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public void addAdmin(Model model, @RequestParam() String id, @RequestParam("password") String password,HttpServletRequest request) {
		System.out.println("로그인 성공");
		HttpSession session = request.getSession(false);
		System.out.println(session.getAttribute("teamId"));

	}

	// // 담당자 관리
	// @RequestMapping(value = "/admin", method = RequestMethod.GET)
	// public String admin(Model model) throws Exception {
	// return "admin";
	// }
	//
	// // 사용자 정보
	// @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	// public String user(Model model) throws Exception {
	// return "userInfo";
	// }
	//
	// // 서버 목록
	// @RequestMapping(value = "/serverList", method = RequestMethod.GET)
	// public String server(Model model) throws Exception {
	// return "serverList";
	// }
	//
	// // 모니터링
	// @RequestMapping(value = "/monitoring", method = RequestMethod.GET)
	// public String monitoring(Model model) throws Exception {
	// return "monitoring";
	// }
}
