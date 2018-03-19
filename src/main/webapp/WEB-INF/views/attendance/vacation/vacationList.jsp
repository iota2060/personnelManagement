<!-- @author YSS -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가조회(사원)</title>
<style>
.table > tbody > tr > td { 
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="main" style="min-height: 867px;" id="mainDiv">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">휴가조회(사원)</h3>
				<div class="panel">
					<div class="panel-body">
						<form id="vacListFrm">
							<input type="hidden" name="empEmno" value="<%=(String)session.getAttribute("userEmno")%>"> <!-- 사원번호 -->
							<input type="hidden" name="vastSerialNumber">
						</form>
						<table class="table table-bordered" id="empInfo">	
							<tr>
								<th>사원번호</th>
								<td id="empEmno"></td>
								<th>성명</th>
								<td id="empName"></td>
								<th>연차기간</th>
								<td id="baseDate"></td> <!-- YYYY.MM.DD ~ YYYY.MM.DD -->
							</tr>
							<tr>
								<th>전체일수</th>
								<td id="emreVacUd"></td>
								<th>사용일수</th>
								<td id="emrePvacUd"></td>
								<th>잔여일수</th>
								<td id="remndrDate"></td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="panel panel-headline"> 
					<div class="panel-body">
						<div class="list_wrapper"><!-- list table 영역 -->
							<table class="table tablesorter" id="vacStatementTable">
								<thead style="display:table;width:100%;table-layout:fixed;">
									<tr>
										<th>번호</th>
										<th>신청일</th>
										<th>휴가항목</th>
										<th>휴가기간</th>
										<th>일수</th>
										<th>진행상태</th>
									</tr>
								</thead>
								<tbody id="vacStatementTbody" style="display:block;height:350px;overflow:auto;">
								<!-- ajax 내용 불러오기 -->
								</tbody>
							</table>
						</div><!-- END list table 영역 -->
					
						<div class="text-center"><!-- 버튼영역 -->
							<button type="button" class="btn btn-primary" id="printBtn" onClick="vacListPrint()">인쇄하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" id="excelBtn" onClick="vacListExcelExport()">엑셀다운</button>
						</div><!-- END 버튼영역 -->
						
						<!-- START Modal -->
						<div id="myModal" class="modal fade" role="dialog">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content"><!-- Modal content-->
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal">&times;</button>
						        <p class="modal-title">휴가조회</p>
						      </div>
						      <div class="modal-body">
										<form class="form-inline" id="vacReqFrm" name="vacReqFrm" method="post">
											<input type="hidden" name="updtEmpEmno" value="<%=(String)session.getAttribute("userEmno")%>">
											<input type="hidden" name="vastSerialNumber">
											<table class="table table-bordered">
												<tr>
													<td style="padding-left:1em">휴가신청일</td>
													<td>
														<div class="input-group date" id="crtDate">
													  	<input type="text" class="form-control" id="vastReqDate" name="vastReqDate"/>
													    <span class="input-group-addon">
														    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
													    </span>
													  </div>
													</td>
													<td>휴가구분</td>
													<td>
														<select name="vacationTypeList" class="form-control" id="vacationTypeList">
														</select>
														<input type="hidden" id="vacationTypeHidden">
													</td>
													<td>진행상태</td>
													<td style="padding-left:0.5em"><input type="text" class="form-control" name="vastProgressSituation" id="vastProgressSituation" value="승인대기" readonly></td>
												</tr>
												<tr>
													<td style="padding-left:1em">휴가기간</td>
													<td colspan="5" style="padding-left:0.5em">
													<div>
														<div class="input-group date" id="startDate"><!-- 달력-->
													  		<input type="text" class="form-control" id="vastStartDate" name="vastStartDate"/>
														    <span class="input-group-addon">
															    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
														    </span>
														</div>
														~
														<div class="input-group date" id="endDate">
													  		<input type="text" class="form-control" id="vastEndDate" name="vastEndDate"/>
														    <span class="input-group-addon">
															    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
														    </span>
													  </div>
														(일수: <input type="text" class="form-control" id="vastVacUd" name="vastVacUd" readonly>)
													</div>
													</td>
												</tr>
												<tr>
													<td style="padding-left:1em">휴가사유</td>
													<td colspan="5" style="padding-left:0.5em"><div><input type="text" class="form-control" name="vastCont" id="vastCont" size="100"></div></td>
												</tr>
											</table>
										</form>
						      </div><!-- modal-body -->
						      <div class="modal-footer" style="text-align:center;" id="footer">
										<button type="button" class="btn btn-primary" onClick="modalUpdate()">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-primary" onClick="modalDelete()">삭제</button>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
				</div>
			</div><!-- END MAIN CONTENT -->
		</div>
	</div><!-- END MAIN -->
</body>
</html>