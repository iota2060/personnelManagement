package com.example.spring.personnel.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.spring.personnel.dao.InfoDao;



@Service
public class InfoService {
	
	@Resource(name="infoDao")
	InfoDao infoDao;
	
	public void infoInsert(HashMap<String,String> map){
		System.out.println("service map확인 : " +map);
	
		infoDao.infoInsert(map);
	
	}
	
	public List<HashMap<String,Object>> infoSearch (HashMap<String,Object> map) {
		System.out.println("서비스진입");
		List<HashMap<String,Object>> list=new ArrayList<HashMap<String,Object>> ();
		
		list =infoDao.infoSearch(map);
		
		return list;
		
		
	}
	
	public List<HashMap<String,Object>> infoSelect(){
		
		List<HashMap<String, Object>> list = infoDao.infoSelect();
		
		return list;
	}
	
	public List<HashMap<String,Object>> getEmnoSelect(HashMap<String,Object> map){
		System.out.println("service ajaxselect : "+map);
		List<HashMap<String, Object>> list = infoDao.getEmnoSelect(map);
		
		return list;
	}
	
	
	
}
