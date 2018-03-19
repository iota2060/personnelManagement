<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴일 /연장 /야간근무 조회</title>
<script>
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
	<div class="main" id="mainDiv">
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">휴일 /연장 /야간근무 조회</h3>
				
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" action="/spring/readHdayExtnNightWorkInqr">
							<i class="fa fa-asterisk-red" aria-hidden="true" ></i>근무년월
							<!-- 달력 -->
							<div class="input-group date" id="monthDate">
							  	<input type="text" class="form-control" id="modeApplicationDate" name="workYyMm"/>
							    <span class="input-group-addon">
								    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
							    </span>
						  	</div>
							<!-- 사원번호 -->
							<i class="fa fa-asterisk-red" aria-hidden="true" ></i>사원번호
							<div class="input-group">
								<input type="text" class="form-control" id="empEmno" name="empEmno" placeholder="사번">
								<span class="input-group-addon" data-toggle="modal" data-target="#empEmnoModal" style="cursor:pointer" onclick="vacationReqEmpList()">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span> <!-- 검색 아이콘 -->
								</span>
							</div>
							<!-- 검색버튼 -->
						  	<input type="button" class="btn btn-primary" style="float:right; name="search" value="검색" onclick="empListPrint(1)"/>
						  	<!-- <input type="submit" class="btn btn-primary" style="float:right; name="search" value="검색"> -->
						</form>
					</div>
				</div>
				
				<div class="panel panel-headline">
					<div class="panel-heading">
						<h3 class="panel-title">휴일 /연장 /야간근무 조회</h3>
							<!-- <p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
					</div>
					<div class="panel-body">
						<div class="list_wrapper">
							<table class="table tablesorter table-bordered" id="empInfoTable">
								<thead>
									<tr>
										<th>사원번호</th>
										<th>성명</th>
										<th>직급</th>
										<th>부서</th>
										<th>근태종류</th>
										<th>근태시간</th>
										<th>근태일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${resultList}">
										<tr>
											<td>${item.empEmno}</td>
											<td>${item.empName}</td>
											<td>${item.rankCode}</td>
											<td>${item.depCode}</td>
											<td>${item.attendanceType}</td>
											<td>${item.costWrkTime}</td>
											<td>${item.costWrkIn}</td>
										</tr>
									</c:forEach>
									<!-- <tr>
										<td>??</td>
										<td>??</td>
										<td>??</td>
										<td>??</td>
										<td>??</td>
										<td>??</td>
										<td>??</td>
									</tr> -->
								</tbody>
							</table>
							<!-- paging 영역 -->
							<!-- <div align="center">
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
							</div> -->
							<div align="center">
									<nav name="pagingNav" aria-label='Page navigation example' align='center'></nav>
							</div>
							<!-- END list table 영역 -->
							    
							<!-- 버튼영역 -->
							<div class="text-center"> 
								<button type="button" class="btn btn-info" onclick="attListPrint()">인쇄하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-success" onclick="attListExcelExport()">엑셀다운</button>
							</div>
							<!-- END 버튼영역 -->
							
						</div>
					</div>
				</div>
				
				<!--*********** 사원번호 Modal***************** -->
				<div id="empEmnoModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">
					  
					  
					  <!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<p class="modal-title">사번 정보 조회</p>
							</div>
							<div class="modal-body"><!-- 검색부분 -->
								<div class="search_wrap" style="padding: 0px 10px 20px 15px; ">
									<form class="form-inline" id="vacEmpListModal">
										검색어
										<select name="seacrchOption" class="form-control">
											<option value="empEmno">사번</option>
											<option value="empName">성명</option>
											<option value="deptName">부서</option>
										</select>
										<input type="text" class="form-control" name="keyword">&nbsp;&nbsp;&nbsp;
										<label class="fancy-checkbox-in	line">
											<input type="checkbox" id="retrChk">
											<span>퇴직자 포함</span>
										</label>
										<input type="hidden" name="retrDelYn" id="retrDelYn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="hidden" name="baseYear">
										<input type="button" class="btn btn-primary" style="float:right;" id="searchBtn" onclick="vacationReqEmpList()" value="검색">
									</form>
								</div>
					
								<div class="list_wrap">
									<table class="table tablesorter" id="vacCntEmpListTable">
											<thead style="display:table;width:100%;table-layout:fixed;">
												<tr>
													<th class="sorter-false"></th>
													<th>구분</th>
													<th>사원번호</th>
													<th>성명</th>
													<th>부서</th>
													<th>직급</th>
												</tr>
											</thead>
											<tbody id="vacCntEmpListTbody" style="display:block;height:200px;overflow:auto;">
											</tbody>
										</table><!-- vacEmpList END -->
								</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="empEmnoClick()">선택</button>
							</div>
							</div>
						</div>

				</div>
			</div>
			<!-- END MODAL -->
				
			</div>
			<!-- END CONTAINER-FLUID" -->
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
</body>
<script src="/spring/resources/common/js/pagingNav.js"></script>
<script src="/spring/resources/common/management/js/menuTree.js"></script>
<script type="text/javascript">
	/* ****************************사원 선택 모달창************************** */
	//퇴직자 포함 체크 여부
	function retrCheck(){
		if(($('#retrChk').prop('checked')) == true){
			$('#retrDelYn').val('on');
		} else{
			$('#retrDelYn').val('off');
		}
	}
	
	//모달창 : 사원 리스트 ajax(사원 휴가일수 리스트 참조)
	function vacationReqEmpList(){
		retrCheck();	//퇴직자 포함 체크 여부
		$("input[type=hidden][name=baseYear]").val(moment().format('YYYY'));	//휴가개수 설정년도
		$('#vacCntEmpListTbody').empty();	//이전 리스트 삭제
		
		paging.ajaxFormSubmit("vacationReqEmpList.ajax","vacEmpListModal", function(rslt){
			console.log("결과데이터: "+ JSON.stringify(rslt));
			
			$('#vacCntEmpListTable').children('thead').css('width','calc(100% - 1.1em)');	//테이블 스크롤 CSS
			
			if(rslt.vacationReqEmpList == null || rslt.success == "N"){
				$('#vacCntEmpListTbody').append(	//리스트가 없을 경우
					"<div class='text-center'><br><br><br><br>조회할 데이터가 없습니다.</div>"	
				);
			} else if(rslt.success == "Y"){
				$.each(rslt.vacationReqEmpList, function(k, v){
					$('#vacCntEmpListTbody').append(
							"<tr style='display:table;width:100%;table-layout:fixed;'>" +
								"<td>"+
									"<label class='fancy-checkbox-inline'>" +
										"<input type='checkbox' name='empEmnoChk'>" +
										"<span></span>" +
									"</label>" +
								"</td>" +
								"<td>" +v.retrDelYn+"</td>"+	//퇴직자 구분
								"<td>" +v.empEmno+"</td>"+	//사원번호
								"<td>" +v.empName+"</td>"+	//사원이름
								"<td>" +v.deptName+"</td>"+	//부서명
								"<td>" +v.rankName+"</td>"+	//직급명
							"</tr>"									
					);//Tbody
				}); //each.list
				
				$("input[type='checkbox'][name=empEmnoChk]").click(function(){	// 체크박스 선택 1개로 제한(라디오버튼처럼)
					if($(this).prop('checked')){ //check 이벤트가 발생했는지
						//체크박스 전체를 checked 해제후 click한 요소만 true로 지정
						$("input[type='checkbox'][name=empEmnoChk]").prop("checked", false);
						$(this).prop('checked',true);
					}
				});
				
				//테이블 내용 가운데 정렬
				$('#vacCntEmpListTable tr').children().addClass('text-center');
				
				$(function(){ //테이블 정렬
					$("#vacCntEmpListTable").tablesorter();
				});
				$(function(){
					$("#vacCntEmpListTable").tablesorter({sortList: [[0,0], [1,0]]});
				});
				
			}// else if
		});//paging.ajax
	}//vacEmpList
	
	//선택한 사원정보를 휴가신청 폼에 자동 입력하기
	function empEmnoClick(){
		var chkTr = $('input[name=empEmnoChk]:checked').closest('tr'); //체크된 체크박스와 가장 가까운 tr
		var empEmnoVal = chkTr.children().eq(2).text(); //tr 하부 2번째 td의 텍스트(사번)
		var empNameVal = chkTr.children().eq(3).text(); //tr 하부 3번째 td의 텍스트(이름)
		var deptNameVal = chkTr.children().eq(4).text(); //tr 하부 4번째 td의 텍스트(부서)
		var rankNameVal = chkTr.children().eq(5).text(); //tr 하부 5번째 td의 텍스트(직급)	
		
		$('#empEmno').val(empEmnoVal);
		//$('#empName').val(empNameVal);
		//$('#deptName').val(deptNameVal);
		//$('#rankName').val(rankNameVal);
		//$(".modal-body input[name=keyword]").val(""); //키워드 내용 지우기
	}
	
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
		var empEmno = $('#empEmno').val();
		
		var url = "/spring/readHdayExtnNightWorkInqr";
		var data = {  "workYyMm": workYyMm
					, "empEmno" : empEmno
					, "choicePage" : choicePage
					, "viewNoticeMaxNum" : viewNoticeMaxNum
				};
		var str = "";
		var thisList;
		
		paging.ajaxSubmit(url, data, function(result) {
			
			thisList = result.resultList;
			thisListCnt = result.resultListCnt;
			
			if(thisList != null){
				$.each(thisList, function(index){
					
					str += "<tr class='text-center'>";
					str += "	<td>" + thisList[index].empEmno 		+ "</td>";
					str += "	<td>" + thisList[index].empName 		+ "</td>";
					str += "	<td>" + thisList[index].rankCode 		+ "</td>";
					str += "	<td>" + thisList[index].depCode 		+ "</td>";
					str += "	<td>" + thisList[index].attendanceType 	+ "</td>";
					str += "	<td>" + thisList[index].costWrkTime 	+ "</td>";
					str += "	<td>" + thisList[index].costWrkIn 		+ "</td>";
					str += "</tr>";
				});
				
				$("#empInfoTable tbody").children().remove();
				$("#empInfoTable tbody").append(str);
				
				//detailEvent();
				
				var obj = {  "totalNoticeNum":thisListCnt 
						   , "choicePage":choicePage 
						   //, "viewNoticeMaxNum":viewNoticeMaxNum
						   //, "viewPageMaxNum":viewPageMaxNum
						   };
				$("nav[name='pagingNav']").pagingNav(obj, "pageClick");
	
			}
		});
	}
	
	//인쇄
	function attListPrint(){
		$('#mainDiv').printElement();
	}
	
	//엑셀 다운
	function attListExcelExport(){
		$("#empInfoTable").excelexportjs({
			containerid: 'empInfoTable',
			datatype: 'table'
		});
	}
</script>
</html>