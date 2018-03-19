<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일일근태등록</title>
<script>
	
	/* 근무일자 달력 함수 */
	$(function () {
		$('#workingDate').datetimepicker({ //근무일자 달력
			viewMode: 'days',
			format: 'YYYYMMDD'
		});
	$('#workingDateId').val(moment().format('YYYY-MM-DD'));//페이지 시작시 날짜 자동입력
	});
	
	/*INSERT 출근*/
    function attend_In_Action(){
   	 var formName = document.dailAttdFrm;
   	 formName.action="insertDailAttReg";
   	dailAttdFrm.submit();
   	alert("출근처리 되었습니다.");
    };
    
    /*INSERT 퇴근*/
    function attend_Out_Action(){
   	 var formName = document.dailAttdFrm;
   	 formName.action="updateDailAttReg";
   	dailAttdFrm.submit();
    alert("퇴근처리 되었습니다.");
    };
	
/* ajax-INSERT 출근*/	
 /* 
 //결과값에 대한 ajax alert 띄울시에 사용 
	function attend_onclick(url, formId){
		paging.ajaxFormSubmit(url, formId, function(rslt){
			console.log("ajaxFormSubmit -> callback");
			console.log("success" + rslt.success);
			console.log("resultList" + rslt.resultList);
			console.log("결과데이타" + JSON.stringify(rslt));

			if(rslt.success =="Y" ){
				alert("출근처리 되었습니다.");
			}else{
				alert("출근 처리 오류");
			}
		});
	}
 */

</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
			<div class="main-content">
				<div class="container-fluid">
				<h3 class="page-title">일일근태등록</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" id="dailAttdFrm" name="dailAttdFrm" method="post" action="/spring/readDailAttdReg">
							<table class="table table-bordered">
								<tr>
									<td align="center">근무일자</td>
									<td>
										<!-- 달력 : 근무일자 -->										
										<div class="input-group date" id="workingDate">
											<input type="text" class="form-control" id="workingDateId" name="attendedDate"/>
												<span class="input-group-addon">
													<span class="fa fa-calendar" />
												</span>
										</div>
										<input type="submit" class="btn btn-danger btn-xs" style="float:right;"name="search" onClick="" value="검색">
									</td>
								</tr>							
							</table>
						</form>
					</div>
				</div>
				<div class="panel panel-headline">
					<div class="panel-heading">	
						<div class="panel-body">
							<div class="list_wrapper">	
								<table class="table table-bordered">
									<input type="button" class="btn btn-danger btn-xs" onClick="attend_Out_Action()" style="float:right;"name="leavework" value="퇴근">
									<input type="button" class="btn btn-danger btn-xs" onClick="attend_In_Action()" style="float:right;"name="attendance" value="출근">
								<h4>◈ 일일근태등록</h4>
									<thead>
										<tr align="center">
											<td>사원번호</td>
											<td>이름</td>
											<td>출근시간</td>
											<td>퇴근시간</td>
											<td>근무시간</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${resultList}">
											<tr align="center" >
												<td>${item.empEmno}</td>
												<td>${item.empName}</td>
												<td>${item.wrkIn}</td>
												<td>${item.wrkOut}</td>
												<td>${item.wrkTm}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>