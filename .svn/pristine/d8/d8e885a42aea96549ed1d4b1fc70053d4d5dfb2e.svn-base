package com.example.spring.personnel.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.personnel.service.HrApntService;



@Controller
public class HrApntController {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HrApntController.class);

	@Autowired
	private HrApntService hrApntService;
	
	private String PRE_VIEW_PATH = "/personnel/hrapnt/";
	
	@RequestMapping(value = "/hrapntView")
	public ModelAndView hrapntView(@RequestParam HashMap<String, Object> params) {

		System.out.println("들어온값hrapntView"+params);
		
		HashMap<String, String> map = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();

		mv.setViewName("hrapntView");
		return mv;
	}
	
	@RequestMapping(value = "/hrapntReg")
	public ModelAndView hrapntReg(@RequestParam HashMap<String, Object> params) {

		System.out.println("들어온값hrapntReg"+params);
		
		HashMap<String, String> map = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
	
		//mv.addObject("listNew", hrApntService.testList(map));
		
		mv.setViewName(PRE_VIEW_PATH+"hrapntReg");
		//mv.setViewName("hrapntReg");
		return mv;
	}

	// 사원 리스트
	@RequestMapping(value="hrapntEmpList.ajax")
	public @ResponseBody HashMap<String,Object> getListEmp(@RequestParam HashMap<String,Object> map){
		//System.out.println("들어온값"+map);
		
		//mv.addObject("listEmployee", hrApntService.getListEmployee(map) );
		map.put("totalNoticeNum", hrApntService.getListEmpMaxNum(map) );
		map.put("listEmp", hrApntService.getListEmp(map) );
		
		return map;
	}//getListEmp
	
	// 발령처리
	//@RequestMapping(value = "/hrapntRegPro", method = RequestMethod.POST)
	@RequestMapping(value = "hrapntRegPro.ajax")
	public @ResponseBody HashMap<String, Object> hrapntRegPro(@RequestParam HashMap<String, Object> params
			,@RequestParam(value="empEmno",required=false) ArrayList<String> empEmnoList
			) throws Exception {

		System.out.println("들어온값hrapntRegProzoro"+params);
		System.out.println("들어온값hrapntRegProzoro"+empEmnoList);
		
		//List<String> codeList = new ArrayList<String>();
		//List<List<String>> codeList = Arrays.asList(empEmnoList);
		
		//for(int i = 0; i < empEmnoList.size(); i++) {
			//codeList.add( empEmnoList.get(i) );
		//}
		
		params.put("empEmno_List", empEmnoList);
		
		System.out.println("들어온값hrapntRegProzoro"+params);
		
		hrApntService.hrapntRegPro(params);
		
		
		//HashMap<String, String> map = new HashMap<String, String>();
		//ModelAndView mv = new ModelAndView();

		//mv.setViewName(PRE_VIEW_PATH+"hrapntRegPro");
		return params;
	}
	
	// 발령 리스트
	@RequestMapping(value="hrapntRsList.ajax")
	public @ResponseBody HashMap<String,Object> hrapntRsList(@RequestParam HashMap<String,Object> map){
		//System.out.println("들어온값"+map);
		
		System.out.println("들어온값hrapntRsList"+map);
		
		//mv.addObject("listEmployee", hrApntService.getListEmployee(map) );
		map.put("totalNoticeNum", hrApntService.getHrapntRsListMaxNum(map) );
		map.put("ListHrapnt", hrApntService.getHrapntRsList(map) );
		
		
		
		return map;
	}//getListEmp
	
	
	
	
	
	@RequestMapping(value = "/hrDtlView")  					//
	public ModelAndView hrDtlView(HttpServletRequest request) {

		HashMap<String, String> map = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
	
		//mv.addObject("listNew", hrApntService.testList(map));
		
		mv.setViewName(PRE_VIEW_PATH+"hrDtlView");
		return mv;
	}
		
		
		
	
	@RequestMapping(value = "/hrapntCancel")  					//
	public ModelAndView hrapntCancel(HttpServletRequest request) {

		HashMap<String, String> map = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
	
		
		//mv.addObject("listNew", map);
		
		mv.setViewName("hrapntView");
		return mv;
	}
	
	
	
	
	
	@RequestMapping(value = "/modalTest123")  					//
	public ModelAndView modalTest123(HttpServletRequest request) {

		HashMap<String, String> map = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
	
		//mv.addObject("listNew", hrApntService.testList(map));
		
		mv.setViewName(PRE_VIEW_PATH+"test123");
		return mv;
	}

}
