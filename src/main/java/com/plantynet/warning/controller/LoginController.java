package com.plantynet.warning.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantynet.warning.dao.impl.LoginDAOImpl;
import com.plantynet.warning.vo.ManagerVO;
import com.plantynet.warning.vo.SessionVO;

@Controller
public class LoginController {

	@Autowired
	LoginDAOImpl loginDAO;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String submit(Model model, @RequestParam("id") String id, @RequestParam("password") String password,
			HttpServletRequest request) {
		System.out.println("값이 들어왔습니다\n" +"id : " + id + "\npass :" + password);
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		int result = loginDAO.login(map);
		if (result >= 1) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession(true);
			ManagerVO vo = loginDAO.getManagerByLoginId(id);
			SessionVO sessionVO = new SessionVO();
			sessionVO.setManagerId(vo.getManagerId());
			sessionVO.setTeamId(vo.getTeamId());
			sessionVO.setManagerNm(vo.getManagerNm());
			sessionVO.setLoginId(vo.getLoginId());
			sessionVO.setPhoneNo(vo.getPhoneNo());
			sessionVO.setEmail(vo.getEmail());
			
			session.setAttribute("sessionVO", sessionVO);
			
			return "admin";
		} else {
			System.out.println("로그인 실패");
			model.addAttribute("loginFail","일치하는 정보가 없습니다.");
			return "login";
		}

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
