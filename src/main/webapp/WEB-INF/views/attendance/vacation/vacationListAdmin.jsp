<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가조회(관리자)</title>
</head>
<body>
	<div class="main" style="min-height: 867px;" id="mainDiv">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">휴가조회(관리자)</h3>
				<div class="panel panel-headline">
					<div class="panel-body">
						<form class="form-inline" id="vacListAdminFrm" name="vacListAdminFrm">							
							기준년도
							<div class="input-group date" id="yearDateTimePicker"><!-- 달력 -->
								<input type="text" class="form-control" id="baseYear" name="baseYear" />
								<span class="input-group-addon"> 
									<span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
								</span>
							</div> &nbsp;&nbsp;&nbsp;
							<input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어 입력"> 
							<input type="button" class="btn btn-primary" name="search" value="검색" onclick="searchClick()">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<!-- 정렬 조건 -->
							<select name="retTypeList" id="retTypeList" value="" class="form-control"><!-- 퇴직 여부 -->
								<option value="N">재직</option>
								<option value="Y">퇴직</option>
							</select> 
							<select name="deptNameList" id="deptNameList" value="부서별" class="form-control"><!-- 부서 -->
							</select> 
							<select name="rankNameList" id="rankNameList" value="직급별" class="form-control"><!-- 직급 -->
							</select>
							<!-- 새로고침 -->
							<input type="button" class="btn btn-primary" name="reStart" value="전체보기" onclick="window.location.reload()">
							<input type="hidden" id="retHidden"><!-- 네임으로 하면 파라미터 값이 넘어감 -->
							<input type="hidden" id="deptHidden">
							<input type="hidden" id="rankHidden">
							<button class="btn btn-danger" type="button" name="prog"
								style="float: right;" onclick="vacationProgressList()">
								휴가신청현황 <span class="badge" id="countNum"></span>
							</button>
						</form>
					</div>
				</div>
				<div class="panel panel-headline">
				<input type="hidden" id="empInfoHidden" name="empInfoHidden">
					<div class="panel-body"> 
						<div class="list_wrapper">
							<table class="table tablesorter" id="vacListTable">
								<thead>
									<tr>
										<th>구분</th>
										<th>사원번호</th>
										<th>성명</th>
										<th>부서</th>
										<th>직위</th>
										<th>전체</th>
										<th>사용일수</th>
										<th>잔여일수</th>
									</tr>
								</thead>
								<tbody id="vacListTbody" name="vacListTbody">
								</tbody>
							</table>
						</div>
						
						<!-- Modal -->
						<div id="myModal" class="modal fade" role="dialog">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content"><!-- Modal content-->
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal">&times;</button>
						        <p class="modal-title">사원별 휴가현황</p>
						      </div>
						      <div class="modal-body">
						      <form class="form-inline" id="empVacFrm" value="">
						      	<input type="hidden" id="empEmno" name="empEmno" value="">
						        <h4 class="page-title" align="center" id="empInfoH"></h4> <!-- 클릭한 사원에 따라 바뀌게 -->
						        <div class="list_wrapper">
											<table class="table table-bordered" id="empVacListTable">
												<thead>
													<tr>
														<th>번호</th>
														<th>신청일자</th>
														<th>휴가항목</th>
														<th>휴가기간</th>
														<th>일수</th>
														<th>휴가사유</th>
													</tr>
												</thead>
												<tbody id="empVacListTbody">
													<tr>
													</tr>

												</tbody>
											</table>
										</div>
						      </form>
						      </div><!-- modal-body -->
						      <div class="modal-footer">
						      </div>
						    </div>
						  </div>
						</div>
						    
						<div class="text-center"><!-- 버튼영역 -->
							<button type="button" class="btn btn-primary" id="printBtn" onClick="vacListPrint()">인쇄하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" id="excelBtn" onClick="vacListExcelExport()">엑셀다운</button>
						</div><!-- END 버튼영역 -->
					</div>
				</div>
			</div>
		</div><!-- END MAIN CONTENT -->
	</div><!-- END MAIN -->
</body>
</html>