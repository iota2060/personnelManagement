<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="./script/hrapntRegLink.jsp" %>
<%@include file="./script/hrapntRegjs.jsp" %>
<%@include file="./script/hrapntRegViewjs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사발령등록</title>





</head>
<body>
	<!-- MAIN -->
	<!-- <div class="main"> -->
		<!-- MAIN CONTENT -->
				<h3 class="page-title">
					<a href="javascript:popup_close()">
						<div>
							<span>인사발령</span><span>X</span>
						</div>
					</a>
				</h3>
					<div>
						<div>
							<div><span>발령대상자</span> <span id="empTotal"></span></div>
							<br>
							<div>
								<form id="hrApntRegFrm" method="post">
								<table border="1">
									<thead>
										
									</thead>
									<tbody>
										<tr>
											<td>발령구분</td>
											<td>
												<select name="hrApntSel" id="hrApntSel">
													<option value="1">승진</option>
													<option value="2">부서이동</option>
													<option value="3">휴직</option>
													<option value="4">복직</option>
													<option value="5">퇴직</option>
													<option value="6">채용</option>
												</select>
											</td>
											<td colspan="4">${totalListEmp }</td>
										</tr>
										<tr>
											<!-- dataName1 -->
											<td id="dataName1">발령일자</td>
												<td>
													<!-- 승진 : 달력1  -->
													<div id="cntnData1Out1">
													<div class="input-group date" id="hrApntDate3">
														<input type="text" class="form-control" name="cntnData1" id="cntnData1"/>
															<span class="input-group-addon">
																<span class="fa fa-calendar" />
															</span>
													</div>
													<!-- 승진 : 달력  end -->
												</td>
											<!-- dataName1 end -->
											
											<!-- dataName2 -->
											<td id="dataName2"></td>
											<td>
												<!-- 승진 : 선택 직급 -->
												<div id="cntnData2Out2">
													<input type="hidden" id="cntnData2" name="cntnData2"/>
													<!-- 승진 : 직급선택 --><!-- 채용 : 직급선택  -->
													<select id="cntnData21">
														<option value="1">회장</option>
														<option value="2">사원</option>
														<option value="3">사장</option>
														<option value="4">전무</option>
														<option value="5">이사</option>
														<option value="6">상무</option>
														<option value="7">부장</option>
														<option value="8">차장</option>
														<option value="9">과장</option>
														<option value="10">대리</option>
													</select>
													<!-- 승진 : 직급선택  end --><!-- 채용 : 직급선택 end  -->
													
													<!-- 승진 : 부서이동 -->
													<select id="cntnData22">
														<option value="1">인사부</option>
														<option value="2">영업부</option>
														<option value="3">관리부</option>
														<option value="4">급여부</option>
														<option value="5">근태부</option>
													</select>
													<!-- 승진 : 부서이동 end -->
													
													<!-- 휴직 : 달력  --><!-- 복직 : 달력 --><!-- 퇴직 : 달력1  -->
													<div class="input-group date" id="hrApntDate4">
														<input type="text" class="form-control" id="cntnData23" />
															<span class="input-group-addon">
																<span class="fa fa-calendar" />
															</span>
													</div>
												<!-- 휴직 : 달력 end  --><!-- 복직 : 달력 end  --><!-- 퇴직 : 달력 end  -->		
												</div>
											</td>
											<!-- dataName2 end -->
											<td colspan="2"></td>
										</tr>
										<tr>
											<td>비고</td>
											<td colspan="3"><input type="text" name="rmrk"></td>
											<td></td>
											<td><input type="button" value="발령처리" id="hrApntSubmit" ></td>
										</tr>
									</tbody>
								</table>
								</form>
							</div>
							<p>
							<div>
								<span>
									<!-- 검색 : 선택 -->
									<select name="searchCnd">
										<option value="all">전체</option>
										<option value="empName">사원명</option>
										<option value="rankName">직급</option>
										<option value="deptName">부서명</option>
									</select>
									<!-- 검색 : 선택 end -->
								</span>
								<span>
									<input type="text" name="searchWd"/>
								</span>
								<span>
									<input type="button" name="searchBtnReg" value="검색"/>
								</span>
							</div>
							<p>
							<div>
								<table name="empTable" id="empTable" class="table table-hover text-center">
									<thead>
										<tr>
											<td><input type="checkbox" id="ckListAll"></td>
											<td>사원번호</td>
											<td>성명</td>
											<td>직급</td>
											<td>부서</td>
										</tr>
									</thead>
									<tbody id="ListEmp">
									</tbody>
								</table>
								<!-- 페이징 네비게이션 시작 -->
								<nav name="pagingNavReg" aria-label='Page navigation example' align='center'>
								</nav>
								<!-- 페이징 네비게이션 끝 -->
							</div>
							<hr>
							<div>
								팝업창이 차단되어 있으면 발령처리를 할 수 없습니다. 발령처리 전 팝업창 차단을 해제하시기 바랍니다.
							  퇴직처리는 인사메뉴 상의 퇴직처리입니다. bizmeka EZ 시스템 상의 사용자 해지(강제 탈퇴 처리)는 업무포털>환경설정>사용자/부서관리>[사용자조직도관리] 메뉴에서 사용자 이름을 클릭하여 <사용자해지> 처리하시기 바랍니다.
							  발령 대상자 목록에서 조회되지 않을 경우 인사정보등록의 필수항목이 정확히 입력되었는지 확인하시기 바랍니다. 
							</div>
						</div>
					</div>
			
	<!-- </div> -->
	<!-- END MAIN -->
</body>
</html>

