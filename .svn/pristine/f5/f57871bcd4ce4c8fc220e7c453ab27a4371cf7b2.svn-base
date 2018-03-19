<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">공통코드 관리</h3>
					<!-- OVERVIEW -->
					<div class="row" id="searchPanel">
						<div class="col-md-10">
							<div class="panel panel-headline">
								<div class="panel-heading">
									<h4 class="panel-title" style="font-size:20px; padding-left:15px;">공통코드 조회</h4>
								</div>
								<div class="panel-body">
									<div class="col-md-2">
										<select name="commonSelect" class="form-control">
											<option value="default" selected>검색조건</option>
											<option value="commCode">코드</option>
											<option value="commName">코드명</option>
											<option value="commCodeInfo">코드정보</option>
											<option value="commRegMn">등록자</option>
										</select>
									</div>
									<div class="col-md-10">
										<div class="input-group">
											<input type="text" name="commonSearch" class="form-control">
											<span class="input-group-btn">
												<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-10">
						<!-- TABLE STRIPED -->
							<div class="panel" id="commList">
								<div class="panel-heading"></div>
								<div class="row">
									<div class="col-md-12 text-right" style="padding-right:60px">
										<button type="button" class="btn btn-default" data-toggle="modal" data-backdrop="static" data-target="#insertModal">등록</button>
										<button type="button" class="btn btn-default" onclick="location.href='/spring/commonList.do'">목록</button>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="panel-body">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>코드</th>
														<th>코드명</th>
														<th>코드정보</th>
														<th>등록자</th>
														<th>생성일</th>
														<th>수정일</th>
														<th>사용여부</th>
														<th>비고</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="l" items="${list}">
														<tr name="commCodeInfo" onclick="commInfoListFunc($(this))" data-toggle="modal" style="cursor:pointer">
															<td name="commCode">${l.commCode}</td>
															<td name="commName">${l.commName}</td>
															<td name="commCodeInfo">${l.commCodeInfo}</td>
															<td name="commRegMn">${l.commRegMn}</td>
															<td name="commCodeCrt">${l.commCodeCrt}</td>
															<td name="commCodeUpdt">${l.commCodeUpdt}</td>
															<td name="commDelYn">Y</td>
															<td name="commUpdt" onClick="event.cancelBubble = true">
																<button type="button" class="btn btn-default" name="updateBtn">수정</button>
																<button type="button" class="btn btn-default" name="deleteBtn">삭제</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<nav name="pagingNav" aria-label="Paging navigation example" align="center">
											</nav>
										</div>
									</div>
								</div>
							</div>
						<!-- END TABLE STRIPED -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		
		<!-- INSERT MODAL -->
		<div id="insertModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">공통코드 등록</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-11" style="padding-top:20px;">
								<form action="/spring/commonInsert.do" id="insertForm">
									<table class="table table-hover" align="center">
										<tr>
											<td> &nbsp;그룹코드명</td>
											<td><input type="text" name="commName"></td>
										</tr>
										<tr>
											<td> &nbsp;코드정보</td>
											<td><input type="text" name="commCodeInfo"></td>
										</tr>
										<tr>
											<td> &nbsp;등록자</td>
											<td><input type="text" name="commRegMn" value="manager"></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- UPDATE MODAL -->
		<div id="updateModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">공통코드 수정</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-11" style="padding-top:20px;">
								<form action="/spring/commonUpdate.do" id="updateForm">
									<table class="table table-hover" align="center">
										<tr>
											<td> &nbsp;그룹코드</td>
											<td><input type="text" name="commCode" readOnly></td>
										</tr>
										<tr>
											<td> &nbsp;그룹코드명</td>
											<td><input type="text" name="commName"></td>
										</tr>
										<tr>
											<td> &nbsp;코드정보</td>
											<td><input type="text" name="commCodeInfo"></td>
										</tr>
										<tr>
											<td> &nbsp;등록자</td>
											<td><input type="text" name="commRegMn"></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" name="submitBtn">저장</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- INFO MODAL -->
		<div id="infoModal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title">공통코드 상세보기</h3>
						<div id="commPrntCodeLine">
						
						</div>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-12" style="padding-top:20px;">
								<table class="table table-hover" style="padding-left:30px;">
									<thead>
										<tr>
											<th>그룹코드</th>
											<th>코드</th>
											<th>코드명</th>
											<th>코드정보</th>
											<th>등록자</th>
											<th>등록일</th>
											<th>수정일</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
									<!-- <form id="commonInfoForm"></form> -->
									</tbody>
								</table>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-target="#infoInsertModal" data-backdrop="static" data-toggle="modal">등록</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- INFO INSERT MODAL -->
		<div id="infoInsertModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">하위 공통코드 등록</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-11" style="padding-top:20px">
								<form action="/spring/commonInfoInsert.do" id="infoInsertForm">
									<table class="table table-hover" align="center">
										<tr>
											<td> &nbsp;코드명</td>
											<td><input type="text" name="commName"></td>
										</tr>
										<tr>
											<td> &nbsp;코드정보</td>
											<td><input type="text" name="commCodeInfo"></td>
										</tr>
										<tr>
											<td> &nbsp;등록자</td>
											<td><input type="text" name="commRegMn" value="manager"></td>
										</tr>
									</table>
								</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" id="infoInsertBtn" data-toggle="modal">등록</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- INFO UPDATE MODAL -->
		<div id="infoUpdateModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">하위 공통코드 수정</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-11" style="padding-top:20px;">
								<form action="/spring/commonUpdate.do" id="infoUpdateForm">
									<table class="table table-hover" align="center">
										<tr>
											<td> &nbsp;코드</td>
											<td><input type="text" name="commCode" readOnly></td>
										</tr>
										<tr>
											<td> &nbsp;코드명</td>
											<td><input type="text" name="commName"></td>
										</tr>
										<tr>
											<td> &nbsp;코드정보</td>
											<td><input type="text" name="commCodeInfo"></td>
										</tr>
										<tr>
											<td> &nbsp;등록자</td>
											<td><input type="text" name="commRegMn"></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" name="submitBtn">저장</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

</body>
</html>