package com.plantynet.warning.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantynet.warning.service.impl.AdminServiceImpl;
import com.plantynet.warning.vo.ManagerVO;
import com.plantynet.warning.vo.SessionVO;

@Controller
public class AdminController {

	@Autowired
	AdminServiceImpl adminService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void admin(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		int teamId = sessionVO.getTeamId();

		// 담당자 목록
		List<ManagerVO> list = adminService.getManagerListByTeamId(teamId);
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public void addAdmin(Model model, @RequestParam("email1") String email1, @RequestParam("email2") String email2,
			@RequestParam("phoneNo1") String phoneNo1, @RequestParam("phoneNo2") String phoneNo2,
			@RequestParam("phoneNo3") String phoneNo3, ManagerVO managerVO, HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		String email = email1 + "@" + email2;
		String phoneNo = phoneNo1 + phoneNo2;
		int teamId = sessionVO.getTeamId();

		// 어드민 등록
		managerVO.setEmail(email);
		managerVO.setPhoneNo(phoneNo);
		managerVO.setTeamId(teamId);
		managerVO.toString();
		adminService.addAdmin(managerVO);

	}

	@RequestMapping(value = "/deleteAdmin", method = RequestMethod.POST)
	public String deleteAdmin(Model model, @RequestParam("managerId") int managerId) {
		System.out.println("딜리트 컨트롤러");
		System.out.println(managerId);
		adminService.deleteAdmin(managerId);
		return "redirect:/admin";
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
