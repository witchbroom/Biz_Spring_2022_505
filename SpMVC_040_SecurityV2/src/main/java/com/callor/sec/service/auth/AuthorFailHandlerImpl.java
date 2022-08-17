package com.callor.sec.service.auth;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

/*
 * 현재 UserDetailsService 와 AuthorProvider 에서
 * 인증을 실행하는 중간에 문제가 생기면
 * == 문제 : username 이 table에 없거나, password가 틀렸거나 enabled 칼럼의 값이 false이거나
 * exception을 강제로 발생시켰다
 * 이 exception을 custom하여 exception 과정에서 만들어진 message를
 * login 화면에 보여주는 일을 수행한다
 */
public class AuthorFailHandlerImpl extends SimpleUrlAuthenticationFailureHandler{

	/*
	 * 인증과정에서 exception이 발생하면 처리할 이벤트 핸들러
	 */
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String exceptionMessage = "";
		String redirectURL = "/user/login?exception=%s";
		if(exception instanceof BadCredentialsException) {
			exceptionMessage = exception.getMessage();
		} else if(exception instanceof UsernameNotFoundException) {
			exceptionMessage = "회원가입을 해 주세요";
			redirectURL = "/user/join%s";
		}
		exceptionMessage = URLEncoder.encode(exceptionMessage, "UTF-8");
		redirectURL = String.format(request, response, exception);
		
		
		
		super.onAuthenticationFailure(request, response, exception);
	}
	
	

}
