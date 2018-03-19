package com.example.spring.personnel.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.spring.personnel.dao.ScheduleDao;

@Service
public class ScheduleService {
	
	
	@Resource(name="scheduleDao")
	private ScheduleDao scheduleDao;
	
	//일정등록 service
	public int scheduleInsert(HashMap<String, String> map) {
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdfToday = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String today = sdfToday.format(cal.getTime());
		String startDate = map.get("startDate").replaceAll("-", ""); //2018-01-24 -> 20180124
		String startTime = map.get("startTime").replaceAll(":", ""); //09:00:00 -> 090000
		String endDate = map.get("endDate").replaceAll("-","");
		String endTime = map.get("endTime").replaceAll(":", "");
		
		map.put("startDate", startDate + startTime + "00");
		map.put("endDate", endDate + endTime + "00");
		map.put("createDate", today);
		map.put("updateDate", "");
		map.put("delYN", "N");
		
		int result = scheduleDao.scheduleInsert(map);
		
		return result;
	}
	
	//개인일정상세보기
	public List<String> individuaDetail(HashMap<String, String> map){
		
		String start = map.get("start").replaceAll("-", "").replaceAll("T", "").replaceAll(":", "").replaceAll("\"","");
		String end = map.get("end").replaceAll("-", "").replaceAll("T", "").replaceAll(":", "").replaceAll("\"","");
		
		map.put("start", start);
		map.put("end", end);
		
		List<String> list = scheduleDao.individuaDetail(map);
		
		return list;
	}
	
	//부서일정상세보기
	public List<String> departmentDetail(HashMap<String, String> map){
		
		//20180101로만들기
		String start = map.get("start").replaceAll("-", "").replaceAll("T", "").replaceAll(":", "").replaceAll("\"","");
		String end = map.get("end").replaceAll("-", "").replaceAll("T", "").replaceAll(":", "").replaceAll("\"","");
		
		map.put("start", start);
		map.put("end", end);
		
		List<String> list = scheduleDao.departmentDetail(map);
		
		return list;
	}
	
	//사원 일정db 
	public List<String> individuaSchedule(String emno){
		
		List<String> list = scheduleDao.individuaSchedule(emno);
		
		return list;
	}
	
	//부서 일정db
	public List<String> departmentSchedule(HashMap<String, Object> map){
		
		List<String> list = scheduleDao.departmentSchedule(map);
		
		return list;
	}
	
	//개인일정삭제
	public int individuaDelete(HashMap<String, String> map) {

		int result = scheduleDao.individuaDelete(map);
		
		return result;
	}
	
	//부서일정삭제
	public int departmentDelete(HashMap<String, String> map) {
		
		int result = scheduleDao.departmentDelete(map);
		
		return result;
	}
	
	//개인일정수정
	public int individuaUpdate(HashMap<String, String> map) {
		System.out.println("service in");
		
		String startDate = map.get("startDate").replaceAll("-", ""); //2018-01-24 -> 20180124
		String startTime = map.get("startTime").replaceAll(":", ""); //09:00:00 -> 090000
		String endDate = map.get("endDate").replaceAll("-","");
		String endTime = map.get("endTime").replaceAll(":", "");
		
		map.put("startDate", startDate + startTime);
		map.put("endDate", endDate + endTime);
		
		int result = scheduleDao.individuaUpdate(map);
		
		return result;
	}
	
	//부서일정수정
	public int departmentUpdate(HashMap<String, String> map) {
		
		String startDate = map.get("startDate").replaceAll("-", ""); //2018-01-24 -> 20180124
		String startTime = map.get("startTime").replaceAll(":", ""); //09:00:00 -> 090000
		String endDate = map.get("endDate").replaceAll("-","");
		String endTime = map.get("endTime").replaceAll(":", "");
		
		map.put("startDate", startDate + startTime);
		map.put("endDate", endDate + endTime);
		
		int result = scheduleDao.departmentUpdate(map);
		
		return result;
	}
	
}
