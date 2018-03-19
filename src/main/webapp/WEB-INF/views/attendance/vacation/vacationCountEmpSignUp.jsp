<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가일수설정 - 사원등록</title>
<link rel="stylesheet" href="/spring/resources/common/css/vacation.css" />
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
			<h3 class="page-title">사원등록</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" id="vacCntSelectFrm">
							기준년도
							<div class="input-group date" id="yearDateTimePicker"><!-- 달력 -->
						  	<input type="text" class="form-control" id="baseYear" name="baseYear"/>
						    <span class="input-group-addon">
							    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
						    </span>
						  </div>&nbsp;&nbsp;&nbsp;
							검색어
							<select name="searchOption" class="form-control">
								<option value="empEmno">사번</option>
								<option value="empName">성명</option>
								<option value="deptName">부서</option>
							</select>
							<input type="text" class="form-control" name="keyword">&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn btn-primary" id="searchBtn" style="float:right;" onclick="vacationCountEmpSignUpList()" value="검색">
						</form>
					</div>
				</div>
				
				<div class="panel panel-headline">
					<div class="panel-body"> 
						<div class="list_wrapper">
							<form class="form-inline" id="vacCntEmpFrm">
								<table class="table" id="vacCntEmpListTable">
									<thead style="display:table;width:100%;table-layout:fixed;">
										<tr>
											<th class="sorter-false">
												<label class="fancy-checkbox-inline">
													<input type="checkbox" id="retrChkAll" onclick="checkAllFunc()">
													<span></span>
												</label>
												<input type="hidden" name="empEmnoResult" id="empEmnoResult">
											</th>
											<th>사원번호</th>
											<th>성명</th>
											<th>부서</th>
											<th>직위</th>
											<th>입사일</th>
											<th>이관여부</th>
										</tr>
									</thead>
									<tbody id="vacCntEmpListTbody" style="display:block;height:400px;overflow:auto;">
									</tbody>
								</table>
							</form>
						</div><!-- END list table 영역 -->						
						<div class="text-center"><br><!-- 버튼영역 -->
							<button type="button" class="btn btn-primary" id="vacCntSaveBtn" onclick="vacCntSave()">저장하기</button>
						</div><!-- END 버튼영역 -->
					</div>
				</div>
			</div>
		</div><!-- END MAIN CONTENT -->
	</div><!-- END MAIN -->
</body>
</html>