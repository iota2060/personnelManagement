<!-- 
	휴가신청(사원) - 유성실,신지연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가신청</title>
<link type="text/css" rel="stylesheet" href="/spring/resources/common/css/vacation.css" />
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">휴가신청</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" id="vacReqFrm" name="vacReqFrm" method="post">
							<input type="hidden" name=""><!-- 권한 -->
							<input type="hidden" name="empEmno" value="<%=(String)session.getAttribute("userEmno")%>"><!-- 등록자 -->
							<input type="hidden" name="crtEmpEmno" value="<%=(String)session.getAttribute("userEmno")%>"><!-- 등록자 -->
							
							<table class="table table-bordered">
								<tr>
									<td>휴가신청일</td>
									<td>
										<!-- 사원 권한: 오늘 날짜 고정 -->
<!-- 									  <input type="text" class="form-control" name="vastCrtDate" id="tDate" readonly> -->
										
										<!-- 관리자 권한: 달력 -->
										<div class="input-group date" id="crtDate">
									  	<input type="text" class="form-control" id="vastReqDate" name="vastReqDate"/>
									  	<input type="hidden" class="form-control" id="vastCrtDate" name="vastCrtDate"/>
									    <span class="input-group-addon" id="calenderInp">
										    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
									    </span>
									  </div>

									</td>
									<td>휴가구분</td>
									<td>
<!-- 										<select class="form-control" name="vacationTypeList" id="vacationTypeList" onchange="vacSelect(this.vacReqFrm)"> -->
										<select class="form-control" name="vacationTypeList" id="vacationTypeList">
										</select>
										<input type="hidden" id="vacationTypeHidden"><!-- 휴가타입 히든 -->
									</td>
									<td>전자결재상태</td>
									<td style="padding-left:0.5em"><input type="text" class="form-control" name="vastProgressSituation" id="vastProgressSituation" value="승인대기" readonly></td>
<!-- 									<td><i class="fa fa-asterisk-red" aria-hidden="true" ></i>전일/반일</td> -->
<!-- 									<td> -->
<!-- 										<label class="fancy-radio-inline"> -->
<!-- 											<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> -->
<!-- 											<span><i></i>전일</span> -->
<!-- 										</label> -->
<!-- 	 									<label class="fancy-radio-inline"> -->
<!-- 	 										<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> -->
<!-- 	 										<span><i></i>반일</span> -->
<!-- 										</label> -->
<!-- 									</td> -->
								</tr>
								
								<tr><!-- 신청자도 관리자와 사원 기능 따로 만들기 -->
									<td><!-- <i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->신청자</td>
									<td colspan="5" style="padding-left:0.5em">
										<div class="input-group">	
											<input type="text" class="form-control" id="reqEmpEmno" name="reqEmpEmno" placeholder="사번" value="">
											<span class="input-group-addon" data-toggle="modal" data-target="#empEmnoModal" style="cursor:pointer" id="search" onclick="vacationReqEmpList()">
												<span class="glyphicon glyphicon-search" aria-hidden="true"></span> <!-- 검색 아이콘 -->
											</span>
										</div>
											<input type="text" class="form-control" id="empName" placeholder="이름" value="">
											<input type="text" class="form-control" id="deptName" placeholder="부서" value="">
											<input type="text" class="form-control" id="rankName" placeholder="직급" value="">
									</td>									
								</tr>
								
								
								<tr>
									<td>휴가기간</td>
									<td colspan="5" style="padding-left:0.5em">
										<!-- 달력 start-->
										<div class="input-group date" id="startDate">
									  		<input type="text" class="form-control" id="vastStartDate" name="vastStartDate"/>
										    <span class="input-group-addon">
											    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
										    </span>
										</div>
										~
										<!-- 달력 end-->
										<div class="input-group date" id="endDate">
									  		<input type="text" class="form-control" id="vastEndDate" name="vastEndDate"/>
										    <span class="input-group-addon">
											    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
										    </span>
									  </div>
										(일수: <input type="text" class="form-control" id="vastVacUd" name="vastVacUd" readonly>)
									</td>

								</tr>
								<tr>
									<td>휴가사유</td>
									<td colspan="7" style="padding-left:0.5em"><input type="text" class="form-control" name="vastCont" id="vastCont"></td>
								</tr>
							</table>
							<div class="text-right">
								<button type="button" class="btn btn-primary" id="submitGo" onclick="check_onclick('${pageContext.request.contextPath}/vacationRequest.exc', 'vacReqFrm')">신청하기</button>
<!-- 									<button type="button" class="btn btn-primary" onclick="check_onclick()">신청하기</button> -->
							</div>
						</form>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-body">
						<p> ※ 경조사 발생 시 관련 증빙 제출(사망진단서, 청첩장, 출생증명서) </p>
						<p> ※ 반차일 경우 휴가 시작날짜와 종료날짜가 같아야 합니다. </p>
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
		<!-- END MAIN CONTENT -->
		</div>
	</div>
	<!-- END MAIN -->
</body>
</html>