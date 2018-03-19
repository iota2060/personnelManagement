<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사발령등록</title>



</head>
<body>

		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					
					<!-- modal_content -->
					<div id="modal_hrapntReg">
						<!--  팝업내용<input type="button" value="닫기" id="m_close"> -->
					</div>
					<div id="dialog-background"></div>
					<!-- modal_content -->
					
					<h3 class="page-title">인사발령등록</h3><br>
					<!-- OVERVIEW -->
					<div class="row">
						<div class="col-md-10">
							<div class="panel panel-headline">
								<div class="panel-heading">
									<form id="hrApntViewFrm">
										<div>
											<div>
												<span>세부검색
													<!-- 검색 : 선택 -->
													<select name="searchCnd" id="searchCnd">
														<option value="all">전체</option>
														<option value="empName">사원명</option>
														<option value="rankName">직급</option>
														<option value="deptName">부서명</option>
													</select>
												</span>
												<span>
													<input type="text" name="searchWd" id="searchWd"/>
												</span>
												<span>발령구분 
													<select name="apntTypeNm" id="apntTypeNm">
														<option value="all">전체</option>
														<option value="1">승진</option>
														<option value="2">부서이동</option>
														<option value="3">휴직</option>
														<option value="4">복직</option>
														<option value="5">퇴직</option>
														<option value="6">채용</option>
													</select> 
												</span>
											</div>
											<div>
												<span>발령일자</span>
												<span style="width:20%;display:inline-block;">
													<!-- 달력 : 발령일자1 -->
													<div class="input-group date" id="hrApntDate1">
														<input type="text" class="form-control" name="hrApntDate1" id="hrApntDate11"/>
															<span class="input-group-addon">
																<span class="fa fa-calendar" />
															</span>
													</div>
												</span>
												<span> - </span>
												<span style="width:20%;display:inline-block;">
													<!-- 달력 : 발령일자2 -->
													<div class="input-group date" id="hrApntDate2">
														<input type="text" class="form-control" name="hrApntDate2" id="hrApntDate12"/>
															<span class="input-group-addon">
																<span class="fa fa-calendar" />
															</span>
													</div>
												</span>
											</div>
											<div>
												<span>
													<span>
														<input type="button" name="searchViewBtn" value="검색"/>
													</span>
												</span>
												<!-- 검색 : 선택 end -->
											</div>
											<div>
												<div>
													<span>인사발령조회 <span id="HrapntTotal"> </span> </span>
													<span> 
														<input type="button" value="발령취소">
														<input type="button" id="hrapntOpen" value="발령등록">
													</span>
												</div>
												<p>
												<div>
													<table border="1">
														<thead>
															<tr>
																<td>NO</td>
																<td>발령구분</td>
																<td>발령일자</td>
																<td>사원번호</td>
																<td>성명</td>
																<td>발령내용</td>
																<td>비고</td>
															</tr>
														</thead>
														<tbody id="ListHrapnt">
														</tbody>
													</table>
													<!-- 페이징 네비게이션 시작 -->
													<!-- <nav name="pagingNavView" aria-label='Page navigation example' align='center'>
													</nav> -->
													<!-- 페이징 네비게이션 끝 -->
												</div>
											</div>
											<p>
											<div> - 성명을 클릭하면 인사상세정보창이 뜹니다</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>


