package com.example.spring.common.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.spring.attendance.dao.VacationDao;

@Repository("dashboardDao")
public class DashboardDao {

private static final Logger logger = LoggerFactory.getLogger(DashboardDao.class);
	
	@Autowired
	private SqlSession sqlSession;
	private String nameSpaceName = "dashboard.";
	
	/* 대시보드 - 사원정보 */
	public List<HashMap<String,Object>> empUserInfo(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list
			= this.sqlSession.selectList(nameSpaceName + "empUserInfo", map);
		
		logger.debug("dao List: "+list);
		
		return list;
	}
	
	/* 대시보드 - 사원휴가정보 */
	public List<HashMap<String,Object>> empVacInfo(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		int empVacChk=0; //휴가일수설정에 등록된 사원인지(사원 휴가데이터가 있는지 체크)
		
		empVacChk = this.sqlSession.selectOne(nameSpaceName+"empVacChk",map);
		logger.info("empVacChk"+empVacChk);
		
		if(empVacChk >= 1) {
			list = this.sqlSession.selectList(nameSpaceName + "empVacInfo", map);
			logger.info("진입");
		}
		
		logger.debug("dao List: "+list);
		
		return list;
	}
	
	/* 대시보드 - 부서일정 */
	public List<HashMap<String,Object>> scheduleList(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list
			= this.sqlSession.selectList(nameSpaceName + "scheduleList", map);
		
		logger.debug("dao List: "+list);
		
		return list;
	}
	
	/* 대시보드 - 월별 휴가사용개수 그래프 */
	public List<HashMap<String,Object>> monthlyVacChart(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		float userData = 0;
		float allData = 0;
		
		for(int i=1; i<=12; i++) {
			HashMap<String,Object> chartDataMap = new HashMap<String,Object>();
			
			if(i==1) {
				map.put("baseMonth",map.get("baseMonth").toString().substring(0,4)+"0"+i);
			}
			
			userData = this.sqlSession.selectOne(nameSpaceName + "monthlyVacUserChart", map);				
			allData = this.sqlSession.selectOne(nameSpaceName + "monthlyVacAllChart", map);
			
			chartDataMap.put("date", map.get("baseMonth")); //년월
			chartDataMap.put("userData", userData); //사원 월별 유급휴가 사용개수
			chartDataMap.put("allData", allData); //사원 월별 유급휴가 사용개수
			list.add(chartDataMap); //사원별로 연차개수 리스트에 담기
			map.put("baseMonth", String.valueOf((Integer.parseInt(map.get("baseMonth").toString())+1)));
		}
		
		logger.debug("dao List: "+list);
		
		return list;
	}
	
	/* 오늘의 휴가자 */
	public List<HashMap<String,Object>> vacTodayEmpList() {
		
		List<HashMap<String,Object>> list
			= this.sqlSession.selectList(nameSpaceName + "vacTodayEmpList");
		
		logger.debug("dao List: "+list);
		
		return list;
	}
	
	/* 대시보드 - 내가 이번달에 사용한 항목별 휴가 */
	public List<HashMap<String,Object>> thisMonthVacChart(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list
			= this.sqlSession.selectList(nameSpaceName + "thisMonthVacChart",map);
		
		logger.debug("dao List: "+list);
		
		return list;
	}
}
