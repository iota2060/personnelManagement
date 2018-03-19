package com.example.spring.salmanager.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("PayimfDao")
public class PayimfDao {

	@Autowired // sqlSession에 자동으로 값을 넣어준다
	private SqlSession sqlSession; // 실질적으로 쿼리를 날리는 객체
	private String nameSpaceName = "allowance.";
	
	public List<HashMap<String, String>> getAllowanceData(){
		List<HashMap<String, String>> list = null;
		
		String divSal = "basic";
		
		list = this.sqlSession.selectList(nameSpaceName + "allowanceList",divSal);
		
		return list;
	}
	
	public int allowanceDataInsert(HashMap<String, String> map){
		
		List<HashMap<String, String>> list = null;
		list = getAllowanceData();
		
		int rsNum = 0;
		if( list.size() == 0 ){
			this.sqlSession.insert(nameSpaceName + "allowanceInsert",map);
			rsNum = 1;
		}else if( list.size() == 1 ){
			this.sqlSession.update(nameSpaceName + "allowanceUpdate",map);
			rsNum = 1;
		}else {
			//System.out.println( "basic 값이 없거나 하나 있지 않습니다." );
		}
		
		return rsNum;
	}
	
	
}

