package com.root.emr.persistance;

import java.util.List;

import com.root.emr.model.ApiVO;

public interface ApiDao extends GenericDao<ApiVO, String>{
	
	public List<ApiVO> findByKorNm(String korNm);

}
