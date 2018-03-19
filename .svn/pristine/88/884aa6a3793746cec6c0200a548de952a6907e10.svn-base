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
	<div class="main">
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
								<input type="text" class="form-control" id="" name="empEmno" placeholder="사번">
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-search" aria-hidden="true" data-toggle="modal" data-target="#emnoModal"></span> <!-- 검색 아이콘 -->
								</span>
							</div>
							<!-- 검색버튼 -->
						  	<input type="submit" class="btn btn-primary" style="float:right; name="search" value="검색">
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
							<table class="table tablesorter table-bordered" id="">
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
							<!-- END list table 영역 -->
							    
							<!-- 버튼영역 -->
							<div class="text-center"> 
								<button type="button" class="btn btn-info">인쇄하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-success">엑셀다운</button>
							</div>
							<!-- END 버튼영역 -->
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>