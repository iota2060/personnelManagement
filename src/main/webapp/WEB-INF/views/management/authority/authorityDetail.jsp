<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/spring/resources/common/management/css/menuTree.css">
    <!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">권한관리</h3>
				<!-- 권한에 대한 사원 상세정보 table 시작 -->
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-headline">
							<div class="panel-heading" style="padding-bottom:0">
								<input type="hidden" name="empEmno" value="${data.empEmno}">
								<table class="empDetail">
									<tbody>
										<tr>
											<th>사원이름</th>
											<td>${data.empName}</td>
										</tr>
										<tr>
											<th>소속부서</th>
											<td>${data.deptName}</td>
										</tr>
										<tr>
											<th>등급</th>
											<td>
												<select id="classSelect" class="selectpicker">
													<option value="">선택</option>
													<option value="admin" ${data.empAdminYn eq'Y'?'selected':''}>관리자</option>
													<option value="user" ${data.empAdminYn eq'N'?'selected':''}>일반</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>접근허용IP</th>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="panel-body text-right" style="padding-top:0">
								<button type="button" name="classBtn" class="btn btn-info">등급적용</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 권한에 대한 사원 상세정보 table 끝 -->
				<!-- MENU TREE 시작-->
				<div class="row">
					<div class="col-md-4">
						<div class="panel">
							<div class="panel-heading" name="menuTree">
							<h3 class="panel-title">메뉴선택</h3>
                                <div class="tree">
                                	<ul id="tree">
                                    	<li id="0"><span>/</span></li>
                                     </ul>
                                </div>
                             </div>
						</div>
                   	</div>
                   	<!-- MENU TREE END -->
                   	<!-- START 권한 상세  -->
					<div class="col-md-8">
                    	<div class="panel" style="min-height:500px" name="detail">
							<div class="panel-heading">
								<h3 class="panel-title" style="font-size: 16px"></h3>
							</div>
							<div class="panel-body">

                           	</div>
                       	</div>
                  	</div>
                  	<!-- END 권한 상세  -->
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->