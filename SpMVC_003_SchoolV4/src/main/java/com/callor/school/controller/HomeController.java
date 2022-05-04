package com.callor.school.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.school.persistance.StudentDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private final StudentDao stDao;
	
	public HomeController(StudentDao stDao) {
		this.stDao = stDao;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping(value="/",method=RequestMethod.POST)
	public String home(String username, String tel, Model model) {
		model.addAttribute("username", username);
		model.addAttribute("tel", tel);
		return "home";
	}
	
}
