package com.example.spring.common.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.spring.common.dao.DashboardDao;

@Service
public class DashboardService {

	private static final Logger logger = LoggerFactory.getLogger(DashboardService.class);
	
	@Resource(name="dashboardDao")
	private DashboardDao dashboardDao;
	
	/* 대시보드 - 사원정보 */
	public List<HashMap<String,Object>> empUserInfo(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = dashboardDao.empUserInfo(map);
		
		logger.debug("service>>> " + list);
		
		return list;
	}
	
	/* 대시보드 - 사원휴가정보 */
	public List<HashMap<String,Object>> empVacInfo(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = dashboardDao.empVacInfo(map);
		
		logger.debug("service>>> " + list);
		
		return list;
	}
	
	/* 대시보드 - 부서 일정 */
	public List<HashMap<String,Object>> scheduleList(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = dashboardDao.scheduleList(map);
		
		logger.debug("service>>> " + list);
		
		return list;
	}
	
	/* 대시보드 - 월별 휴가사용개수 그래프 */
	public List<HashMap<String,Object>> monthlyVacChart(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = dashboardDao.monthlyVacChart(map);
		
		logger.debug("service>>> " + list);
		
		return list;
	}

	/* 오늘의 휴가자 */
	public List<HashMap<String,Object>> vacTodayEmpList() {
		
		List<HashMap<String,Object>> list = dashboardDao.vacTodayEmpList();
		
		logger.debug("service>>> " + list);
		
		return list;
	}
	
	/* 대시보드- 내가 이번달에 사용한 항목별 휴가*/
	public List<HashMap<String,Object>> thisMonthVacChart(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = dashboardDao.thisMonthVacChart(map);
		
		logger.debug("service>>> " + list);
		
		return list;
	}
	
}
