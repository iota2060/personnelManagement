package com.example.spring.personnel.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.spring.personnel.dao.HrApntDao;



@Service
public class HrApntService {

	@Resource(name="hrApntDao")
	private HrApntDao hrApntDao;

	
	//사원리스트 max 값
		public int getListEmpMaxNum(HashMap<String,Object> map) {	
			return hrApntDao.getListEmpMaxNum(map);
		}//empMaxNum
	
	//사원리스트 
	public List<HashMap<String, Object>> getListEmp(HashMap<String, Object> map) {
		//limit #{noticeCount},#{viewNoticeMaxNum}
		int totalNoticeNum = (Integer)map.get("totalNoticeNum");
		int choicePage = Integer.parseInt((String)map.get("choicePage"));
		int viewNoticeMaxNum = 3;
		int noticeCount= 0; //게시물 시작 순번
		
		noticeCount = (choicePage-1)*viewNoticeMaxNum;
		
		map.put("noticeCount", noticeCount);
		map.put("viewNoticeMaxNum", viewNoticeMaxNum);
		
		List<HashMap<String,Object>> list = hrApntDao.getListEmp(map);
		
		return list;
	}//getListEmp
	
	// 발령처리
	public void hrapntRegPro(HashMap<String, Object> map) {
		hrApntDao.hrapntRegPro(map);
	}//hrapntRegPro
		
	//발령리스트 max 값
	public int getHrapntRsListMaxNum(HashMap<String,Object> map) {	
		return hrApntDao.getHrapntRsListMaxNum(map);
	}//getListHrapntRsMaxNum

	//발령리스트 
	public List<HashMap<String, Object>> getHrapntRsList(HashMap<String, Object> map) {
		//limit #{noticeCount},#{viewNoticeMaxNum}
		int totalNoticeNum = (Integer)map.get("totalNoticeNum");
		int choicePage = Integer.parseInt((String)map.get("choicePage"));
		int viewNoticeMaxNum = 3;
		int noticeCount= 0; //게시물 시작 순번
		
		noticeCount = (choicePage-1)*viewNoticeMaxNum;
		
		map.put("noticeCount", noticeCount);
		map.put("viewNoticeMaxNum", viewNoticeMaxNum);
		
		List<HashMap<String,Object>> list = hrApntDao.getHrapntRsList(map);
		
		return list;
	}//getListHrapntRs	
	
}
