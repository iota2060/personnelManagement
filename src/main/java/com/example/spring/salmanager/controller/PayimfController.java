package com.example.spring.salmanager.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.salmanager.service.PayimfService;

@Controller
public class PayimfController {
	private static final Logger logger = LoggerFactory.getLogger(PayimfController.class);
	
	@Autowired
	private PayimfService payimfService;
	
	//private String PRE_VIEW_PATH = "SalManager/payimf/";
	
	@RequestMapping(value="allowanceData")
	public ModelAndView allowanceDataView(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();
		mv.addObject("list",payimfService.getAllowanceData());
		mv.setViewName("allowanceData");
		
		return mv;
	}
	
	@RequestMapping(value="allowanceDataInsert.do")
	public @ResponseBody HashMap<String, String> allowanceDataInsert( @RequestParam HashMap<String, String> map ) {
		
//		HashMap<String, String> aMap = new HashMap<String, String>();
//		
//		String scomHhCst = map.get("scomHhCst");	/*주간근무시간당비용*/
//		String scomNhCst = map.get("scomNhCst");	/*야간근무시간당비용*/
//		String scomLhCst = map.get("scomLhCst");	/*지각*/
//		String scomElhCst = map.get("scomElhCst");	/*식대*/
//		String sempCmc = map.get("sempCmc");	/*차량유지비*/
//		
//		logger.debug("scomHhCst:"+scomHhCst );
//		logger.debug("scomNhCst:"+scomNhCst );
//		logger.debug("scomLhCst:"+scomLhCst );
//		logger.debug("scomElhCst:"+scomElhCst );
//		logger.debug("sempCmc:"+sempCmc );
//		
//		aMap.put("scomHhCst",scomHhCst);
//		aMap.put("scomNhCst",scomNhCst);
//		aMap.put("scomLhCst",scomLhCst);
//		aMap.put("scomElhCst",scomElhCst);
//		//aMap.put("sempCmc",sempCmc);
//		aMap.put("sempCmc","sssss");
		
		logger.debug("scomHhCst:"+map.get("scomHhCst") );
		
		map = payimfService.allowanceDataInsert(map);
		
		return map;
		//update222
	}
	
}
