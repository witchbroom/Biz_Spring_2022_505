package com.callor.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.school.domain.StudentVO;
import com.callor.school.service.StudentService;

/*
 * Controller level 에 @RequestMapping을 설정하면
 * Controller 의 mapping과 method의 mapping이 서로 연결되어
 * RequestMapping을 구성한다
 * localhost:8080/school/student : StudentController 의 mapping 이 연결
 * localhost:8080/school/student/list : StudentController#list() 의 mapping 이 연결
 */
@RequestMapping(value="/student")
@Controller
public class StudentController {
	
	/*
	 * Dependency inject 중
	 * 생성자 injection
	 */
	private final StudentService stService;
	public StudentController(StudentService stService) {
		this.stService = stService;
	}
	
	/*
	 * return type이 String type인 method의 경우
	 * null값을 return 하면 Request Path와 같은 jsp 파일을 찾아서
	 * rendering을 수행한다
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("ST_LIST", stService.selectAll());
		return null;
	}
	
	@RequestMapping(value="/input",method=RequestMethod.GET)
	public String input() {
		return "student/input";
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(String stNum, Model model) {
		StudentVO stVO = stService.findByStNum(stNum);
		model.addAttribute("ST",stVO);		
		return null;
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update() {
		return "student/update";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete() {
		return "student/delete";
	}

}
