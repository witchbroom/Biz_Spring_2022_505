package com.root.emr.persistance;

import com.root.emr.model.EmrVO;

public interface EmrDao extends GenericDao<EmrVO, Long> {
	
	public void create_chart_table();
	public void create_dise_table();

}
