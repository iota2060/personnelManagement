package com.example.spring.management.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("menuTreeDao")
public class MenuTreeDao {
	@Autowired
	private SqlSession sql; 
	private String namespace = "menuTree.";
	
	//메뉴리스트 
	public List<HashMap<String,Object>> menuList(){
		List<HashMap<String,Object>> list = this.sql.selectList(namespace+"menuList");
		return list;
	}//menuList
	
	//메뉴등록
	public int menuInsert(HashMap<String,Object> map) {
		int result = (int)this.sql.update(namespace+"menuInsert", map);
		return result;
	}//menuInsert
	
	//메뉴 상세
	public HashMap<String,Object> menuDetail(int menuNo) {
		HashMap<String,Object> map = this.sql.selectOne(namespace+"menuDetail", menuNo);
		return map;
	}//menuDetail
	
	//메뉴 업데이트
	public int menuUpdate(HashMap<String,Object> map,List<HashMap<String,String>>list) {
		int result=(int)this.sql.update(namespace+"menuUpdate",map);
		
		if(result==-1) {
			return result;
		}//if
		
		for(HashMap<String,String> item :list) {		
			result = (int)this.sql.update(namespace+"menuIndexUpdate",item);
			
			if(result==-1) {
				return result;
			}//if
		}//for
		
		return result;
	}//menuUpdate
	
	//메뉴 삭제
	public int menuDelete(int mnNo) {
		int result = (int)this.sql.update(namespace+"menuDelete",mnNo);
		return result;	
	}//menuDelete
	
}//MenuTreeDao