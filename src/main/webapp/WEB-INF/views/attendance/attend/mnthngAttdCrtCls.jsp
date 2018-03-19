<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>월간 근태 생성/마감</title>
<script type="text/javascript">
		//테이블 내용 가운데정렬
		$(document).ready(function() { 
		    $('.table tr').children().addClass('text-center');
		    console.log('hg');
		});
		
		//달력
		$(function () {
		    $('#monthDate').datetimepicker({
		    	viewMode: 'months',
		    	format: 'YYYY-MM'
		    });
		});
</script>
</head>
<body>
	<div class="main">
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">월간 근태 생성/마감</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" action="/spring/readMnthngAttdCrtCls">
							<i class="fa fa-asterisk-red" aria-hidden="true" ></i>근무년월
							<!-- 달력 -->
							<div class="input-group date" id="monthDate">
							  	<input type="text" class="form-control" id="modeApplicationDate" name="workYyMm" value="${workYyMm}"/>
							    <span class="input-group-addon">
								    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
							    </span>
						  	</div>
						  	<!-- 검색버튼 -->
						  	<input type="button" class="btn btn-primary" style="float:right; name="search" value="검색" onclick="empListPrint(1)"/>
						  	<!-- <input type="submit" class="btn btn-primary" style="float:right; name="search"> -->
						</form>
					</div>
				</div>
					
				<div class="panel panel-headline">
					<div class="panel-heading">
						<h3 class="panel-title">월근태 사원정보</h3>
							<!-- <p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
					</div>
					<div class="panel-body">
						<div class="list_wrapper">
							<table class="table tablesorter table-bordered table-hover" id="empInfoTable">
								<thead>
									<tr>
										<th>사원번호</th>
										<th>성명</th>
										<th>직급</th>
										<th>부서</th>
										<th>호봉</th>					
									</tr>
								</thead>
								<tbody>
								 	<c:forEach var="item" items="${resultList}">
										<tr>
											<td>${item.empEmno}</td>
											<td>${item.empName}</td>
											<td>${item.rankCode}</td>
											<td>${item.depCode}</td>
											<td>${item.empAnl}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- paging 영역 -->
							<!-- 
							<div align="center">
								<ul class="pagination">
									<li>
										<a title="이전페이지" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
									</li>
									<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
								    <li><a href="#">4</a></li>
								    <li><a href="#">5</a></li>
								    <li>
										<a href="#" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</div>
							 -->
							<div align="center">
									<nav name="pagingNav" aria-label='Page navigation example' align='center'></nav>
							</div>
							<!-- END list table 영역 -->
						</div>
					</div>
				</div>
				
				<div class="panel panel-headline">
					<div class="panel-heading">
						<h3 class="panel-title">월근태 일수</h3>
							<!-- <p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
					</div>
					<div class="panel-body">
						<div class="list_wrapper">
							<table class="table tablesorter table-bordered" id="">
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>총근무일수</td>
									<td>
										<input type="text" class="form-control" id="totWorkdayCnt" placeholder="총근무일수" value="${resultSttsMap.totWorkdayCnt}">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>평일근무일수</td>
									<td>
										<input type="text" class="form-control" id="wkWorkdayCnt" placeholder="평일근무일수" value="${resultSttsMap.wkWorkdayCnt}">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴일근무일수</td>
									<td>
										<input type="text" class="form-control" id="hoilWorkdayCnt" placeholder="휴일근무일수" value="${resultSttsMap.hoilWorkdayCnt}">
									</td>
								</tr>
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴가사용일수</td>
									<td>
										<input type="text" class="form-control" id="vacUsedayCnt" placeholder="휴가사용일수" value="${resultSttsMap.vacUsedayCnt}">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>기타휴가일수</td>
									<td>
										<input type="text" class="form-control" id="etcUsedayCnt" placeholder="기타휴가일수" value="${resultSttsMap.etcUsedayCnt}">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>결근일수</td>
									<td>
										<input type="text" class="form-control" id="absencCnt" placeholder="결근일수">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div class="panel panel-headline">
					<div class="panel-heading">
						<h3 class="panel-title">월근태 시간(분)</h3>
							<!-- <p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
					</div>
					<div class="panel-body">
						<div class="list_wrapper">
							<table class="table tablesorter table-bordered" id="">
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>평일연장</td>
									<td>
										<input type="text" pattern="" class="form-control" id="wkExtWorkTime" name="wkExtWorkTime" placeholder="평일연장">									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>평일야간</td>
									<td>
										<input type="text" class="form-control" id="wkNightWorkTime" name="wkNightWorkTime" placeholder="평일야간">
									</td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴일근로</td>
									<td>
										<input type="text" class="form-control" id="holiWorkTime" name="holiWorkTime" placeholder="휴일근로">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴일연장</td>
									<td>
										<input type="text" class="form-control" id="holiExtWorkTime" name="holiExtWorkTime" placeholder="휴일연장">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴일야간</td>
									<td>
										<input type="text" class="form-control" id="holiNightWorkTime" name="holiNightWorkTime" placeholder="휴일야간">
									</td>
								</tr>
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>지각</td>
									<td>
										<input type="text" class="form-control" id="lateTime" name="lateTime" placeholder="지각">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>조퇴</td>
									<td>
										<input type="text" class="form-control" id="earlyLeaveTime" name="earlyLeaveTime" placeholder="조퇴">
									</td>
									<td colspan="2"></td>
								</tr>
							</table>
						</div>
						<!-- END list table 영역 -->
						
						<!-- 버튼영역 -->
						<div class="text-right">
							<button type="button" class="btn btn-danger" onclick="closeMnthAttd('ALL')">전체사원&nbsp;마감하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" onclick="closeMnthAttd('ONE')">개인사원&nbsp;마감하기</button>						
						</div>
						
						<!-- END 버튼영역 -->
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
	<script src="/spring/resources/common/js/pagingNav.js"></script>
	<script src="/spring/resources/common/management/js/menuTree.js"></script>
    <script>
    	var selectedEmpEmno = 'undefined';
    	var selectedEmpName = 'undefined';
    
   		// 테이블에서 선택된 행 값 얻어오기 :(이 기능은 화면 로딩 이후에 실행해야 정상동작)
		var detailEvent = function(){
			$('#empInfoTable tr').click(function(){    
					var tr = $(this);
					var td = tr.children();
					
					var empEmno = td.eq(0).text();
					var empName = td.eq(1).text();
					var workYyMm = $('#modeApplicationDate').val();
					
					selectedEmpEmno = 'undefined';
					selectedEmpName = 'undefined';
					
					selectedEmpEmno = empEmno;
					selectedEmpName = empName;
					
					$.ajax({
						  type : "POST"
						, url : "/spring/readMnthngAttdCrtClsStts"
						, data : {"empEmno":empEmno, "workYyMm":workYyMm}
						, dataType : "json"
						, success : function(data){
							console.log("성공");
							var resultSttsMap = data.resultSttsMap;
							
							$(resultSttsMap).each(function(index, element){
								$("#totWorkdayCnt").val(element.totWorkdayCnt);
								$("#wkWorkdayCnt").val(element.wkWorkdayCnt);
								$("#hoilWorkdayCnt").val(element.hoilWorkdayCnt);
								$("#vacUsedayCnt").val(element.vacUsedayCnt);
								$("#etcUsedayCnt").val(element.etcUsedayCnt);
								$("#absencCnt").val(element.absencCnt);
								
								$("#wkExtWorkTime").val(element.wkExtWorkTime);
								$("#wkNightWorkTime").val(element.wkNightWorkTime);
								$("#holiWorkTime").val(element.holiWorkTime);
								$("#holiExtWorkTime").val(element.holiExtWorkTime);
								$("#holiNightWorkTime").val(element.holiNightWorkTime);
								$("#lateTime").val(element.lateTime);
								$("#earlyLeaveTime").val(element.earlyLeaveTime);
							});
							
						}
						, error : function (xhr, status, error){
							console.log("에러발생 ");
							console.log("xhr : " + JSON.stringify(xhr));
							console.log("status : " + status);
							console.log("error : " + error);
						}
						, complete : function (event, request, settings){
							console.log("완료");
							console.log("event : " + JSON.stringify(event));
							console.log("request : " + request);
							console.log("settings : " + settings);
						}
					});		
					
				}		
			);
		};
		
		// 페이징설정값 
		var viewNoticeMaxNum = 10;
		//var viewPageMaxNum = 10;
		
		// 페이징처리
		var pageClick = function(target){
			searchStart(target.attr("name"));
		}
		
		// 리스트 전처리 후 출력 함수 호출
		var searchStart = function(choicePage){
			empListPrint(choicePage);
		}
		
		// 리스트 줄력함수
		var empListPrint = function(choicePage){
			
			if(choicePage == undefined){
				choicePage = 1;
			}
			
			var workYyMm = $('#modeApplicationDate').val();
			
			var url = "/spring/readMnthngAttdCrtCls";
			var data = {"workYyMm":workYyMm, "choicePage":choicePage, "viewNoticeMaxNum":viewNoticeMaxNum};
			var str = "";
			var thisList;
			
			paging.ajaxSubmit(url, data, function(result) {
				
				thisList = result.resultList;
				thisListCnt = result.resultListCnt;
				
				if(thisList != null){
					$.each(thisList, function(index){
						
						str += "<tr class='text-center'>";
						str += "	<td>" + thisList[index].empEmno + "</td>";
						str += "	<td>" + thisList[index].empName + "</td>";
						str += "	<td>" + thisList[index].rankCode + "</td>";
						str += "	<td>" + thisList[index].depCode + "</td>";
						str += "	<td>" + thisList[index].empAnl + "</td>";
						str += "</tr>";
					});
					
					$("#empInfoTable tbody").children().remove();
					$("#empInfoTable tbody").append(str);
					
					detailEvent();
					
					var obj = {  "totalNoticeNum":thisListCnt 
							   , "choicePage":choicePage 
							   //, "viewNoticeMaxNum":viewNoticeMaxNum
							   //, "viewPageMaxNum":viewPageMaxNum
							   };
					$("nav[name='pagingNav']").pagingNav(obj, "pageClick");
		
				}
			});
		}
		
		// 월 마감하기
		function closeMnthAttd(saveMode){
			if(saveMode == 'ALL'){
				var yn = confirm("전체사원 월마감을 하시겠습니까?");
				if(yn == false) return;
			} else {
				if(selectedEmpEmno == 'undefined'){
					alert("사원이 선택되지 않았습니다.");
					return;
				}
				var yn = confirm("사원번호 : " + selectedEmpEmno + "\r\n성  명 : " + selectedEmpName + "\r\n" + "개인사원 월마감을 하시겠습니까?");
				if(yn == false) return;
			}
			
			var url = "/spring/insertMnthngAttdCrtCls";
			var data = {  "saveMode" 		  : saveMode 
						, "empEmno" 		  : selectedEmpEmno
						, "totWorkdayCnt"     : $("#totWorkdayCnt").val()   	
						, "wkWorkdayCnt"      : $("#wkWorkdayCnt").val()  	
						, "hoilWorkdayCnt"    : $("#hoilWorkdayCnt").val()	
						, "vacUsedayCnt"      : $("#vacUsedayCnt").val()  	
						, "etcUsedayCnt"      : $("#etcUsedayCnt").val()   	
						, "absencCnt"		  :	$("#absencCnt").val()
						, "wkExtWorkTime"     : $("#wkExtWorkTime").val()   
						, "wkNightWorkTime"   : $("#wkNightWorkTime").val()   
						, "holiWorkTime"	  :	$("#holiWorkTime").val() 
						, "holiExtWorkTime"   : $("#holiExtWorkTime").val()   
						, "holiNightWorkTime" : $("#holiNightWorkTime").val()
						, "lateTime"          :	$("#lateTime").val() 		
						, "earlyLeaveTime"	  :	$("#earlyLeaveTime").val()
						, "workYyMm"          : $('#modeApplicationDate').val()
				};
			
			paging.ajaxSubmit(url, data, function(result) {
				if(result.success == 'Y'){
					alert("정상적으로 마감되었습니다.");
				} else {
					alert("저장 실패! 다시 시도해 주세요");
				}
			});
		}
		
	</script>
	
</body>
</html>