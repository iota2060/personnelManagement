package com.example.spring.management.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CommonCodeDao")
public class CommonCodeDao {

	private static Logger logger = LoggerFactory.getLogger(CommonCodeDao.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private String nameSpaceName = "commonCode.";
	
	
	//공통코드 등록
	public int commonInsert(HashMap<String,Object> paramMap) {
		
		int result = this.sqlSession.insert(nameSpaceName + "commonInsert", paramMap);
		
		return result;
		
	}//commonInsert
	
	
	//공통코드 목록
	public List<HashMap<String,Object>> commonList(HashMap<String,Object> paramMap){
		
		List<HashMap<String,Object>> list = this.sqlSession.selectList(nameSpaceName + "commonList", paramMap);

		return list;
		
	}//commonList
	
	
	//공통코드,하위 공통코드 수정
	public int commonUpdate(HashMap<String,Object> paramMap) {
		
		int result = this.sqlSession.update(nameSpaceName + "commonUpdate",paramMap);
		
		return result;
		
	}//commonUpdate
	
	
	//공통코드 삭제여부 확인
	public List<HashMap<String,Integer>> commonDeleteCheck(int commCode){		
		
		List<HashMap<String,Integer>> list = this.sqlSession.selectList(nameSpaceName + "commonDeleteCheck", commCode);
		
		return list;
		
	}//commonDeleteCheck
	
	
	//공통코드,하위 공통코드 삭제
	public int commonDelete(int commCode) {
		
		int result = this.sqlSession.update(nameSpaceName + "commonDelete", commCode);
		
		return result;
		
	}//commonDelete-
	
	
	//하위 공통코드 등록
	public int commonInfoInsert(HashMap<String,Object> paramMap) {
		
		int result = this.sqlSession.insert(nameSpaceName + "commonInfoInsert", paramMap);
		
		return result;
		
	}//commonInfoInsert
	

	//하위 공통코드 목록
	public List<HashMap<String,Object>> commonInfoList(int commPrntCode) {
		
		List<HashMap<String,Object>> list = this.sqlSession.selectList(nameSpaceName + "commonInfoList", commPrntCode);
		
		return list;
		
	}//commonInfoList
	
	
	//전체 게시물 개수, 검색 했을 때의 게시물 개수
	public int commAllPostNum(HashMap<String,Object> paramMap) {
		
		int allPostNum = this.sqlSession.selectOne(nameSpaceName + "commAllPostNum", paramMap);
		
		return allPostNum;
		
	}//commAllPostNum
	
}//class

