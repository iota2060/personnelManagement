package com.example.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	//preHandle()
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session  = request.getSession();
		
		if(session.getAttribute("userEmno") == null) {
			response.sendRedirect("/spring/login.do");
			return false;
		}else {
			
			return true;
			
		}//if else

	}//preHandle
	
}//AuthenticationInterceptor
