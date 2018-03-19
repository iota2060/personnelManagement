package com.example.spring.attendance.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("businessTripDao")
public class BusinessTripDao {

	private static final Logger logger = LoggerFactory.getLogger(BusinessTripDao.class);
	
	@Autowired
	private SqlSession sqlSession;
	private String nameSpaceName = "business.";

	//출장신청 사원정보조회
	public List<HashMap<String,Object>> businessRequestEmpList(HashMap<String,Object> map) {
//		logger.debug("dao >>> "+map);
		
		List<HashMap<String,Object>> list
			= this.sqlSession.selectList(nameSpaceName + "businessRequestEmpList", map);
		
		logger.debug("dao List: "+list);
		
		return list;
	}
	
	
	//출장신청 insert
	public int businessRequest(HashMap<String,String> map) {
		logger.debug("dao >>> "+map);
		
		int list = this.sqlSession.insert(nameSpaceName + "businessRequest", map);
		
		logger.debug("dao List: "+list);
		
		return list;
	}
}
