<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>증명서발급대장</title>
<style>
/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 100px;
  height: 34px;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(65px);
  -ms-transform: translateX(65px);
  transform: translateX(65px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>
</head>
<body>
	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">증명서발급대장</h3><br>
				<!-- OVERVIEW -->
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<form id="formId">
									<input type="hidden" id="empEmno" value="<%=session.getAttribute("userEmno")%>">
								<div class="form-group col-md-3">
										<label for="selectBox1" class="col-form-label col-sm-4">증명서구분</label>
										<div class="col-sm-8">
											<select name="crtfSelect" class="form-control" id="selectBox1">
												<option value="전체">전체</option>
												<option value="재직증명서">재직증명서</option>
												<option value="경력증명서">경력증명서</option>
												<option value="퇴직증명서">퇴직증명서</option>
											</select>
										</div>
								</div>
								<div class="form-group col-md-5">
									<label for="" class="col-form-label col-sm-3">신청일자</label>
									<div class="col-sm-4">
										<input type="text" name="startDate" class="form-control" placeholder="날짜선택">
									</div>	
										<span class="col-sm-1 text-center">~</span>
									<div class="col-sm-4">	
										<input type="text" name="endDate" class="form-control" placeholder="날짜선택">
									</div>
								</div>
								<div class="form-group col-md-3">
									<label for="" class="col-form-label col-sm-5">결제상태</label>
									<div class="col-sm-7">
										<select name="progressSituation" class="form-control">
										<option value="전체">전체</option>
										<option value="승인대기">승인대기</option>
										<option value="승인완료">승인완료</option>
									</select>
									</div>
								</div>
									<input type="button" value="검색" onclick="search()" class="btn btn-primary">
									<input type="hidden" value="" name="choicePage">
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 증명서 신청 내역 -->
				<div class="row">
					<div class="col-md-12">
						<div class="panel">
							<div class="panel-heading">
								<h4 class="panel-title" style="font-size:20px; padding-left:15px;">증명서 신청내역</h4>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="panel-body">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>발행번호</th>
													<th>사원번호</th>
													<th>성명</th>
													<th>증명서종류</th>
													<th>신청일자</th>
													<th>발행일자</th>
													<th>결제상태</th>
												</tr>
											</thead>
											<tbody id="tbodyId">
											</tbody>
										</table>
										<nav name="pagingNav" aria-label="Paging navigation example" align="center"></nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- View Modal -->
				<div id="viewModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  					<div class="modal-dialog">
    					<div class="modal-content">
     						<div class="modal-header">
								<h4 class="modal-title">증명서 상세보기</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-10" style="padding-top:20px;">
										<form id="viewForm">
											<input type="hidden" name="crtfSeq" value="">
										<table class="table table-hover">
											<tbody>
												<tr>
													<th>증명서구분</th>
													<td>
														<select name="crtfSelect" class="form-control" style="width:120px" disabled="disabled">
															<option value="증명서종류">증명서종류</option>
															<option value="재직증명서">재직증명서</option>
															<option value="경력증명서">경력증명서</option>
															<option value="퇴직증명서">퇴직증명서</option>
														</select>
													</td>
												</tr>
												<tr>
													<th>사원번호</th>
													<td><input type="text" class="form-control" name="empEmno" value="" style="width:120px" readonly></td>
												</tr>
												<tr>
													<th>성명</th>
													<td><input type="text" class="form-control" name="empName" value="" style="width:120px" readonly></td>
												</tr>
												<tr>
													<th>부서명</th>
													<td><input type="text" class="form-control" name="deptName" value="" style="width:120px" readonly></td>
												</tr>
												<tr>
													<th>직위/직급</th>
													<td><input type="text" class="form-control" name="rankName" value="" style="width:120px" readonly></td>
												</tr>
												<tr>
													<th>용도</th>
													<td><input type="text" class="form-control" name="use" value="" readonly></td>
												</tr>
												<tr>
													<th>신청일자</th>
													<td><input type="text" class="form-control" name="requestDate" style="width:120px" readonly></td>
												</tr>
												<tr>
													<th>발행일자</th>
													<td><input type="text" class="form-control" name="issueDate" style="width:120px" readonly></td>
												</tr>
												<tr>
													<th>결제상태</th>
													<td>
														<button type="button" class="btn" data-toggle="button" id="toggleBtn" data-complete-text="승인완료">승인대기</button>
													</td>
												</tr>
											</tbody>
										</form>
									</table>
										<div class="modal-footer">
											<button type="button" id="viewBtn" class="btn btn-default">미리보기</button>
											<button type="button" id="deleteBtn" class="btn btn-default">삭제</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>	
    					</div>
  					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>