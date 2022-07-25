package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

@Controller
@RequestMapping(value="/student")
public class StudentController {
	
	private StudentService stService;

	
	// JSON type으로 return
	@ResponseBody
	@RequestMapping(value={"/",""},method=RequestMethod.GET)
	// 학생리스트를 return 하기위해 return type을 List type으로
	public List<StudentVO> home() {
		List<StudentVO> stList = stService.selectAll();
		return stList;
	}
	
}
