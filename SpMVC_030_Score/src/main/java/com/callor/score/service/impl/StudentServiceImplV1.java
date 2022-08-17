package com.callor.score.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.model.StudentVO;
import com.callor.score.persistance.StudentDao;
import com.callor.score.service.StudentService;


@Service
public class StudentServiceImplV1 implements StudentService {

	private final StudentDao stDao;
	public StudentServiceImplV1(StudentDao stDao) {
		this.stDao = stDao;
	}
	
	
	@Override
	public List<StudentVO> selectAll() {
		return stDao.selectAll();
	}

	@Override
	public StudentVO findById(String id) {
		return stDao.findById(id);
	}

	@Override
	public int insert(StudentVO vo) {
		return stDao.insert(vo);
	}

	@Override
	public int update(StudentVO vo) {
		return 0;
	}

	@Override
	public int delete(String st_num) {
		return stDao.delete(st_num);
	}

}
