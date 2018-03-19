<!-- 
	근태/출장/연차마감관리(월마감)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>근태/출장/연차마감관리</title>
<script>

	$(function() { 
		calender();
		$('.table tr').children().addClass('text-center'); //테이블 내용 가운데정렬
	});
	
	//달력
	function calender() {
// 		$('#baseYear').val(moment().format('YYYY-MM'));
		$('#baseYear').val('2017-12');
    $('#monthDate').datetimepicker({
    	viewMode: 'months',
    	format: 'YYYY-MM'
    });
	};
	
	//체크박스 전체선택
	function checkAllFunc(){ //최상단 체크박스를 click하면
		if($('#chkAll').is(":checked")){
			$("input[type=checkbox][id=chk]").prop('checked', true);
		}else{
			$("input[type=checkbox][id=chk]").prop('checked', false);
		}
	}
	
</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">근태/출장/연차마감관리</h3>
				<div class="panel panel-headline">
					<div class="panel-body">
						<form class="form-inline">
							마감일자
							<!-- 달력 -->
							<div class="input-group date" id="monthDate">
						  	<input type="text" class="form-control" id="baseYear"/>
						    <span class="input-group-addon">
							    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
						    </span>
						  </div>
						  <input type="button" class="btn btn-primary" value="검색" style="float:right;">
						</form>
					</div>
				</div>
				
				<div class="panel panel-headline">
					<div class="panel-body">
						<input type="button" class="btn btn-primary" value="행삭제" style="float:right;">
						<div class="list_wrapper">
							<table class="table">
								<thead>
									<tr>
										<th>			
											<label class="fancy-checkbox-inline">
												<input type="checkbox" id="chkAll" onclick="checkAllFunc()">
												<span></span>
											</label>
										</th>
										<th>마감일자</th>
										<th>마감대상</th>
										<th>진행상태</th>
									</tr>
								</thead>
								<tbody id="tbody">
									<tr>
										<td>
											<label class="fancy-checkbox-inline">
												<input type="checkbox" id="chk">
												<span></span>
											</label>
										</td>
										<td>2017.12</td>
										<td>근태</td>
										<td>마감</td>
									</tr>
									<tr>
										<td>
											<label class="fancy-checkbox-inline">
												<input type="checkbox" id="chk">
												<span></span>
											</label>
										</td>
										<td>2017.12</td>
										<td>출장</td>
										<td>마감</td>
									</tr>
									<tr data-toggle='modal' data-target='#myModal'>
										<td>
											<label class="fancy-checkbox-inline">
												<input type="checkbox" id="chk">
												<span></span>
											</label>
										</td>
										<td>2017.12</td>
										<td>연차</td>
										<td>마감</td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- 버튼영역 -->
						<div class="text-right"> 
							<button type="button" class="btn btn-primary">저장</button>
						</div>
						<!-- END 버튼영역 -->
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-lg">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <p class="modal-title">마감 내용 상세보기</p>
	      </div>
	      <div class="modal-body">
	        <h4 class="page-title" align="center">[2017.12] 연차 마감</h4> <!-- 클릭한 사원에 따라 바뀌게 -->
	        <div class="list_wrapper">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>구분</th>
									<th>사원번호</th>
									<th>성명</th>
									<th>부서</th>
									<th>직위</th>
									<th>전체일수</th>
									<th>사용일수</th>
									<th>잔여일수</th>
									<th>기타</th>
								</tr>
							</thead>
							<tbody id="tbody">

							</tbody>
						</table>
					</div>
	      </div>
	      <div class="modal-footer">
<!-- 	        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button> -->
	      </div>
	    </div>
	
	  </div>
	</div>
</body>
</html>