package com.root.emr.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmrVO {
	
	private long seq;
	private String name;
	private String age;
	private String sex;
	private String disease;
	private String karte;
	
	private String code;
	private String dis;

}
