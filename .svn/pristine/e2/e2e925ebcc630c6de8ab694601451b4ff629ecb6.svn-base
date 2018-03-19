package com.example.spring.common.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commonDao")
public class CommonDao {
	@Autowired
	private SqlSession sql;
	private String namespace="common.";
	
	//권한 사이드바 list
	public List<HashMap<String,String>> navList(String empEmno){
		
		//권한 리스트 저장
		List<HashMap<String,String>> list = this.sql.selectList(namespace+"authList",empEmno);
		
		//중복 제거를 위한 HashSet
		HashSet<Object> set = new HashSet<Object>();
		
		//각 권한 코드 계층 list
		List<HashMap<String,Object>> navList  =new ArrayList<HashMap<String,Object>>();
		
		//권한 리스트 순환 for
		for(int i=list.size()-1; i>=0; i--) {
			
			//각 권한 코드의 최상위까지의 부모를 포함하는 리스트 저장
			navList=this.sql.selectList(namespace+"navSet",list.get(i));
			
			//권한 코드의 최상위까지의 부모를 포함하는 리스트 순환
			for(int j=0; j<navList.size(); j++) {
				//중복 제거를 위해 HashSet에 추가
				set.add(navList.get(j).get("mnNo"));
			}
		}//for
		
		//최상위 부모를 포함하는 중복지 제거된 권한 코드 list
		List<Object> mnList = new ArrayList<Object>(set);
		
		//권한 사이드 메뉴 navlist
		list = this.sql.selectList(namespace+"navList",mnList);
		
		return list;
	}//navList
	
	//관리자용 사이드 메뉴 리스트
	public List<HashMap<String,Object>> adminNavList(){
		
		List<HashMap<String,Object>> list = this.sql.selectList(namespace+"adminNavList");
		return list;
	}//adminNavList
	
	//현재페이지 메뉴 
	public HashMap<String,Object> selectMenu(HashMap<String,String> map){
		
		HashMap<String,Object> mnPrntNo = this.sql.selectOne(namespace+"selectMenu",map);
		return mnPrntNo;
	}//selectMenu
	
	//login
	public HashMap<String,Object> loginProcess(HashMap<String,Object> map){
		
		HashMap<String,Object> userMap = this.sql.selectOne(namespace+"loginProcess",map);
		return userMap;
	}//loginProcess
	
	//권한 list
	public List<HashMap<String,Object>> authorityProcess(HashMap<String,Object> map){
		
		List<HashMap<String,Object>> userAuthList = this.sql.selectList(namespace+"authorityProcess", map);
		return userAuthList;
	}
	
	//url check
	public HashMap<String,String> urlCheck(String mnUrl){
		
		HashMap<String,String> map = this.sql.selectOne(namespace+"urlCheck",mnUrl);
		return map;
	}//urlCheck
}//CommonDao
