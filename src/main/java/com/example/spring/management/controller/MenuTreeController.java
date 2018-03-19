package com.example.spring.management.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.management.service.MenuTreeService;

@Controller
public class MenuTreeController {
	
	@Autowired
	MenuTreeService menuTreeService;
	
	private static final Logger logger = LoggerFactory.getLogger(MenuTreeController.class);
	
	//메뉴관리 메인 
	@RequestMapping(value="/menuTreeMain.do")
	public String menuTreeMain() {
		return "menuTreeMain";
	}//menuTreeMain 
	 
	//메뉴등록 폼
	@RequestMapping(value="/menuInsertForm.do")
	public String menuInserForm(HttpServletResponse response) {
		return "menuInsertForm";
	}//menuInserForm
	
	//메뉴리스트 
	@RequestMapping(value="/menuList.ajax")
	public @ResponseBody HashMap<String,Object> menuList() {

		HashMap <String,Object> menuList = new HashMap<String,Object>();
		menuList.put("data",menuTreeService.menuList());
		
		return menuList;
	}//menuList
	
	//메뉴등록
	@RequestMapping(value="/menuInsert.do", method=RequestMethod.POST)
	public @ResponseBody HashMap<String,String> menuInsert(@RequestParam HashMap<String,Object> map) {
		
		HashMap<String,String> resultMap = new HashMap<String,String>();
		
		resultMap.put("result",""+menuTreeService.menuInsert(map));

		return resultMap;
	}//menuInsert
	
	//메뉴 상세정보 
	@RequestMapping(value="/menuDetail.do")
	public ModelAndView menuDetailTable(HttpServletRequest request) {
		
		int mnNo = (int)Integer.parseInt(request.getParameter("mnNo"));
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("map", menuTreeService.menuDetail(mnNo));
		mv.setViewName("menuDetail");
		
		return mv;
	}//menuDetailTable
	
	//메뉴수정 폼
	@RequestMapping(value="/menuUpdateForm.do")
	public ModelAndView menuUpdateForm(HttpServletRequest request) {
		
		int mnNo = (int)Integer.parseInt(request.getParameter("mnNo"));
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("map",menuTreeService.menuDetail(mnNo));
		mv.setViewName("menuUpdateForm");
		
		return mv;
	}//menuUpdateForm
	
	//메뉴 업데이트
	@RequestMapping(value="/menuUpdate.do")
	public @ResponseBody HashMap<String,String> menuUpdate(@RequestParam HashMap<String,Object> map) {

		int result = (int)(menuTreeService.menuUpdate(map));
		
		HashMap<String,String> resultMap = new HashMap<String,String>();
		
		resultMap.put("result",""+menuTreeService.menuUpdate(map));
		
		return resultMap;
	}//menuUpdate
	
	//메뉴삭제
	@RequestMapping(value="/menuDelete.do")
	public @ResponseBody HashMap<String,Object> menuDelete(@RequestParam(value="mnNoList[]") List<String> mnNoList,HttpServletRequest request) {
	
		int result = (int)(menuTreeService.menuDelete(mnNoList));
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		resultMap.put("result", result);
		
		return resultMap;
	}//menuDelete
	
}//MenuTreeController 
