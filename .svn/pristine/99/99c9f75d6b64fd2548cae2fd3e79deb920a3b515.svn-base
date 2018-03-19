package com.example.spring.personnel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("certificateDao")
public class CertificateDao {
	
	@Autowired
	private SqlSession sql; 
	private String namespace = "certificate.";
	
	
	//증명서 공통코드 가져오기
	public int certificateCommCode(HashMap<String, Object> map) {
		
		int result = this.sql.selectOne(namespace + "certificateCommCode",map);
		
		return result;
	}
	
	//증명서 MaxNum
	public int certificateMaxNum(HashMap<String, Object> map) {
		return this.sql.selectOne(namespace + "certificateMaxNum",map);
	}
	
	//증명서 정보 가져오기
	public List<String> certificateList(HashMap<String, Object> map){
		
		List<String> list = this.sql.selectList(namespace+"certificateList",map);
		
		return list;
	}
	
	//사원정보가져오기
	public HashMap<String, Object> empInfo(String emno){
			
		HashMap<String, Object> map = this.sql.selectOne(namespace+"empInfo",emno);
		
		return map;
	}
	
	//증명서 상세보기
	public HashMap<String, Object> certificateSearchInfo(int crtfSeq){
		
		HashMap<String, Object> map = this.sql.selectOne(namespace+"certificateSearchInfo",crtfSeq);
		
		return map;
	}
	
	//증명서 신청
	public int certificateInsert(HashMap<String, Object> map) {
		
		int result = this.sql.insert(namespace + "certificateInsert", map);
		
		return result;
	}
	
	//증명서신청 시 사원정보
	public HashMap<String,String> certificateRequestEmpInfo(String empEmno){
			
		HashMap<String,String> map = this.sql.selectOne(namespace + "empInfo", empEmno);
			
		return map;
			
	}//certificateRequestInfo
	
	//증명서 신청내역 목록
	public List<HashMap<String,Object>> certificateRequestList(HashMap<String,Object> paramMap){
		
		List<HashMap<String,Object>> list = this.sql.selectList(namespace + "certificateRequestList", paramMap);
		
		return list;
	
	}//certificateRequestList
	
	//증명서 삭제
	public int certificateDelete(HashMap<String, Object> map) {
		
		int result = this.sql.update(namespace + "certificateDelete", map);
		
		return result;
	}
	
	//재직증명서
	public HashMap<String, Object> workCertificate(HashMap<String, Object> map){
		
		HashMap<String, Object> workMap = this.sql.selectOne(namespace + "workCertificate",map);
		
		return workMap;
	}
}
