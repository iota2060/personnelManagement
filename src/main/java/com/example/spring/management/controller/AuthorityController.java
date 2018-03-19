package com.example.spring.management.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.management.service.AuthorityService;

@Controller
public class AuthorityController {
	
	@Autowired
	AuthorityService authorityService;
	
	//권한 메인 
	@RequestMapping(value="authorityMain.do")
	public String authorityMain() {	
		return "authorityMain";
	}//authorityMain
	
	//사원 리스트 
	@RequestMapping(value="empList.ajax")
	public @ResponseBody HashMap<String,Object> empList(@RequestParam HashMap<String,Object> map){
		
		map.put("totalNoticeNum", authorityService.empMaxNum(map));
		map.put("empList", authorityService.empList(map));
		
		return map;
	}//empList
	
	//사원에 대한 권한 상세정보
	@RequestMapping(value="authorityDetail.do")
	public ModelAndView authorityDetail(@RequestParam HashMap<String,Object> map) {
		
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("data",authorityService.authorityDetail(map));
		mv.setViewName("authorityDetail");
		return mv;
	}//authorityDetail
	
	//관리자 등급 업데이트
	@RequestMapping(value="empClassUpdate.ajax")
	public @ResponseBody int empClassUpdate(@RequestParam HashMap<String,Object> map) {
		
		int result = (int)authorityService.empClassUpdate(map);	
		return result;
	}//empClassUpdate
	
	//메뉴에 대한 권한 상세정보
	@RequestMapping(value="authorityData.do")
	public ModelAndView aurthorityMenu(@RequestParam HashMap<String,Object> map) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("mnNo",map.get("mnNo"));
		mv.addObject("menuList",authorityService.menuList(map));
		mv.addObject("authoData",authorityService.authorityData(map));
		mv.setViewName("authorityData");
		
		return mv; 
	}//aurthorityMenu
	
	//메뉴 권한 등록 폼 
	@RequestMapping(value="authorityInsertForm.do")
	public ModelAndView authorityInsertForm(@RequestParam HashMap<String,Object> map) {
		 
		 ModelAndView mv = new ModelAndView();
		 mv.addObject("empEmno",map.get("empEmno"));
		 mv.addObject("menuData",authorityService.menuList(map));
		 
		 mv.setViewName("authorityInsertForm");
		 
		 return mv;
	}//authorityInsertForm
	 
	//메뉴 권한 업데이트
	@RequestMapping(value="authorityUpdateForm.do")
	public ModelAndView authorityForm(@RequestParam HashMap<String,Object> map) {
		 
		 ModelAndView mv = new ModelAndView();
		 mv.addObject("empEmno",map.get("empEmno"));
		 mv.addObject("menuData",authorityService.menuList(map));
		 mv.addObject("authoData",authorityService.authorityData(map));
		 
		 mv.setViewName("authorityUpdateForm");
		 
		 return mv;
	 }//authorityForm

	//메뉴 권한 등록
	@RequestMapping(value="authorityInsert.do")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	public @ResponseBody int authorityInsert(@RequestParam HashMap<String,Object> map) {
	 
		int result = (int)authorityService.authorityInsert(map);
		return result;
	}//authorityInsert
	
	//메뉴 권한 업데이트
	@RequestMapping(value="authorityUpdate.exc")
	public @ResponseBody int authorityUpdate(@RequestParam HashMap<String,Object> map) {
		
		int result = (int)authorityService.authorityUpdate(map);
		return result;
	}//authorityUpdat 
}//authorityController
