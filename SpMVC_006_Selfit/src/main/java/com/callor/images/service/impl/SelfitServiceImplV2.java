package com.callor.images.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.callor.images.config.QualifierConfig;
import com.callor.images.model.StartMenuDTO;
import com.callor.images.model.WorkOutDTO;
import com.callor.images.persistance.SelfitDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(QualifierConfig.SERVICE.SELFIT_V2)
public class SelfitServiceImplV2 extends SelfitServiceImplV1{
	
	public SelfitServiceImplV2(SelfitDao selfitDao) {
		super(selfitDao);
	}	

	@Override
	public void startPage(Model model) {
		

		List<StartMenuDTO> beginMenus = selfitDao.selectByScNum("01");
		List<StartMenuDTO> middleMenus = selfitDao.selectByScNum("02");
		List<StartMenuDTO> advMenus = selfitDao.selectByScNum("03");
				
		model.addAttribute("BEGIN_MENU", beginMenus);
		model.addAttribute("MIDDLE_MENU", middleMenus);
		model.addAttribute("ADV_MENU", advMenus);
	}

	@Override
	public void getDaySetList(Model model, String sc_num) {
		super.getDaySetList(model, sc_num);
		List<StartMenuDTO> dayList = (List<StartMenuDTO>) model.getAttribute("DAYS");
		String sc_id = dayList.get(0).getSc_id();
		log.debug(sc_id);
		
		// sc_id 를 매개변수로 전달하여 view_workout 의 데이터 가져오기
		List<WorkOutDTO> workList = selfitDao.selectWorkOut(sc_id);
		model.addAttribute("WORKS", workList);
	}
	
	
	@Override
	public void getDaySetList(Model model, String sc_num, String sc_id) {
		// TODO Auto-generated constructor stub	
		super.getDaySetList(model, sc_num);
		List<WorkOutDTO> workList = selfitDao.selectWorkOut(sc_id);
		model.addAttribute("WORKS", workList);	
	}
	
	public WorkOutDTO getDayHealth(String sc_id, String list_id){
		return selfitDao.selectDayHealth(sc_id, list_id);
	}

}
