package com.example.spring.personnel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("scheduleDao")
public class ScheduleDao {
	
	@Autowired
	private SqlSession sql; 
	private String namespace = "schedule.";
	
	//일정등록 dao
	public int scheduleInsert(HashMap<String, String> map) {
		
		int result = 0;
		
		if(map.get("departmentCheck") == null) {
			result = this.sql.insert(namespace+"individualInsert",map);
		}else {
			result = this.sql.insert(namespace+"departmentInsert",map);
		}
		
		return result;
	}
	
	//개인일정상세보기
	public List<String> individuaDetail(HashMap<String, String> map){
		
		List<String> list = this.sql.selectList(namespace+"individuaDetail",map);

		return list;
	}
	
	//부서일정상세보기
	public List<String> departmentDetail(HashMap<String, String> map){
		
		List<String> list = this.sql.selectList(namespace+"departmentDetail",map);
		
		return list;
	}
	
	//사원일정db
	public List<String> individuaSchedule(String emno){
		
		List<String> list = this.sql.selectList(namespace+"individuaSchedule",emno);
		
		return list;
	}
	
	//부서 일정db
	public List<String> departmentSchedule(HashMap<String, Object> map){
			
		List<String> list = this.sql.selectList(namespace+"departmentSchedule",map);
			
		return list;
	}
	
	//개인일정삭제
	public int individuaDelete(HashMap<String, String> map) {
		
		int result = this.sql.update(namespace+"individuaDelete",map);
		
		return result;
	}
	
	//부서일정삭제
	public int departmentDelete(HashMap<String, String> map) {
		
		int result = this.sql.update(namespace+"departmentDelete",map);
		
		return result;
	}
	
	//개인일정수정
	public int individuaUpdate(HashMap<String, String> map) {

		int result = this.sql.update(namespace+"individuaUpdate",map);
		
		return result;
	}
	
	//부서일정수정
	public int departmentUpdate(HashMap<String, String> map) {

		int result = this.sql.update(namespace+"departmentUpdate",map);
		
		return result;
	}
	
}
