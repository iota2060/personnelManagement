<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가신청현황</title>
<link rel="stylesheet" href="/spring/resources/common/css/vacation.css" />
<link rel="stylesheet" href="/spring/resources/common/css/bootstrap2-toggle.min.css" />
<style>
.table > tbody > tr > td { 
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">휴가신청현황</h3>
				<div class="panel panel-headline">
					<div class="panel-body">
						<form class="form-inline" name="f1" id="f1">
							신청년도
							<div class="input-group date" id="yearDateTimePicker">
								<input type="text" class="form-control" id="baseYear" name="baseYear"/>
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
								</span>
							</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어 입력"> 
							<input type="button" class="btn btn-primary" name="search" value="검색" onclick="searchClick()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="deptNameList" id="deptNameList" value="부서별" class="form-control"><!-- 부서 -->
							</select> 
							<select name="rankNameList" id="rankNameList" value="직급별" class="form-control"><!-- 직급 -->
							</select>
							<select name="situationList" id="situationList" class="form-control">
								<option value="">전체보기</option>
								<option value="승인대기">승인대기</option>
								<option value="승인완료">승인완료</option>
								<option value="승인취소">승인취소</option>
							</select>
							<input type="hidden" id="deptHidden"><!-- 네임으로 하면 파라미터 값이 넘어감 -->
							<input type="hidden" id="rankHidden">
							<input type="hidden" id="situationHidden"><!-- 결재상태 -->
						</form>
					</div>
				</div>
				<div class="panel panel-headline">
					<div class="panel-body"> 
						<div class="list_wrap">
							<form class="form-inline" name="f2" id="f2">
								<table class="table tablesorter table-hover" id="progressTable" name="progressTable">
									<thead>
										<tr>
											<th class="sorter-false" style="width:6%;">
												<label class="fancy-checkbox-inline">
													<input type="checkbox" onclick="checkAllFunc(this)">
													<span></span>
												</label>
												<input type="hidden" name="progToggleResult" id="progToggleResult" value="">
<!-- 												<input type="hidden" name="vacationDel" id="vacationDel" value=""> -->
											</th>
											<th>사원번호</th>
											<th>이름</th>
											<th>부서</th>
											<th>직급</th>
											<th>신청일</th>
											<th>휴가구분</th>
											<th>휴가기간</th>
											<th>일수</th>
											<th>휴가사유</th>
											<th style="padding-left:0.5em">결재상태</th>
										</tr>
									</thead>
									<tbody id="progressTbody">
									</tbody>
								</table>
							</form>
						</div><!-- END list table 영역 -->
						
						<!-- 버튼영역 -->
						<div class="text-center"> 
							<button type="button" id="butOff" class="btn btn-info" onclick="toggleOff()">승인취소</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="butCom" class="btn btn-info" onclick="toggleOn()">승인완료</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" onclick="vacProgSave()">저장하기</button>
						</div>
						<!-- END 버튼영역 -->
					</div>
				</div>
			</div>
			
		</div><!-- END MAIN CONTENT -->
	</div><!-- END MAIN -->
</body>
</html>