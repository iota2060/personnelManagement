<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가일수설정 - 사원등록</title>
<link rel="stylesheet" href="/spring/resources/common/css/vacation.css" />
<style>
.table > tbody > tr > td { 
	vertical-align: middle;
}
</style>
<script type="text/javascript">

var formId = "vacCntSelectFrm"; //초기, 검색할 때 id를 기본값으로 세팅

//document.ready
$(function(){
	calendar(); //년도달력
	vacationCountEmpSignUpList(); //사원정보 리스트 ajax
});

//검색
function vacCntEmpListSearch(){
	vacationCountEmpSignUpList(); //사원정보 리스트 ajax
}

//사원정보 리스트 ajax
function vacationCountEmpSignUpList(){
	paging.ajaxFormSubmit("vacationCountEmpSignUpList.exc", formId, function(rslt){
		console.log("ajaxFormSubmit -> callback");
		console.log("결과데이터:"+JSON.stringify(rslt));

 		$('#vacCntEmpListTbody').empty(); //이전 리스트 삭제
		$('#vacCntEmpListTable').children('thead').css('width','calc(100% - 1.1em)'); //테이블 스크롤 css

		if(rslt.vacationCountEmpSignUpList == null || rslt.success == "N"){
			$('#vacCntEmpListTbody').append( //리스트가 없을 경우 : 조회된 데이터가 없습니다
 				"<div class='text-center'><br><br><br><br>조회할 데이터가 없습니다.</div>"
 			);
		}else if(rslt.success == "Y"){
 			$.each(rslt.vacationCountEmpSignUpList, function(k, v) {
 				if(v.YN == "완료"){
 					$('#vacCntEmpListTbody').append(
 		 					"<tr style='display:table;width:100%;table-layout:fixed;'>"+
 								"<td></td>"+
 								"<td>"+ v.empEmno +"</td>"+ //사원번호
 								"<td>"+ v.empName +"</td>"+ //사원명
 								"<td>"+ v.deptName +"</td>"+ //부서명
 								"<td>"+ v.rankName +"</td>"+ //직급명
 								"<td>"+ v.retrIncoDate +"</td>"+ //입사일자
 								"<td>"+ v.YN +"</td>"+ //이관여부
 							"</tr>"
 						);
 				}else{				
 					$('#vacCntEmpListTbody').append(
 					"<tr style='display:table;width:100%;table-layout:fixed;'>"+
						"<td>"+
							"<label class='fancy-checkbox-inline'>"+
								"<input type='checkbox' id='emnoChk'>"+ //checkbox
								"<span></span>"+
							"</label>"+
						"</td>"+
						"<td>"+ v.empEmno +"</td>"+ //사원번호
						"<td>"+ v.empName +"</td>"+ //사원명
						"<td>"+ v.deptName +"</td>"+ //부서명
						"<td>"+ v.rankName +"</td>"+ //직급명
						"<td>"+ v.retrIncoDate +"</td>"+ //입사일자
						"<td>"+ v.YN +"</td>"+ //이관여부
					"</tr>"
					);
 				}
 			});
 			
 			if($('#baseYear').val() != moment().format('YYYY')){ //선택한 년도가 올해가 아니면
 				$("input[type=checkbox]").prop('disabled',true); //체크박스 선택불가
 				$('#vacCntSaveBtn').prop('disabled',true); //저장버튼 선택불가
 			}else{
 				$("input[type=checkbox]").prop('disabled',false);
 				$('#vacCntSaveBtn').prop('disabled',false);
 			}

 			$('.table tr').children().addClass('text-center'); //테이블 내용 가운데정렬
 			
			//테이블 정렬
			$(function(){
				$("#vacCntEmpListTable").tablesorter();
			});
			$(function(){ 
				$("#vacCntEmpListTable").tablesorter({sortList: [[0,0], [1,0]]});
			});
		}
	});
}

//저장하기를 클릭했을 때
function vacCntSave(){
	
	var empEmnoResult; //체크된 사원번호를 저장할 변수(ex. 사원번호/사원번호/사원번호)
	
	$("input[type=checkbox][id=emnoChk]").each(function(){
		if($(this).prop('checked')){

			var chkTr = $(this).closest('tr'); //체크한 체크박스와 가장 가까운 tr
			var chkTdText = chkTr.children().eq(1).text(); //체크한 체크박스의 2번째 td의 내용(사원번호)
		
			if(empEmnoResult == null){
				empEmnoResult = chkTdText;
			}else{
				empEmnoResult = empEmnoResult + "/" + chkTdText; //사원번호를 구분자와 함께 저장
			}
		}
	});
	$('#empEmnoResult').val(empEmnoResult); //input hidden에 value로 입력
// 	console.log($('#empEmnoResult').val());
	
	paging.ajaxFormSubmit("vacCntEmpSignUpInsert.exc", "vacCntEmpFrm", function(rslt){
		console.log("ajaxFormSubmit -> callback");
		console.log("결과데이터:"+JSON.stringify(rslt));
		
		if(rslt == null){
			alert("저장에 실패하였습니다. 다시 시도해주세요.")
		}else{
			alert("저장이 완료되었습니다.");
			window.location.reload();
		}
	});

};

// 체크박스 전체선택 
function checkAllFunc(){ //최상단 체크박스를 click하면
	if($('#retrChkAll').is(":checked")){
		$("input[type=checkbox][id=emnoChk]").prop('checked', true);
	}else{
		$("input[type=checkbox][id=emnoChk]").prop('checked', false);
	}
}

//년도 달력
function calendar(){
	$('#baseYear').val(moment().format('YYYY'));	//올해 년도 보여줌
	$('#yearDateTimePicker').datetimepicker({
		viewMode: 'years',
		format: 'YYYY'
	});
	
	//년도의 최대값을 올해로 제한
	$('#yearDateTimePicker').data("DateTimePicker").maxDate(moment());
};
</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">사원등록</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" id="vacCntSelectFrm">
							기준년도
							<div class="input-group date" id="yearDateTimePicker"><!-- 달력 -->
						  	<input type="text" class="form-control" id="baseYear" name="baseYear"/>
						    <span class="input-group-addon">
							    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
						    </span>
						  </div>&nbsp;&nbsp;&nbsp;
							검색어
							<select name="searchOption" class="form-control">
								<option value="empEmno">사번</option>
								<option value="empName">성명</option>
								<option value="deptName">부서</option>
							</select>
							<input type="text" class="form-control" name="keyword">&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn btn-primary" id="searchBtn" style="float:right;" onclick="vacationCountEmpSignUpList()" value="검색">
						</form>
					</div>
				</div>
				
				<div class="panel panel-headline">
					<div class="panel-body"> 
						<div class="list_wrapper">
							<form class="form-inline" id="vacCntEmpFrm">
								<table class="table" id="vacCntEmpListTable">
									<thead style="display:table;width:100%;table-layout:fixed;">
										<tr>
											<th class="sorter-false">
												<label class="fancy-checkbox-inline">
													<input type="checkbox" id="retrChkAll" onclick="checkAllFunc()">
													<span></span>
												</label>
												<input type="hidden" name="empEmnoResult" id="empEmnoResult">
											</th>
											<th>사원번호</th>
											<th>성명</th>
											<th>부서</th>
											<th>직위</th>
											<th>입사일</th>
											<th>이관여부</th>
										</tr>
									</thead>
									<tbody id="vacCntEmpListTbody" style="display:block;height:400px;overflow:auto;">
									</tbody>
								</table>
							</form>
						</div><!-- END list table 영역 -->						
						<div class="text-center"><br><!-- 버튼영역 -->
							<button type="button" class="btn btn-primary" id="vacCntSaveBtn" onclick="vacCntSave()">저장하기</button>
						</div><!-- END 버튼영역 -->
					</div>
				</div>
			</div>
		</div><!-- END MAIN CONTENT -->
	</div><!-- END MAIN -->
</body>
</html>