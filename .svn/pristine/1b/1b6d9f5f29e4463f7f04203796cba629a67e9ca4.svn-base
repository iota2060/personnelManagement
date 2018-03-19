package com.example.spring.common.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.common.service.CommonService;
import com.mysql.cj.api.Session;

@Controller
public class CommonController {
	
	@Autowired
	private CommonService commonService;
	String PRE_VIEW_PATH = "common/"; //common path
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	//공통 사이드 메뉴 리스트 
	@RequestMapping(value="/navList.ajax")
	public @ResponseBody HashMap<String,Object> navMenu(HttpSession session,@RequestParam HashMap<String,String> map) {
		
		HashMap<String,Object> menuMap = new HashMap<String,Object>();
		
		//현재페이지의 메뉴 map
		menuMap.put("mnPrntMap",commonService.selectMenu(map));
		
		//관리자 여부 if
		if(session.getAttribute("adminYn").equals("Y")) {
			//관리자 사이드 메뉴 list
			menuMap.put("navList",commonService.adminNavList());
		}else {
			//권한별 사이드 메뉴 list
			menuMap.put("navList",commonService.navList((String)session.getAttribute("userEmno")));
		}//if

		return menuMap;
	}//navMenu
	
	//로그인 페이지로 이동
	@RequestMapping(value="/login.do")
	public String loginForm() {
		return "login";
	}//loginForm
	
	//로그인 작업 실행
	@RequestMapping(value="/loginProcess")
	public @ResponseBody HashMap<String,Object> loginProcess(@RequestParam HashMap<String,Object> map,HttpSession session) {
		
		HashMap<String,Object> userMap = commonService.loginProcess(map);
		
		if(userMap!=null) {
			if(session.getAttribute("userEmno") != null) {
				session.removeAttribute("userEmno");
			}//기존 세션값 삭제
			session.setAttribute("userEmno", userMap.get("empEmno"));
			session.setAttribute("userId", userMap.get("empId"));
			session.setAttribute("adminYn", userMap.get("empAdminYn"));
			session.setAttribute("userAuthList",commonService.authorityProcess(userMap));
		}//if 정상적인 로그인 인 경우 
		
		return userMap;
	}//loginProcess
	
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "login";
	}//logout
	
	//메인 가기
	@RequestMapping(value="main.do")
	public String main() {
		return "main"; 
	}//main
	
	@RequestMapping(value="urlCheck.exc")
	public void urlCheck(HttpServletResponse response,HttpServletRequest request) {
		
		String mnUrl = ((String)request.getAttribute("path")).substring(1);
		
		HashMap<String,String> map = commonService.urlCheck(mnUrl);
		
		try {
			if(map.get("mnUseYn")!=null && map.get("mnUseYn").equals("Y")) {
				logger.info("---------->>>>>>>>>>>>>>>>!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!map.get(\"mnUseYn\"):"+map.get("mnUseYn"));
				response.sendRedirect("main.do");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}//try catch
		
	}

}//CommonController
