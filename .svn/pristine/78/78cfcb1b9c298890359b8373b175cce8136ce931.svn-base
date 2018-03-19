package com.example.spring.personnel.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.spring.personnel.dao.CertificateDao;

@Service
public class CertificateService {
	
	@Resource(name="certificateDao")
	private CertificateDao certificateDao;
	
	//증명서 maxNum
	public int certificateMaxNum(HashMap<String, Object> map) {
		
		if(!map.get("crtfSelect").equals("전체")) {
			map.put("commCode",certificateDao.certificateCommCode(map)); //증명서코드
		}
		
		return certificateDao.certificateMaxNum(map);
	}
	
	//증명서 정보 가져오기
	public List<String> certificateList(HashMap<String, Object> map){
		
		if(!map.get("crtfSelect").equals("전체")) {
			map.put("commCode",certificateDao.certificateCommCode(map)); //증명서코드
		}
		
		int choicePage = Integer.parseInt((String)map.get("choicePage"));
		int viewNoticeMaxNum = 10;
		int noticeCount= 0; //게시물 시작 순번
		
		noticeCount = (choicePage-1)*viewNoticeMaxNum;
		
		map.put("noticeCount", noticeCount);
		map.put("viewNoticeMaxNum", viewNoticeMaxNum);
		
		List<String> list = certificateDao.certificateList(map);
		
		return list;
	}
	
	//사원정보가져오기
	public HashMap<String, Object> empInfo(String emno){
		
		HashMap<String, Object> map = certificateDao.empInfo(emno);
		
		return map;
	}
	
	//증명서 상세보기
	public HashMap<String, Object> certificateSearchInfo(int crtfSeq){
		
		HashMap<String, Object> map = certificateDao.certificateSearchInfo(crtfSeq);
		
		return map;
	}
	
	//증명서 신청
	public int certificateInsert(HashMap<String, Object> map) {
		
		map.put("commCode",certificateDao.certificateCommCode(map)); //증명서코드
		map.put("crtfProgressSituation", "승인대기");	//전자결제상태
		map.put("crtfIssueDate", "");	//발행일
		map.put("crtfDelYn", "N"); //삭제유무
		
		int result = certificateDao.certificateInsert(map);
		
		return result;
	}
	
	//증명서신청 시 사원정보
	public HashMap<String,String> certificateRequestEmpInfo(String empEmno){
		
		HashMap<String,String> map = certificateDao.certificateRequestEmpInfo(empEmno);
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String crtfRequestDate = sdf.format(calendar.getTime());
		
		map.put("crtfRequestDate",crtfRequestDate);
		
		return map;
		
	}//certificateRequestInfo
	
	//증명서 신청내역 목록
	public List<HashMap<String,Object>> certificateRequestList(HashMap<String,Object> paramMap){
		
		List<HashMap<String,Object>> list = certificateDao.certificateRequestList(paramMap);
		
		return list;
		
	}//certificateRequestList
	
	//증명서 삭제
	public int certificateDelete(HashMap<String, Object> map) {
		
		int result = certificateDao.certificateDelete(map);
		
		return result;
	}
	
	//재직증명서
	public HashMap<String, Object> workCertificate(HashMap<String, Object> map){
		
		HashMap<String, Object> workMap = certificateDao.workCertificate(map);
		
		return workMap;
	}
	
}
