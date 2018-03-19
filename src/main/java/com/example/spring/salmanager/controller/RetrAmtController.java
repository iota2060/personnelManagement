package com.example.spring.salmanager.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class RetrAmtController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(RetrAmtController.class);
	
	@RequestMapping(value = "/retramt_main")
	public String goEmpMenu(HttpServletRequest request, Model model) throws Exception {

		return "SalManager/retramt/retramt_main";

	}
}
