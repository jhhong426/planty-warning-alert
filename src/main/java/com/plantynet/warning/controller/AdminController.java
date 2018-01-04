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

		List<ManagerVO> list = adminService.getManagerListByTeamId(teamId);
		
		for (ManagerVO managerVO : list) {
			StringBuffer buffer = new StringBuffer(managerVO.getPhoneNo());
			buffer.insert(3, "-");
			buffer.insert(8, "-");
			managerVO.setPhoneNo(buffer.toString());
		}
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String addAdmin(Model model, @RequestParam("email1") String email1, @RequestParam("email2") String email2,
			@RequestParam("phoneNo1") String phoneNo1, @RequestParam("phoneNo2") String phoneNo2,
			@RequestParam("phoneNo3") String phoneNo3, ManagerVO managerVO, HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		String email = email1 + "@" + email2;
		String phoneNo = phoneNo1 + phoneNo2 + phoneNo3;
		int teamId = sessionVO.getTeamId();

		managerVO.setEmail(email);
		managerVO.setPhoneNo(phoneNo);
		managerVO.setTeamId(teamId);
		managerVO.toString();
		adminService.addAdmin(managerVO);
		return "redirect:/admin";
	}

	@RequestMapping(value = "/deleteAdmin", method = RequestMethod.POST)
	public String deleteAdmin(Model model, @RequestParam("managerId") int managerId) {
		System.out.println(managerId);
		adminService.deleteAdmin(managerId);
		return "redirect:/admin";
	}

}
