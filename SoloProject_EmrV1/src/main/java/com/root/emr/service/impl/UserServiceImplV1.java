package com.root.emr.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.root.emr.model.AuthorityVO;
import com.root.emr.model.UserVO;
import com.root.emr.persistance.UserDao;
import com.root.emr.service.UserService;

@Service("userServiceV1")
public class UserServiceImplV1 implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PasswordEncoder passEncoder;

	@Override
	public void create_user_table() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void create_auth_table() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<AuthorityVO> select_auths(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int role_insert(List<AuthorityVO> auths) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public int insert(UserVO vo) {
		List<UserVO> userList = userDao.selectAll();
		List<AuthorityVO> authList = new ArrayList<>();
		
		// 최초에 가입하는 회원
		if(userList == null || userList.size() < 1) {
			authList.add(AuthorityVO.builder()
							.username(vo.getUsername())
							.authority("ROLE_ADMIN")
							.build()
					);
			authList.add(AuthorityVO.builder()
					.username(vo.getUsername())
					.authority("ROLE_USER")
					.build()
			);
			vo.setEnabled(true);
		} else {
			authList.add(AuthorityVO.builder()
					.username(vo.getUsername())
					.authority("ROLE_USER")
					.build()
			);
			vo.setEnabled(false);
		}
		
		// 회원정보의 비밀번호를 암호화 하기
		/*
		 * vo 에 담긴 평문 비번을 get 하여
		 * passEncoder 의 encode() method 를 사용하여 암호화하고
		 * 다시 vo 의 password 에 setting
		 */
		String encPassword = passEncoder.encode(vo.getPassword());
		vo.setPassword(encPassword);
		
		int ret = userDao.role_insert(authList);
		ret += userDao.insert(vo);
		return ret;
	}

	@Override
	public int update(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
