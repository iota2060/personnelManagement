<!-- 
	휴가신청 현황 리스트 - 유성실,신지연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가신청현황</title>
<link rel="stylesheet" href="/spring/resources/common/css/vacation.css" />
<link rel="stylesheet" href="/spring/resources/common/css/bootstrap2-toggle.min.css" />
<script src="/spring/resources/common/js/bootstrap2-toggle.min.js"></script>
<script type="text/javascript">

/* ajax - list */
  
$(document).ready(function () {
	//table sorter 기능 추가
	var $table = $("#progListTable").tablesorter({sortList: [[0,0], [1,0]]});
		$tbody = $table.children("#progressList");	//tbody 아이디
			
		paging.ajaxFormSubmit("vacationProgressList.ajax", "progressList", function(rslt){
			console.log("ajaxFormSubmit -> callback");
			console.log("결과데이터" + JSON.stringify(rslt));
			
			if(rslt != null){
				$.each(rslt.vacationProgressList, function(index, s){
					$("#progressList").append(
						"<tr>" +
							"<td>" +
								"<label class='fancy-checkbox-inline'>" +
									"<input type='checkbox' name='chk' id='chk'>" +
									"<span></span>" +
								"</label>" +
								"<input type='hidden' id='vastSerialNumber' name='vastSerialNumber' value='" + s.vastSerialNumber+ "'>"+
							"</td>" +
							"<td>" + s.empEmno + "</td>" +
							"<td>" + s.empName + "</td>" +
							"<td>" + s.deptName + "</td>" +
							"<td>" + s.rankName + "</td>" +
							"<td>" + s.vastCrtDate + "</td>" +
							"<td>" + s.vastType + "</td>" +
							"<td>" + s.vastStartDate + "</td>" +
							"<td>" + s.vastEndDate + "</td>" +
							"<td>" + s.vastVacUd + "</td>" +
							"<td>" + s.vastCont + "</td>" +
							"<td><input type='checkbox' data-toggle='toggle' name='progToggle' id='progToggle' data-on='완료' data-off='대기' data-onstyle='primary' data-width='75' data-height='30'>"+
						"</tr>"
					);//append		
					
					/* DB에 저장되어있는 '승인완료'를 토글로 나타내기 */
					$("input[type='checkbox'][name=progToggle]").bootstrapToggle();
						var progTr = s.vastProgressSituation;
						if(progTr == "승인완료"){
							var progTd = $("#progressList tr:last").children().eq(11);							
							progTd.children().children("#progToggle").prop('checked', true).change();
						} else {
						}//if
				});	//each.vacationProgressList
				
				//table sorter
				var resort = true,
					callback = function(){
						console.log('table updated');
					};
			}//if-table 생성
			$table.trigger("update",[resort, callback]);	//table sorter
		});
});	//ajax로 리스트 불러오기


//테이블 내용 가운데정렬
$('#progListTable').ready(function() { 
    $('.table tr').children().addClass('text-center');
});



/* 체크박스 전체선택 */
function checkAllFunc(obj){ //최상단 체크박스를 click하면
	$("input[type='checkbox'][name=chk]").each(function() {
		this.checked = obj.checked;  //name이 chk인 체크박스를 checked로 변경
	})
} 



	
/* 체크박스 승인완료 버튼 */
function toggleOn(){
	var chk = $("[name=chk]").length; //체크박스 갯수

	$("[name=chk]").each(function() {
		console.log(chk);
		var progTr = $(this).closest('tr'); //체크박스와 가까운 위치의 tr
		var progTd = progTr.children().eq(11); //tr 자식인 7번째 인덱스의 td(토글키 있는 위치의 td)

// 		if(progTd.children().children("#progToggle").is(':checked') == true){
// 			console.log('1');
// 		}
		if($(this).prop('checked')){
			progTd.children().children("#progToggle").prop('checked', true).change();
		}else{
			
		}//if
	});	//name-each
	
}//toggleOn




/* 승인완료 후 저장하기  */
function vacProgSave(){
	
	var progToggleResult;	//체크된 것 저장할 변수
	$("input[type=checkbox][id=progToggle]").each(function(){
		if($(this).prop('checked')){
			
			var chkTr = $(this).closest('tr');	//체크한 것과 가장 가까운 tr
			var chkHi = chkTr.children().children("input[type=hidden][id=vastSerialNumber]").val();//체크한 것의 히든 value 값
			
			if(progToggleResult == null){
				progToggleResult = chkHi;
			} else{
				progToggleResult = progToggleResult +"/"+chkHi;	//히든 value 값을 구분자와 저장
				console.log("저장::"+progToggleResult);
			}
		}//if
	});//input.each
	$('#progToggleResult').val(progToggleResult);
		console.log("저장후::"+$('#progToggleResult').val());
	
	paging.ajaxFormSubmit("vacationProgSave.ajax", "f2", function(rslt){
		console.log("ajaxFormSubmit -> callback");
		console.log("결과데이터" + JSON.stringify(rslt));
		
		if(rslt == null){
			alert("저장에 실패하였습니다. 다시 시도해주세요.")
		} else{
			alert("저장되었습니다.")
			window.location.reload();	//새로고침
		}
	});	//paging.ajax
	
}//vacProgSave


/* 달력 */
$(function () {
	$('#startDate').datetimepicker({ //휴가시작일 달력
		viewMode: 'days',
		format: 'YYYY-MM-DD'
	});
  
	$('#endDate').datetimepicker({ //휴가종료일 달력
		viewMode: 'days',
		format: 'YYYY-MM-DD'
	});
	
	//휴가종료날짜가 시작날짜 이전인 날짜는 선택 불가능하도록 제한
	$('#startDate').on("dp.change", function(e) {
		$('#endDate').data("DateTimePicker").minDate(e.date);
	});
});	

/* 날짜 출력 */
function test(){
	alert($('#baseYear').val());
}


</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">휴가신청현황</h3>
				<div class="panel panel-headline">
<!-- 					<div class="panel-heading"> -->
<!-- 						<h3 class="panel-title">휴가항목 선택</h3> -->
<!-- 							<p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
<!-- 					</div> -->
					<div class="panel-body">
						<form class="form-inline" name="f1" id="f1">
<!-- 							<i class="fa fa-asterisk-red" aria-hidden="true" ></i>							 -->
							신청일자
							<!-- 달력 -->
							<div class="input-group date" id="startDate">
								<input type="text" class="form-control" id="vastStartDate"/>
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
								</span>
							</div>
							~
							<!-- 달력 -->
							<div class="input-group date" id="endDate">
						  	<input type="text" class="form-control" id="vastEndDate"/>
						    <span class="input-group-addon">
							    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
						    </span>
						  </div>
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  
							사원번호
							<div class="input-group">	
								<input type="text" class="form-control" id="textarea">
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-search" aria-hidden="true" data-toggle="modal" data-target="#empEmnoModal"></span> <!-- 검색 아이콘 -->
								</span>
							</div>
							<input type="text" class="form-control">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							결재상태
							<select name="vacationCategories" class="form-control">
								<option value="allToggle">전체</option>
								<option value="progToggle">승인대기</option>
								<option value="compToggle">승인완료</option>
<!-- 								<option value="cat">반려</option> -->
							</select>

							<input type="button" class="btn btn-primary" style="float:right;" name="search" onclick="test()" value="검색">
						</form>
					</div>
				</div>


				<div class="panel panel-headline">
<!-- 					<div class="panel-heading"> -->
<!-- 						<h3 class="panel-title">제목</h3> -->
<!-- 					</div> -->
					<div class="panel-body"> 
						<div class="list_wrap">
							<form class="form-inline" name="f2" id="f2">
								<table class="table tablesorter table-bordered" id="progListTable" name="progListTable">
									<thead>
										<tr>
											<th>
												<label class="fancy-checkbox-inline">
													<input type="checkbox" onclick="checkAllFunc(this)">
													<span></span>
												</label>
												<input type="hidden" name="progToggleResult" id="progToggleResult" value="">
											</th>
											<th>사원번호</th>
											<th>이름</th>
											<th>부서</th>
											<th>직급</th>
											<th>신청일</th>
											<th>휴가구분</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>일수</th>
											<th>휴가사유</th>
											<th>결재상태</th>
										</tr>
									</thead>

									<tbody id="progressList">
									</tbody>
								</table>
							</form>
						</div>
						<!-- END list table 영역 -->
						    
						<!-- 버튼영역 -->
						<div class="text-center"> 
							<button type="button" class="btn btn-info" onclick="toggleOn()">승인완료</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" onclick="vacProgSave()">저장하기</button>
						</div>
						<!-- END 버튼영역 -->
					</div>
				</div>
			</div>
			

			<!-- 사원번호 Modal -->
			<div id="empEmnoModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			  
			  <!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<p class="modal-title">사번 정보 조회</p>
					</div>
					<div class="modal-body">
						<div class="search_wrap" style="padding: 0px 10px 20px 15px; ">
							<form class="form-inline">
								검색어&nbsp;<input type="text" class="form-control">&nbsp;&nbsp;&nbsp;
								<label class="fancy-checkbox-inline">
									<input type="checkbox" name="">
									<span>퇴직자 포함</span>
								</label>
								<input type="button" class="btn btn-primary" style="float:right;" name="search" onclick="empEmnoSearch()" value="검색">
							</form>
						</div>

						<div class="list_wrap">
							<table class="table tablesorter table-bordered">
								<tbody>
									<thead>
										<tr>
											<th></th>
											<th>사원번호</th>
											<th>성명</th>
											<th>부서</th>
											<th>직급</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<label class="fancy-checkbox-inline">
													<input type="checkbox" name="empEmnoChk">
													<span></span>
												</label>
											</td>
											<td>12345</td>
											<td>유성실</td>
											<td>개발팀</td>
											<td>사원</td>
										</tr>
										<tr>
											<td>
												<label class="fancy-checkbox-inline">
													<input type="checkbox" name="empEmnoChk">
													<span></span>
												</label>
											</td>
											<td>2345</td>
											<td>유성실</td>
											<td>개발팀</td>
											<td>사원</td>
										</tr>
										<tr>
											<td>
												<label class="fancy-checkbox-inline">
													<input type="checkbox" name="empEmnoChk">
													<span></span>
												</label>
											</td>
											<td>17895</td>
											<td>유성실</td>
											<td>개발팀</td>
											<td>사원</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="empEmnoClick()">선택</button>
						</div>
					</div>
				</div>
			</div>
			<!-- END MODAL -->
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	
	
</body>
</html>