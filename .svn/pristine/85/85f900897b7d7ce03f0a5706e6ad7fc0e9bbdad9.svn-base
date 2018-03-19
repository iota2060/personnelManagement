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
				<h3 class="page-title">권한관리</h3>
				<!-- 사원 검색 시작 -->
				<div class="row">
					<div class="col-md-10">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h4 class="panel-title" style="font-size:20px; padding-left:15px;">사원 조회</h4>
							</div>
							<div class="panel-body">
								<div class="col-md-2">
									<select name="searchCnd" class="form-control">
										<option value="all">전체</option>
										<option value="deptName" <c:out value="${searchCnd eq 'deptCode' ? 'selected' : ''}"/>>부서명</option>
										<option value="empName" <c:out value="${searchCnd eq 'empName' ? 'selected' : ''}"/>>사원이름</option>
										<option value="rankName" <c:out value="${searchCnd eq 'rankName' ? 'selected' : ''}"/>>직책</option>
									</select>
								</div>
								<div class="input-group">
									<input type="text" name="searchWd" class="form-control" value="${searchWd}">
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary" name="searchBtn">검색</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 사원 검색 끝 -->
				<!-- 사원 리스트 시작 -->
				<div class="row">
					<div class="col-md-10">
						<div class="panel">
							<div class="panel-heading">
								<div class="row">
									<div class="panel-body">
										<table name="empTable" class="table table-hover text-center">
											<thead>
												<tr>
													<th class="text-center">부서명</th>
													<th class="text-center">직책</th>
													<th class="text-center">사원코드</th>
													<th class="text-center">사원명</th>
													<th class="text-center">생성일</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
										<!-- 페이징 네비게이션 시작 -->
										<nav name="pagingNav" aria-label='Page navigation example' align='center'>
										</nav>
										<!-- 페이징 네비게이션 끝 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 사원 리스트 끝-->
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	<!-- hidden form start-->
	<form action="authorityDetail.do" name="hiddenForm" method="post">
		<input type="hidden" name="empEmno">
	</form>
	<!-- hidden form end-->
</body>
</html>