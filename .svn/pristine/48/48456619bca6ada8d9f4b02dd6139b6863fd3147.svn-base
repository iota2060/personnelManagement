package com.example.spring.management.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.spring.management.dao.CommonCodeDao;

@Service
public class CommonCodeService {

	private static Logger logger = LoggerFactory.getLogger(CommonCodeService.class);
	
	@Resource(name="CommonCodeDao")
	private CommonCodeDao commonCodeDao;
	
	int postNum;
	int pageNum;
	
	public CommonCodeService() {
		this.postNum = 10;
		this.pageNum = 10;
	}

	
	//공통코드 등록
	public int commonInsert(HashMap<String,Object> paramMap) {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String commCodeCrt = sdf.format(calendar.getTime());
		
		paramMap.put("commPrntCode", 0);
		paramMap.put("commCodeCrt", commCodeCrt);
		paramMap.put("commCodeUpdt", "--------------");
		paramMap.put("commDelYn", "N");
		
		int result = commonCodeDao.commonInsert(paramMap);
		
		return result;
		
	}//commonInsert
	
	
	//공통코드 목록
	public List<HashMap<String,Object>> commonList(HashMap<String,Object> paramMap){
		
		int allPostNum = commonCodeDao.commAllPostNum(paramMap);
		int postNum = this.postNum;
		int pageNum = this.pageNum;
		int selectPageNum = Integer.parseInt((String)paramMap.get("selectPageNum"));
		
		int endPost = selectPageNum*postNum;
			
		if(endPost<1) {
			endPost = 1;
		}//if
		
		int startPost = (endPost-(postNum-1))-1;
		
		paramMap.put("startPost", startPost);
		paramMap.put("postNum", postNum);
		
		List<HashMap<String,Object>> list = commonCodeDao.commonList(paramMap);
		
		return list;
		
	}//commonList
	
	
	//공통코드,하위 공통코드 수정
	public int commonUpdate(HashMap<String,Object> paramMap) {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String commCodeUpdt = sdf.format(calendar.getTime());
		
		int commCode = Integer.parseInt((String)paramMap.get("commCode"));
		
		paramMap.put("commCode",commCode);
		paramMap.put("commCodeUpdt",commCodeUpdt);
		
		int result = commonCodeDao.commonUpdate(paramMap);
		
		return result;
		
	}//commonUpdate
	
	
	//공통코드 삭제여부 확인
	public int commonDeleteCheck(String param) {
		
		int commCode = Integer.parseInt(param);
		
		List<HashMap<String,Integer>> list = commonCodeDao.commonDeleteCheck(commCode);
		
		int listSize = list.size();
		
		return listSize;
		
	}//commonDeleteCheck
	
	
	//공통코드,하위 공통코드 삭제여부
	public int commonDelete(String param) {
		
		int commCode = Integer.parseInt(param);
		
		int result = commonCodeDao.commonDelete(commCode);
		
		return result;
		
	}//commonDelete
	
	
	//하위 공통코드 등록
	public int commonInfoInsert(HashMap<String,Object> paramMap) {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmdd");
		String commCodeCrt = sdf.format(calendar.getTime());
		
		paramMap.put("commCodeCrt", commCodeCrt);
		paramMap.put("commCodeUpdt", "--------------");
		paramMap.put("commDelYn", "N");
		
		int result = commonCodeDao.commonInfoInsert(paramMap);
		
		return result;
		
	}//commonInfoInsert
	
	
	//하위 공통코드 목록
	public List<HashMap<String,Object>> commonInfoList(String param){
		
		int commPrntCode = Integer.parseInt(param);
		
		List<HashMap<String,Object>> list = commonCodeDao.commonInfoList(commPrntCode);
		
		return list;
		
	}//commonInfoList
	
	
	//전체 게시물 개수, 검색했을 때의 게시물 개수
	public int commAllPostNum(HashMap<String,Object> paramMap) {
		
		int allPostNum = commonCodeDao.commAllPostNum(paramMap);
		
		return allPostNum;
		
	}//commAllPostNum
	
	
	//페이징
	public HashMap<String,Integer> paging(HashMap<String,Object> paramMap){
		
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		
		int allPostNum = commonCodeDao.commAllPostNum(paramMap);
		int postNum = this.postNum;
		int pageNum = this.pageNum;
		
		map.put("allPostNum",allPostNum);
		map.put("postNum",postNum);
		map.put("pageNum",pageNum);
		
		return map;
		
	}//paging
	
	
}//class
