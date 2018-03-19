package com.example.spring.attendance.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring.attendance.service.BusinessTripService;

@Controller
public class BusinessTripController {

	private static final Logger logger = LoggerFactory.getLogger(BusinessTripController.class);
	
	@Autowired
	private BusinessTripService businessTripService; //서비스
	
	//출장관리 - 출장정산
	@RequestMapping(value = "/businessAdj")
	public String businessAdj() {
		return "businessAdj";
	}
	
	//출장신청
	@RequestMapping(value = "/businessRequest")
	public String businessRequestPage() {
		return "businessRequest";
	}

	//출장신청 사원정보조회
	@RequestMapping(value="/businessRequestEmpList.ajax")
	public @ResponseBody HashMap<String, Object> businessRequestEmpList(
			@RequestParam HashMap<String,Object> map) {
		
		logger.info("파라미터: " + map);
		
		List<HashMap<String,Object>> list = businessTripService.businessRequestEmpList(map);
		

		if(list == null) {
			map.put("success", "N");
		}else {
			map.put("empList", list);
			
			if(!(map.get("empList").toString()).equals("[]")) {
				map.put("success", "Y");
			}else {
				map.put("success", "N");
			}//if
		}

		return map;
	}

	//출장신청 insert
	@RequestMapping(value = "/businessRequestInsert.ajax")
	public @ResponseBody HashMap<String,String> businessRequest(
			@RequestParam HashMap<String,String> map) {

		logger.debug("parameter >>>  " + map);

		int list = businessTripService.businessRequest(map);

		if(list == 0) {
			map.put("success", "N");
		}else {
			map.put("success", "Y");
		}

		return map;
	}
	
}
