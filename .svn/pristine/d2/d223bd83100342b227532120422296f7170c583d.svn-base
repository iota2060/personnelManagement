<!-- 
	출장신청 - 유성실,신지연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출장신청</title>
<script type="text/javascript">

 	//빈 칸 체크 경고창 & ajax
 	function check_onclick(url, formId){
 		if(empEmno.value == "" || empName.value == "" || deptName.value == "" ||
 			 rankName.value == ""|| btstBtArea.value == "" || btstBtPf.value == "" ||
 			 btstBtP.value == "" || btstCont.value == ""){
 			
 			alert("빈 칸을 입력해주십시오.");
 		} else{
 			paging.ajaxFormSubmit(url, formId, function(rslt){
 				console.log("ajaxFormSubmit -> callback");
 				console.log("결과데이터:"+JSON.stringify(rslt));
 			
 				//insert 성공여부에 따른 alert창 띄우기
				if(rslt.success == "Y"){
					alert("출장 신청이 완료되었습니다.");
				}else{
					alert("출장 신청 실패");
				}
 			});
 		}
 	}
 
	//달력
	$(function() {
		//오늘 날짜로 보여주기
		$('#btstCrtDate').val(moment().format('YYYY-MM-DD')); //출장신청일
		$('#btstBtStartDate').val(moment().format('YYYY-MM-DD')); //출장시작일
		$('#btstBtEndDate').val(moment().format('YYYY-MM-DD')); //출장종료일
		$('#busiNight').val('0'); //0박
		$('#busiDay').val('1'); //1일

		$('#crtCalender').datetimepicker({ //출장신청일 달력
			viewMode : 'days',
			format : 'YYYY-MM-DD'
		});

		$('#startCalender').datetimepicker({ //출장시작일 달력
			viewMode : 'days',
			format : 'YYYY-MM-DD'
		});

		$('#endCalender').datetimepicker({ //출장종료일 달력
			viewMode : 'days',
			format : 'YYYY-MM-DD'
		});

		//출장종료날짜가 시작날짜 이전인 날짜는 선택 불가능하도록 제한
		$('#startCalender').on("dp.change", function(e) {
			$('#endCalender').data("DateTimePicker").minDate(e.date);
		});

		//일수 자동 계산
		$('#endCalender').on("dp.change", function() { //종료날짜를 변경할 때마다
			var startDate = moment($('#btstBtStartDate').val(), "YYYYMMDD");
			var endDate = moment($('#btstBtEndDate').val(), "YYYYMMDD");

			//endDate-startDate를 'n박 n일'로 출력
			$('#busiNight').val(endDate.diff(startDate, "days"));
			$('#busiDay').val(endDate.diff(startDate, "days")+1);
		});

		$('#startCalender').on("dp.change", function() { //시작날짜를 변경할 때마다
			var startDate = moment($('#btstBtStartDate').val(), "YYYYMMDD");
			var endDate = moment($('#btstBtEndDate').val(), "YYYYMMDD");

			//endDate-startDate를 'n박 n일'로 출력
			$('#busiNight').val(endDate.diff(startDate, "days"));
			$('#busiDay').val(endDate.diff(startDate, "days")+1);
		});

//		$('#datetimepicker').datetimepicker('setDaysOfWeekDisabled', [0 , 6]); 
		//Number(data_value).toLocaleString('en').split(".")[0]
	});

 	/* 출장비 천단위마다 자동 콤마 start */
 	function inputPay(obj) { 
		obj.value = comma(uncomma(obj.value)); 
 	}

	function comma(str) { 
    str = String(str); 
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
	} 

	function uncomma(str) { 
    str = String(str); 
    return str.replace(/[^\d]+/g, ''); 
	}
 	/* 출장비 예상 금액 end */

 	
 	/* 사원선택 모달 start */
 	
 	function empListModal(url, formId){ //사원정보조회 리스트 출력
 		$('#empModalTbody').empty(); //이전 리스트 삭제
 		
 		//퇴직자 포함 체크여부
 		if(($('#retrChk').prop("checked")) == true ){
 			$('#retrDelYn').val('on');
 		}else{
 			$('#retrDelYn').val('off');
 		}
 		
 		if($('#word').val() == '재직'){
 			$('input[type=hidden][name=retrKeyword]').val('N');
 		}else if($('#word').val() == '퇴직'){
 			$('input[type=hidden][name=retrKeyword]').val('Y');
 		}else{
 			$('input[name=keyword]').val($('#word').val());
 		}
 		
		paging.ajaxFormSubmit(url, formId, function(rslt){
 			console.log("ajaxFormSubmit -> callback");
 			console.log("결과데이터:"+JSON.stringify(rslt));

 			$('#empModalTable').children('thead').css('width','calc(100% - 1em)'); //테이블 스크롤 css
 			
 			if(rslt == null){
 				$('#empModalTbody').append( //리스트가 없을 경우 : 조회된 데이터가 없습니다
 	 				"<div class='text-center'><br><br><br><br>조회할 데이터가 없습니다.</div>"
 	 			);
 			}else if(rslt.success == "Y"){
 	 			$.each(rslt.empList, function(k, v) {
					$('#empModalTbody').append(
 	 					"<tr style='display:table;width:100%;table-layout:fixed;'>"+
							"<td>"+
								"<label class='fancy-checkbox-inline'>"+
									"<input type='checkbox' name='emnoChk'>"+ //checkbox
									"<span></span>"+
								"</label>"+
							"</td>"+
							"<td>"+ v.retrDelYn +"</td>"+ //구분(재직,퇴직)
							"<td>"+ v.empEmno +"</td>"+ //사원번호
							"<td>"+ v.empName +"</td>"+ //사원명
							"<td>"+ v.deptName +"</td>"+ //부서명
							"<td>"+ v.rankName +"</td>"+ //직급명
						"</tr>"
					);
 	 			});
 			}

 	
		 	//사원선택 체크박스 선택 1개로 제한(라디오버튼처럼)
			$(function(){
				$("input[type='checkbox'][name='emnoChk']").click(function(){
					if($(this).prop("checked")){ //check 이벤트가 발생했는지
						//체크박스 전체를 checked 해제후 click한 요소만 true로 지정
						$("input[type='checkbox'][name='emnoChk']").prop("checked", false);
						$(this).prop("checked",true);
					}
				});
			});

			//테이블 정렬
			$(function(){
				$("#empModalTable").tablesorter();
			});
			
			$(function(){ 
				$("#empModalTable").tablesorter({sortList: [[0,0], [1,0]]});
			});
		 	
		});
 	}


 	//선택한 사원정보를 출장신청 폼에 자동 입력하기
 	function emnoClick(){
 		var chkTr = $("input[name=emnoChk]:checked").closest("tr"); //체크된 체크박스와 가장 가까운 tr
 		var empEmnoVal = chkTr.children().eq(2).text(); //tr 하부 3번째 td의 텍스트(사번)
 		var empNameVal = chkTr.children().eq(3).text(); //tr 하부 4번째 td의 텍스트(이름)
 		var deptNameVal = chkTr.children().eq(4).text(); //tr 하부 5번째 td의 텍스트(부서)
 		var rankNameVal = chkTr.children().eq(5).text(); //tr 하부 6번째 td의 텍스트(직급)

 		$('#empEmno').val(empEmnoVal);
 		$('#empName').val(empNameVal);
 		$('#deptName').val(deptNameVal);
 		$('#rankName').val(rankNameVal);
 		$(".modal-body input[name=keyword]").val(""); //키워드 내용 지우기
 		$('#word').val("");
 	}
 	
 	/* 사원선택 모달 end */
</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">출장신청</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" id="busiFrm" method="post">
							<input type="hidden" name="retrDelYn" value="off"> <!-- 사원 모달 리스트용 -->
							<table class="table table-bordered">
								<tr>
									<td>신청번호</td>
									<td><input type="text" class="form-control" readonly></td>
									<td><!-- <i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->신청일자</td>		
									<td>
									<!-- 사원 : 오늘 날짜 고정 -->
										<!-- <input type="text" class="form-control" id="tDate" readonly> -->
									<!-- 관리자 : 달력(날짜 변경 가능) -->	
										<div class="input-group date" id="crtCalender">
											<input type="text" class="form-control" id="btstCrtDate" name="btstCrtDate"/> <!-- 신청일자 -->
											<span class="input-group-addon">
										    	<span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
									    	</span>
										</div>
									</td>

									<td>전자결재상태</td>
									<td><input type="text" class="form-control" value="승인대기" readonly></td>
								</tr>
	
								<tr><!-- 신청자도 관리자와 사원 기능 따로 만들기 -->
									<td><!-- <i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->신청자</td>
									<td colspan="5">
										<div class="input-group">
												<input type="text" class="form-control" id="empEmno" name="empEmno" placeholder="사번"> <!-- 사원번호 -->
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-search" aria-hidden="true" data-toggle="modal" data-target="#emnoModal" onclick="empListModal('${pageContext.request.contextPath}/businessRequestEmpList.ajax','busiFrm')"></span> <!-- 검색 아이콘 -->
											</span>
										</div>
											<input type="text" class="form-control" id="empName" name="empName" placeholder="이름">
											<input type="text" class="form-control" id="deptName" name="deptName" placeholder="부서">
											<input type="text" class="form-control" id="rankName" name="rankName" placeholder="직급">
									</td>									
								</tr>
								
								<tr>
									<td><!-- <i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->출장기간</td>
									<td colspan="3">
										<!-- 출장기간 달력 start -->
										<div class="input-group date" id="startCalender">
											<input type="text" class="form-control" id="btstBtStartDate" name="btstBtStartDate"/> <!-- 출장시작일자 -->
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-calendar"></span><!-- 달력 아이콘 -->
											</span>
										</div>	
										~
										<!-- 출장기간 달력 end -->
										<div class="input-group date" id="endCalender">
											<input type="text" class="form-control" id="btstBtEndDate" name="btstBtEndDate"/> <!-- 출장종료일자 -->
											<span class="input-group-addon">
											    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
										    </span>
										</div>
										(<input type="text" class="form-control" id="busiNight" readonly>박<input type="text" class="form-control" id="busiDay" readonly>일)
										<label class="fancy-checkbox-inline">
											<input type="checkbox" class="" id="">
											<span>주말포함여부</span>
										</label>
									</td>
									
									<td><!-- <i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->출장지역</td>
									<td><input type="text" class="form-control" id="btstBtArea" name="btstBtArea"></td> <!-- 출장지역 -->
								</tr>
								<tr>
									<td><!-- <i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->출장비</td>
									<td colspan="5"><input type="text" class="form-control" id="btstBtPf" name="btstBtPf" placeholder="예상금액" value="" onkeyup="inputPay(this)"></td> <!-- 출장비예상 -->
								</tr>
								<tr>
									<td><!-- <i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->출장목적</td>
									<td colspan="5"><input type="text" class="form-control" id="btstBtP" name="btstBtP" placeholder="장소" align="left"></td>
								</tr>
								<tr>
									<td><!-- <i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->신청내용</td>
									<td colspan="5"><input type="text" class="form-control" id="btstCont" name="btstCont"></td>
								</tr>
							</table>
							<div class="text-right">
								<button type="button" class="btn btn-primary" onclick="check_onclick('${pageContext.request.contextPath}/businessRequestInsert.ajax', 'busiFrm')">신청하기</button>
							</div>
						</form>
	

						<!-- 사원번호 Modal -->
						<div id="emnoModal" class="modal fade" role="dialog">
						  <div class="modal-dialog">
						  
						  <!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<p class="modal-title">사번 정보 조회</p>
								</div>
								<div class="modal-body">
									<div class="search_wrap" style="padding: 0px 10px 20px 15px;">
										<form class="form-inline" id="empFrm">
											검색어&nbsp;<input type="text" class="form-control" id="word">&nbsp;&nbsp;&nbsp;
											<input type="hidden" name="keyword">
											<input type="hidden" name="retrKeyword">
											<label class="fancy-checkbox-inline">
												<input type="checkbox" id="retrChk">
												<span>퇴직자 포함</span>
											</label>
											<input type="hidden" name="retrDelYn" id="retrDelYn">
											<input type="button" class="btn btn-primary" style="float:right;" name="search" onclick="empListModal('${pageContext.request.contextPath}/businessRequestEmpList.ajax','empFrm')" value="검색">
										</form>
									</div>
			
									<div class="list_wrap">
										<table class="table tablesorter" id="empModalTable">
											<thead style="display:table;width:100%;table-layout:fixed;">
												<tr>
													<th class="sorter-false"></th>
													<th>구분</th>
													<th>사원번호</th>
													<th>이름</th>
													<th>부서</th>
													<th>직급</th>
												</tr>
											</thead>
											<tbody id="empModalTbody" style="display:block;height:200px;overflow:auto;">
<!-- 												<tr> -->
<!-- 													<td> -->
<!-- 														<label class="fancy-checkbox-inline"> -->
<!-- 															<input type="checkbox" name="emnoChk"> -->
<!-- 															<span></span> -->
<!-- 														</label> -->
<!-- 													</td> -->
<!-- 													<td>0905000211</td> -->
<!-- 													<td>DB연동</td> -->
<!-- 													<td>DB연동</td> -->
<!-- 													<td>DB연동</td>													 -->
<!-- 												</tr> -->
											</tbody>
										</table>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="emnoClick()">선택</button>
									</div>
								</div>
							</div>
						</div>
						<!-- END MODAL -->
						
					</div>
				</div>
			</div>
		<!-- END MAIN CONTENT -->
		</div>
	</div>
	<!-- END MAIN -->
</body>
</html>