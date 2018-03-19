package com.example.spring.personnel.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("hrApntDao")
public class HrApntDao {

	@Autowired
	private SqlSession sqlSession;// sql 접속 세션
	private String nameSpaceName = "hrapnt.";


	//사원 리스트 max 값
	public int getListEmpMaxNum(HashMap<String,Object> map) {
		return ((Integer)this.sqlSession.selectOne(nameSpaceName+"getListEmpMaxNum",map));
	}//getListEmpMaxNum
	
	//사원리스트
	public List<HashMap<String, Object>> getListEmp(HashMap<String, Object> map) {
		List<HashMap<String, Object>> list = this.sqlSession.selectList(nameSpaceName + "getListEmp", map);
		return list;
	}//getListEmp
	
	//발령처리
	public void hrapntRegPro(HashMap<String, Object> map) {
		List<String> list = new ArrayList<String>();
		list = (List<String>) map.get("empEmno_List");
		System.out.println( list.get(0) );
		this.sqlSession.insert(nameSpaceName + "hrapntRegPro", map);
	}//hrapntRegPro
	
	//발령 리스트 max 값
	public int getHrapntRsListMaxNum(HashMap<String,Object> map) {
		return ((Integer)this.sqlSession.selectOne(nameSpaceName+"getHrapntRsListMaxNum",map));
	}//getHrapntRsListMaxNum
	
	//발령 리스트
	public List<HashMap<String, Object>> getHrapntRsList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> list = this.sqlSession.selectList(nameSpaceName + "getHrapntRsList", map);
		
		//System.out.println("ssssss1234:"+ list.get(0).get("apntTypeNm") );
		//System.out.println("ssssss1234:"+ list.get(0).get("hrapntnum") );
		//System.out.println("ssssss1234:"+ list.get(1).get("apntTypeNm") );
		//System.out.println("ssssss1234:"+ list.get(1).get("hrapntnum") );
		
		//rs : 
		//ssssss1234:1
		//ssssss1234:null
		//
		return list;
	}//getHrapntRsList
	
	
}
