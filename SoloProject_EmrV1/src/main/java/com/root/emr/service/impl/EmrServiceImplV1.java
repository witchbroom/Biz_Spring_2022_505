package com.root.emr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.root.emr.model.EmrVO;
import com.root.emr.persistance.EmrDao;
import com.root.emr.service.EmrService;

@Service
public class EmrServiceImplV1 implements EmrService{
	
	@Autowired
	private EmrDao emrDao;

	@Override
	public void create_chart_table() {
		emrDao.create_chart_table();		
	}

	@Override
	public List<EmrVO> selectAll() {
		return emrDao.selectAll();
	}

	@Override
	public EmrVO findById(Long seq) {
		return emrDao.findById(seq);
	}

	@Override
	public int insert(EmrVO vo) {
		return emrDao.insert(vo);
	}

	@Override
	public int update(EmrVO vo) {
		return emrDao.update(vo);
	}

	@Override
	public int delete(Long seq) {
		return emrDao.delete(seq);
	}

	@Override
	public void create_dise_table() {
		emrDao.create_dise_table();
	}

}
