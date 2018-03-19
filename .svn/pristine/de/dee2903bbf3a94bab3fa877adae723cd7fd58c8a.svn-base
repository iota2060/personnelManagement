package com.example.spring.personnel.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring.personnel.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	//private String PRE_VIEW_PATH = "personnel/schedule/";
	
	//일정보기(메인)
	@RequestMapping(value="scheduleView.do")
	public String scheduleView() {
		
		return "scheduleView";
		
	}
	
	//사원일정db
	@RequestMapping(value="individuaSchedule.do")
	public @ResponseBody List<String> individuaSchedule(@RequestParam String emno){
		
		System.out.println("emno : " + emno);
		
		List<String> list = scheduleService.individuaSchedule(emno);
		
		return list;
	}
	
	//부서일정db
	@RequestMapping(value="departmentSchedule.do")
	public @ResponseBody List<String> departmentSchedule(@RequestParam HashMap<String, Object> map){
		
		System.out.println("controller map : " + map);
		
		List<String> list = scheduleService.departmentSchedule(map);
		
		return list;
	}
	
	//개인일정상세보기
	@RequestMapping(value="individuaDetail.do")
	public @ResponseBody List<String> individuaDetail(@RequestParam HashMap<String, String> map){
		System.out.println("일정상세보기(controller)");
		System.out.println("파라미터값: " + map);
		
		List<String> list = scheduleService.individuaDetail(map);
		
		return list;
	}
	
	//부서일정상세보기
	@RequestMapping(value="departmentDetail.do")
	public @ResponseBody List<String> departmentDetail(@RequestParam HashMap<String, String> map){
		
		List<String> list = scheduleService.departmentDetail(map);
		
		return list;
	}
	
	//일정등록
	@RequestMapping(value="scheduleInsert.do")
	public @ResponseBody int scheduleInsert(@RequestParam HashMap<String, String> map) {
		System.out.println("등록 컨트롤러 map : " + map);
		int result = scheduleService.scheduleInsert(map);
		
		return result;
	}
	
	//개인일정삭제
	@RequestMapping(value="individuaDelete.do")
	public @ResponseBody int individuaDelete(@RequestParam HashMap<String, String> map) {
		
		int result = scheduleService.individuaDelete(map);
		
		return result;
	}
	
	//부서일정삭제
	@RequestMapping(value="departmentDelete.do")
	public @ResponseBody int departmentDelete(@RequestParam HashMap<String, String> map) {
		
		int result = scheduleService.departmentDelete(map);
	
		return result;
	}
	
	//개인일정수정
	@RequestMapping(value="individuaUpdate.do")
	public @ResponseBody int individuaUpdate(@RequestParam HashMap<String, String> map) {
		System.out.println("controller in");
		System.out.println("param map : " + map);
		int result = scheduleService.individuaUpdate(map);
		
		return result;
	}
	
	//부서일정수정
	@RequestMapping(value="departmentUpdate.do")
	public @ResponseBody int departmentUpdate(@RequestParam HashMap<String, String> map) {
		
		int result = scheduleService.departmentUpdate(map);
		
		return result;
	}
	
}
