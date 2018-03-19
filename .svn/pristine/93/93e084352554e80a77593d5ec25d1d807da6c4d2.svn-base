package com.example.spring.common.interceptor;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.example.spring.management.controller.MenuTreeController;

public class AuthorityInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthorityInterceptor.class);
	
	//preHandle()
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
	
		HttpSession session = request.getSession();
		
		//관리자 여부 if
		if(session.getAttribute("adminYn").equals("Y")) {
			//관리자 계정일 경우 controller실행
			return true;
		}else {
			//권한 리스트 
			ArrayList<HashMap<String,Object>> userAuthList 
					= (ArrayList<HashMap<String,Object>>)session.getAttribute("userAuthList");
			
			String mnUrl;
			
			//권한 리스트 순환 for
			for(int i = 0; i<userAuthList.size(); i++) {
				//현재 url 
				mnUrl = "/"+(String)userAuthList.get(i).get("mnUrl");
				
				//권한이 있을시 controller 실행
				if(mnUrl.equals(request.getServletPath())) {
					
					return true;
		
				}//if
			}//for
	
            //해당 url에 권한이 없을시 url check 컨트롤러
			request.setAttribute("path", request.getServletPath());
			RequestDispatcher rd = request.getRequestDispatcher("/urlCheck.exc");
			rd.forward(request, response);
			
			return false;
		}//if else
	}//preHandle
}//AuthorityInterceptor

