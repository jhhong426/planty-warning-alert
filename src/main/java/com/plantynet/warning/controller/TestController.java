package com.plantynet.warning.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plantynet.warning.dao.TestDAO;
import com.plantynet.warning.dao.impl.TestDAOImpl;
import com.plantynet.warning.vo.ManagerVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TestController {
	@Inject
	private TestDAOImpl testdao;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("�̰� �׽�Ʈ�� �Ӹ�");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		ManagerVO vo = testdao.test();
		
		model.addAttribute("vo", vo);
		return "test";
	}
	
}
