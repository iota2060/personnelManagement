<!-- 
	잔여 연차 수당 마감(이월연차 수당으로 지급하는 게시판)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>잔여연차수당마감</title>
<link type="text/css" rel="stylesheet" href="/spring/resources/common/css/vacation.css" />
<script src="/spring/resources/common/js/pagingNav.js"></script>
<script>

	
	$(function() { 
		calender();
		$('.table tr').children().addClass('text-center'); //테이블 내용 가운데정렬
	});
	
	//달력
	function calender() {
		$('#baseYear').val(moment().format('YYYY-MM'));
    $('#monthDate').datetimepicker({
    	viewMode: 'months',
    	format: 'YYYY-MM'
    });
	};


</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">잔여연차수당마감</h3>
				<div class="panel panel-headline">
<!-- 					<div class="panel-heading"> -->
<!-- 						<h3 class="panel-title">휴가항목 선택</h3> -->
<!-- 							<p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
<!-- 					</div> -->
					<div class="panel-body">
						<form class="form-inline">
							기준년도
							<!-- 달력 -->
							<div class="input-group date" id="monthDate">
						  	<input type="text" class="form-control" id="baseYear"/>
						    <span class="input-group-addon">
							    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
						    </span>
						  </div>
							
							
							<input type="button" class="btn btn-primary" style="float:right;" name="search" value="검색">
						</form>
					</div>
				</div>
				
				<div class="panel panel-headline">
<!-- 					<div class="panel-heading"> -->
<!-- 						<h3 class="panel-title">제목</h3> -->
<!-- 					</div> -->
							
					<div class="panel-body"> 
						<div class="list_wrapper">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="text-center">구분</th>
										<th class="text-center">사원번호</th>
										<th class="text-center">성명</th>
										<th class="text-center">부서</th>
										<th class="text-center">직위</th>
										<th class="text-center">전체</th>
										<th class="text-center">사용일수</th>
										<th class="text-center">잔여일수</th>
										<th class="text-center">기타</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>재직</td>
										<td>123456</td>
										<td>개츠비</td>
										<td>개발팀</td>
										<td>팀장</td>
										<td>25</td>
										<td>25</td>
										<td>0</td>
										<td>결혼</td>
									</tr>
									<tr>
										<td>재직</td>
										<td>123456</td>
										<td>데이지</td>
										<td>기획팀</td>
										<td>팀장</td>
										<td>25</td>
										<td>25</td>
										<td>0</td>
										<td></td>
									</tr>
									<tr>
										<td>퇴직</td>
										<td>123456</td>
										<td>윌슨</td>
										<td>디자인</td>
										<td>대리</td>
										<td>20</td>
										<td>10</td>
										<td>10</td>
										<td>조부모상</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- END list table 영역 -->
						
						<!-- 페이징 네비게이션 시작 -->
						<nav name="pagingNav" aria-label='Page navigation example' align='center'>
						</nav>
						<!-- 페이징 네비게이션 끝 -->
						
						<!-- 버튼영역 -->
						<div class="text-right"> 
							<button type="button" class="btn btn-primary">마감하기</button>
						</div>
						<!-- END 버튼영역 -->
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
</body>
</html>