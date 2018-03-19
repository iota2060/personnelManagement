package com.example.spring.salmanager.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.example.spring.salmanager.dao.PayimfDao;

@Service
public class PayimfService {

	@Resource(name="PayimfDao") // 특정이름의 자원으로 쓸때 아이디롤 정해서 가져다 쓴다
	private PayimfDao payimfDao;
	
	public List<HashMap<String, String>> getAllowanceData(){
		
		List<HashMap<String, String>> list = payimfDao.getAllowanceData();
		
		return list;
	}
	
	public HashMap<String, String> allowanceDataInsert(HashMap<String, String> map){
		
		// basic 타입을 읽어 온다
		map.put("divSal", "basic");
		
		// 가져올 값이 없는 초기 경우 인서트 후 값을 다시 읽어서 map에 넣어 준다.
		int rsNum = payimfDao.allowanceDataInsert(map);	
		if( rsNum == 1) {
			map = getAllowanceData().get(0);
		}
		
		return map;
	}
	
	
}
