<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/spring/resources/common/js/pagingNav.js"></script>
<link rel="stylesheet" href="/spring/resources/common/css/bootstrap-toggle.min.css" />
<script src="/spring/resources/common/js/bootstrap-toggle.min.js"></script>
<script>
	var emno = $("#empEmno").val();
	var deptCode = ${empInfo.deptCode};

	console.log("emno : " + emno);
	console.log("deptCode : " + deptCode);
	
	$(document).ready(function(){
		certificateList();
	});//페이지 로딩시 증명서 전체정보를 가져온다
	
	/* 
	$("#viewForm").find("button[name='progressSituation']").on("click",function(){
		
		if($("#viewForm").find("button[name='progressSituation']").text() == "승인완료"){
			$("#viewForm").find("button[name='progressSituation']").button('reset');
		}else{
			$("#viewForm").find("button[name='progressSituation']").button('complete');
			$("#viewForm").find("button[name='progressSituation']").attr(".btn-primary");
		}
		
	}); */
	
	console.log("dddd: " + $("#viewForm table tbody").find("tr:last").find("input[name='toggleSwitch']").attr("type"));

	//증명서 리스트
	var certificateList = function(choicePage){
		
		if(choicePage == undefined){
			choicePage = 1; //undefined 일시 선택페이지 1
		}
		
		var formId = $("#formId"); //formId
		
		formId.find("[name='choicePage']").val(choicePage); //선택페이지를 히든값에 넣어준다
		
		//관리자
		paging.ajaxFormSubmit("certificateList.do",formId.attr("id"),function(rslt){
			console.log("결과데이터 : " + JSON.stringify(rslt));
			
			var tbody = $("#tbodyId");
			var trName = $("tr[name='trName']");
			
			trName.remove(); //테이블의 tr제거
			
			$.each(rslt.crtfList,function(index){
				
				tbody.append("<tr name='trName' data-toggle='modal' data-target='#viewModal' onclick='certificateInfo($(this))'>"+
								"<td name='crtfSeq'>"+rslt.crtfList[index].crtfSeq+"</td>" +							//발행번호
			 					"<td name='empEmno'>"+rslt.crtfList[index].empEmno+"</td>" +							//사원번호
			 					"<td name='empName'>"+rslt.crtfList[index].empName+"</td>" +							//성명
			 					"<td name='commName'>"+rslt.crtfList[index].commName+"</td>" +							//증명서종류
			 					"<td name='crtfRequestDate'>"+rslt.crtfList[index].crtfRequestDate+"</td>" +			//신청일
			 					"<td name='crtfIssueDate'>"+rslt.crtfList[index].crtfIssueDate+"</td>"	+				//발행일
			 					"<td name='crtfProgressSituation'>"+rslt.crtfList[index].crtfProgressSituation+"</td>" +//결제상태
				 			  "</tr>");
			 });//each
			
			//페이징
			var obj = {};
			obj.totalNoticeNum = rslt.certificateMaxNum;//증명서 max값
			obj.choicePage = choicePage;
			 
			$("nav[name='pagingNav']").pagingNav(obj,function(target){
				certificateList(target.attr("name"));
			});//pagingNav 
			 
		});
		
		//사원
		paging.ajaxFormSubmit("certificateListEmp.do",formId.attr("id"),function(rslt){
			console.log("결과데이터 : " + JSON.stringify(rslt));
			
			var tbody = $("#tbodyId");
			var trName = $("tr[name='trName']");
			
			trName.remove(); //테이블의 tr제거
			
			$.each(rslt.crtfList,function(index){
				
				tbody.append("<tr name='trName' data-toggle='modal' data-target='#viewModal' onclick='certificateInfo($(this))'>"+
								"<td name='crtfSeq'>"+rslt.crtfList[index].crtfSeq+"</td>" +							//발행번호
			 					"<td name='empEmno'>"+rslt.crtfList[index].empEmno+"</td>" +							//사원번호
			 					"<td name='empName'>"+rslt.crtfList[index].empName+"</td>" +							//성명
			 					"<td name='commName'>"+rslt.crtfList[index].commName+"</td>" +							//증명서종류
			 					"<td name='crtfRequestDate'>"+rslt.crtfList[index].crtfRequestDate+"</td>" +			//신청일
			 					"<td name='crtfIssueDate'>"+rslt.crtfList[index].crtfIssueDate+"</td>"	+				//발행일
			 					"<td name='crtfProgressSituation'>"+rslt.crtfList[index].crtfProgressSituation+"</td>" +//결제상태
				 			  "</tr>");
			 });//each
			
			//페이징
			var obj = {};
			obj.totalNoticeNum = rslt.certificateMaxNum;//증명서 max값
			obj.choicePage = choicePage;
			 
			$("nav[name='pagingNav']").pagingNav(obj,function(target){
				certificateList(target.attr("name"));
			});//pagingNav
			 
		});
	}
	
	//검색 날짜선택시
	$("[name='startDate'],[name='endDate']").datetimepicker({ 
		viewMode : 'days',
		format : 'YYYY-MM-DD'
	});
	
	//검색버튼 클릭시
	var search = function(){
		certificateList();
	}
	
	//증명서 상세정보
	var certificateInfo = function(data){
		
		//각 tr의 정보(발행번호)를 가져온다
		var obj = {};
		obj.crtfSeq = data.find("td[name='crtfSeq']").text();	//발행번호
		
		paging.ajaxSubmit("certificateSearchInfo.exc",obj,function(rslt){
			var crtfSeq = rslt.crtfSeq;								//발행번호
			var empEmno = rslt.empEmno;								//사원번호
			var empName = rslt.empName;								//성명
			var commName = rslt.commName;							//증명서종류
			var crtfUse = rslt.crtfUse;								//용도
			var crtfRequestDate = rslt.crtfRequestDate;				//신청일
			var crtfIssueDate = rslt.crtfIssueDate;					//발행일
			var crtfProgressSituation = rslt.crtfProgressSituation 	//결제상태
			
			var formId = $("#viewForm");
			//viewForm에 데이터를 넣는다
			formId.find("[name='crtfSeq']").val(crtfSeq);							//발행번호
			formId.find("[name='empEmno']").val(empEmno);							//사원번호
			formId.find("[name='empName']").val(empName);							//성명
			formId.find("[name='crtfSelect']").val(commName).prop("selected",true);		//증명서종류
			formId.find("[name='use']").val(crtfUse);								//용도
			formId.find("[name='requestDate']").val(crtfRequestDate);				//신청일
			formId.find("[name='issueDate']").val(crtfIssueDate);					//발행일
			
			formId.find("tr:last > td").append('<input type="checkbox" id="toggle-two">');	//결제상태
			 $('#toggle-two').bootstrapToggle({
			      on: 'Enabled',
			      off: 'Disabled'
			    });
			//$("#swichhhhhhh").bootstrapToggle();
			
// 			$("#swichhhhhhh").on("click",function(){
// 				alert("rrr");
// 				if($("input[name='toggleSwitch']").prop("checked")){
// 					$("input[name='toggleSwitch']").prop("checked",true).change();
// 				}else{
					
// 				}
// 			});
			
		
			//상세보기, 미리보기 버튼 클릭시
			$("#viewBtn").click(function(){
				var url = "";
				
				if(formId.find("[name='crtfSelect']").val() == "재직증명서"){
					url = "workCertificate.exc?emno="+empEmno+"&crtfSeq="+crtfSeq;
				}else if(formId.find("[name='crtfSelect']").val() == "경력증명서"){
					url = "carriereCertificate.exc?emno="+empEmno+"&crtfSeq="+crtfSeq;
				}else if(formId.find("[name='crtfSelect']").val() == "퇴직증명서"){
					url = "rtirementCertificate.exc?emno="+empEmno+"&crtfSeq="+crtfSeq;
				}
			
				window.open(url, "_blank", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");		
			});
		});
		
			
		
		//사원정보가져오기
		obj.emno = data.find("td[name='empEmno']").text();
		
		paging.ajaxSubmit("empInfo.do",obj,function(rslt){
			 $("#viewModal #viewForm input[name='deptName']").val(rslt.deptName); //부서명
			 $("#viewModal #viewForm input[name='rankName']").val(rslt.rankName); //직위/직급명
		});
		
	}
	
	//증명서 삭제
	var certificateDelete = $("#deleteBtn").click(function(){
		
		//각 tr의 정보(발행번호)를 가져온다
		var obj = {};
		obj.crtfSeq = $("#viewModal").find("#viewForm").find("input[name='crtfSeq']").val();	//발행번호
		
		if(confirm("삭제하시겠습니까?") == true){
			paging.ajaxSubmit("certificateDelete.exc",obj,function(rslt){
				console.log("result : " + result);
				if(result > 0){
					alert("삭제되었습니다");
					location.href="/spring/certificateIssue.do";
				}else{
					alert("삭제실패. 다시 실행해주세요");
				}
			});
		} 
	});
	
</script>