package com.example.spring.attendance.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.spring.attendance.dao.BusinessTripDao;

@Service
public class BusinessTripService {
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessTripService.class);

	@Resource(name="businessTripDao")
	private BusinessTripDao businessTripDao;
	
	private String PRE_VIEW_PATH = "/business/";

	
	//출장신청 사원정보조회
	public List<HashMap<String,Object>> businessRequestEmpList(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = businessTripDao.businessRequestEmpList(map);
		
		logger.debug("service>>> " + list);
		
		return list;
	}
	
	
	//출장신청 insert
	public int businessRequest(HashMap<String,String> map) {
		
		int list = businessTripDao.businessRequest(map);
		
		logger.debug("service>>> " + list);
		
		return list;
	}
}
