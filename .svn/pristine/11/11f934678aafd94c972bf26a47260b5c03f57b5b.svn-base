package com.example.spring.management.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spring.management.dao.AuthorityDao;

@Service
public class AuthorityService {
	
	@Resource(name="authorityDao")
	private AuthorityDao authorityDao;
	
	//사원리스트 max 값
	public int empMaxNum(HashMap<String,Object> map) {	
		return authorityDao.empMaxNum(map);
	}//empMaxNum
	
	//사원리스트 
	public List<HashMap<String,Object>> empList(HashMap<String,Object> map) {
		
		int totalNoticeNum = (Integer)map.get("totalNoticeNum");
		int choicePage = Integer.parseInt((String)map.get("choicePage"));
		int viewNoticeMaxNum = 10;
		int noticeCount= 0; //게시물 시작 순번
		
		noticeCount = (choicePage-1)*viewNoticeMaxNum;
		
		map.put("noticeCount", noticeCount);
		map.put("viewNoticeMaxNum", viewNoticeMaxNum);

		List<HashMap<String,Object>>empList = authorityDao.empList(map);
		return empList;
	}//empList
	
	//권한에 대한 사원 상세정보
	public HashMap<String,Object> authorityDetail(HashMap<String,Object> map){
		
		HashMap<String,Object> empMap = authorityDao.authorityDetail(map);
		return empMap;
	}//authorityDetail
	
	//관리자 권한 업데이트
	public int empClassUpdate(HashMap<String,Object> map) {

		int result = (int)authorityDao.empClassUpdate(map);
		return result;
	}//empClassUdpate

	//메뉴에 대한 권한 상세 데이터
	public HashMap<String,Object> authorityData(HashMap<String,Object> map){

		HashMap<String,Object> authorityData = authorityDao.authorityData(map);
		return authorityData;
	}//authorityData
	
	//메뉴리스트 
	public HashMap<String,Object> menuList(HashMap<String,Object> map){
		
		HashMap<String,Object> menuMap = authorityDao.menuList(map);
		return menuMap;
	}//menuList
	
	//메뉴 권한 등록
	public int authorityInsert(HashMap<String,Object> map) {
		
		map.put("atrAplyStrt",((String)map.get("atrAplyStrt")).replaceAll("-","")+"000000");
		map.put("atrAplyFini",((String)map.get("atrAplyFini")).replaceAll("-","")+"000000");
		map.put("atrUpdtStrt",((String)map.get("atrUpdtStrt")).replaceAll("-","")+"000000");
		map.put("atrUpdtFini",((String)map.get("atrUpdtFini")).replaceAll("-","")+"000000");
		
		int result = authorityDao.authorityInsert(map);
		return result;
	}//authorityInsert
	
	//메뉴 권한 업데이트
	public int authorityUpdate(HashMap<String,Object> map) {
		
		map.put("atrAplyStrt",((String)map.get("atrAplyStrt")).replaceAll("-","")+"000000");
		map.put("atrAplyFini",((String)map.get("atrAplyFini")).replaceAll("-","")+"000000");
		map.put("atrUpdtStrt",((String)map.get("atrUpdtStrt")).replaceAll("-","")+"000000");
		map.put("atrUpdtFini",((String)map.get("atrUpdtFini")).replaceAll("-","")+"000000");
		
		int result = authorityDao.authorityUpdate(map);
		return result;
	}//authorityUpdate
}//authorityService
