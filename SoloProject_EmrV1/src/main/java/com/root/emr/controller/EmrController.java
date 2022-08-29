package com.root.emr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.root.emr.model.EmrVO;
import com.root.emr.service.EmrService;

@Controller
@RequestMapping(value="/emrs")
public class EmrController {
	
	@Autowired
	private EmrService emrService;
	
	@RequestMapping(value={"","/"},method=RequestMethod.GET)
	public String home(Model model) {
		List<EmrVO> emrList = emrService.selectAll();
		model.addAttribute("PATIS",emrList);
		return "emrs/chart";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert() {
		return "redirect:/emrs";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(EmrVO vo) {
		
		
		emrService.insert(vo);
		return "redirect:/emrs";
	}
	
	@RequestMapping(value="/detail/{seq}",method=RequestMethod.GET)
	public String detail(@PathVariable("seq") long seq, @ModelAttribute("PATI") EmrVO emrVO, Model model) throws Exception {
		
		model.addAttribute(emrService.findById(seq));
		model.addAttribute("PATI", emrService.findById(seq));
		return "patis/detail";
	}
	
	@RequestMapping(value="/update/{seq}",method=RequestMethod.GET)
	public String update(@PathVariable("seq") long seq, @ModelAttribute("PATI") EmrVO emrVO, Model model) {
		
		model.addAttribute("PATI", emrService.findById(seq));
		return "patis/update";
	}
	
	@RequestMapping(value="/update/{seq}",method=RequestMethod.POST)
	public String update(@PathVariable("seq") long seq, @ModelAttribute("PATI") EmrVO emrVO) {
		emrVO.setSeq(seq);
		emrService.update(emrVO);
		return "redirect:/emrs";
	}
	
	@RequestMapping(value="/delete/{seq}",method=RequestMethod.GET)
	public String delete(@PathVariable("seq") long seq) {
		emrService.delete(seq);
		return "redirect:/emrs";
	}
	
	

}
