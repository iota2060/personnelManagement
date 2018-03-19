package com.example.spring.management.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("authorityDao")
public class AuthorityDao {
	
	@Autowired
	private SqlSession sql;
	private String namespace = "authority.";
	
	//사원 리스트 max 값
	public int empMaxNum(HashMap<String,Object> map) {
		return ((Integer)this.sql.selectOne(namespace+"empMaxNum",map));
	}//empMaxNu
	
	//사원리스트
	public List<HashMap<String,Object>> empList(HashMap<String,Object> map){
		
		List<HashMap<String,Object>> empList = this.sql.selectList(namespace+"empList", map);
		return empList;
	}//empList
	
	//권한에대한 사원 상세정보
	public HashMap<String,Object> authorityDetail(HashMap<String,Object> map){
		HashMap<String,Object> empMap = this.sql.selectOne(namespace+"authorityDetail", map);
		return empMap;
	}//authorityDetail
	
	//관리자 권한 등급 업데이트
	public int empClassUpdate(HashMap<String,Object> map) {
		int result = (int)this.sql.update(namespace+"empClassUpdate",map);
		return result;
	}//empClassUpdate

	//메뉴에 대한 권한 상세정보
	public HashMap<String,Object> authorityData(HashMap<String,Object> map){
		HashMap<String,Object> authorityData = this.sql.selectOne(namespace+"authorityMenu", map);
		return authorityData;
	}//authorityData
	
	//메뉴리스트
	public HashMap<String,Object> menuList(HashMap<String,Object> map){
		HashMap<String,Object> menuMap = this.sql.selectOne(namespace+"menuList", map);
		return menuMap;
	}//menuList
	
	//권한 등록
	public int authorityInsert(HashMap<String,Object> map) {
		int result = this.sql.update(namespace+"authorityInsert",map);
		return result;
	}//authorityInser
	
	//권한 업데이트
	public int authorityUpdate(HashMap<String,Object> map) {
		int result = this.sql.update(namespace+"authorityUpdate",map);
		return result;
	}//authorityUpdate
}//authorityDao
