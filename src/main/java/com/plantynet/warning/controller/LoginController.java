package com.plantynet.warning.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantynet.warning.dao.impl.LoginDAOImpl;

@Controller
public class LoginController {

	@Autowired
	LoginDAOImpl loginDAO;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String submit(Model model, @RequestParam("id") String id, @RequestParam("password") String password) {
		System.out.println("���� ���Խ��ϴ�");
		System.out.println("id : " + id + "\npass :" + password);
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", password);
		int result = loginDAO.login(map);
		if (result >= 1) {
			System.out.println("�α��� ����");
			return "home";
		}else {
			System.out.println("�α��� ����");
			return "login";
		}

	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void submit1(Model model, @RequestParam("id") String id, @RequestParam("password") String password) {
		System.out.println("�׽�Ʈ��");
		System.out.println("id : " + id + "\npass :" + password);

	}
}
