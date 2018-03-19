package com.example.spring.salmanager.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.spring.salmanager.dao.EmpMenuDao;

@Service
public class EmpMenuService {
	
	@Resource(name="empMenuDao")
	private EmpMenuDao empMenuDao;
	
	public List newEmpList(HashMap<String, String> map) {
		List<HashMap<String,Object>> list = empMenuDao.newEmpList(map);
		
		return list;
	}
	
	public List exiEmpList(HashMap<String, String> map) {
		List<HashMap<String,Object>> list = empMenuDao.exiEmpList(map);
		
		return list;
	}
	
	public List exi_checkbox_Choice(HashMap<String, String> map) {
		List<HashMap<String,Object>> list = empMenuDao.exi_checkbox_Choice(map);
		
		return list;
	}
	
	public List checkbox_Choice(HashMap<String, Object>map) {
		List<HashMap<String, Object>> checkbox = empMenuDao.checkbox_Choice(map);
		
		return checkbox;
	}
	
	
	public void insert_newEmp_code(HashMap<String, String> map) {
		empMenuDao.insert_newEmp_code(map);
	} 
	
	public void update_newEmp_code(HashMap<String, String> map) {
		empMenuDao.update_newEmp_code(map);
	}
	
	public List<HashMap<String, String>> getAllowanceData(){
		List<HashMap<String, String>> list = empMenuDao.getAllowanceData();
		return list;
	}
}
