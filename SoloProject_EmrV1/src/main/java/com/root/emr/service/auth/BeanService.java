package com.root.emr.service.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.root.emr.persistance.EmrDao;
import com.root.emr.persistance.UserDao;

@Service
public class BeanService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private EmrDao emrDao;
	
	@Bean
	public void create_table() {
		userDao.create_auth_table();
		userDao.create_user_table();
		emrDao.create_chart_table();
		emrDao.create_dise_table();
	}
	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
