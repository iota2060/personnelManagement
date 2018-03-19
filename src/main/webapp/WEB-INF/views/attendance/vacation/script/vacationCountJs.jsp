<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var url = "vacationCountEmpList.exc"
	var formId = "vacCntSelectFrm"; //초기, 검색할 때 id를 기본값으로 세팅

	$(document).ready(function(){
		calendar(); //년도달력
		vacCntEmpSignUpCntNum(); //사원등록 개수
		vacCntEmpList(); //사원정보 리스트 ajax
		
		$(document).on("click", "#empIncoDate", function(){ //휴가일수 텍스트박스 클릭하면 체크박스 자동 checked
			$(this).closest('tr').find("input[type=checkbox]").prop("checked",true);
		});
	});

	//검색을 눌렀을 때
	function vacCntEmpListSearch(){
		vacCntEmpList();
	}

	//검색결과 없을 시, 조건 초기화
	function searchReset(){
		window.location.reload();
	}

	//휴가일수 자동계산을 눌렀을때
	function vacCntCalculation(){
		
		if($('input:checkbox:checked').length == 0){ //선택된 체크박스가 없을 경우 alert창 띄움
			alert('선택된 체크박스가 없습니다.');
		}else{
			var empEmnoResult; //체크된 사원번호를 저장할 변수(ex. 사원번호/사원번호/사원번호)
			
			$("input[type=checkbox][id=emnoChk]").each(function(){
				if($(this).prop('checked')){
					var chkTr = $(this).closest('tr'); //체크한 체크박스와 가장 가까운 tr
					var chkTdText = chkTr.children().eq(2).text(); //체크한 체크박스의 2번째 td의 내용(사원번호)
		
					if(empEmnoResult == null){
						empEmnoResult = chkTdText;
					}else{
						empEmnoResult = empEmnoResult + "/" + chkTdText; //사원번호를 구분자와 함께 저장
					}
				}//checked면
			});//foreach
		
			$('#empEmnoResult').val(empEmnoResult); //input hidden에 value로 입력
//	 		console.log($('#empEmnoResult').val());
			
			paging.ajaxFormSubmit("vacationCountAutoCalculation.exc", "vacCntEmpFrm", function(rslt){
//	 			console.log("휴가일수 자동계산:"+JSON.stringify(rslt));
				
				if(rslt == null || rslt.success == "N"){
//	 				console.log('에러');
				}else if(rslt.success == "Y"){
		 			$.each(rslt.vacationCountAutoCalculation, function(k, v) {
		 				$("input[type=checkbox][id=emnoChk]").each(function(){
		 					if($(this).prop('checked')){
		 						var chkTr = $(this).closest('tr'); //체크한 체크박스와 가장 가까운 tr
		 						var chkTdText = chkTr.children().eq(2).text(); //체크한 체크박스의 2번째 td의 내용(사원번호)
		 						
		 						if(chkTdText == v.empEmno){
		 							$(this).closest('tr').find("input").val(v.vacCnt);
		 						}//if
		 					}//checked면
		 				});//foreach
		 			});
				}
			});//vacationCountAutoCalculation.exc
		}
	}//vacCntCalculation
	
	//저장을 눌렀을 때
	function vacCntSave(){
		
		if($('input:checkbox:checked').length == 0){ //선택된 체크박스가 없을 경우 alert창 띄움
			alert('선택된 체크박스가 없습니다.');
		}else{
			$('#baseYear2').val($('#baseYear').val()); //baseYear 컨트롤러로 넘기기
			var empEmnoResult; //체크된 사원번호를 저장할 변수(ex. 사원번호/사원번호/사원번호)
			
			$("input[type=checkbox][id=emnoChk]").each(function(){
				if($(this).prop('checked')){
					var chkTr = $(this).closest('tr'); //체크한 체크박스와 가장 가까운 tr
					var chkEmpEmnoText = chkTr.children().eq(2).text(); //체크한 체크박스의 2번째 td의 내용(사원번호)
					var chkVacCntText = chkTr.find("input[type=text]").val(); //휴가일수 내용
//	 				console.log(chkVacCntText);

					if(chkVacCntText == ''){
						chkVacCntText = "0"; //휴가일수 입력한 값이 없으면 0으로 넣게
					}
					
					if(empEmnoResult == null){
						empEmnoResult = chkEmpEmnoText + "^" + chkVacCntText;
					}else{
						empEmnoResult = empEmnoResult + "/" + chkEmpEmnoText + "^" + chkVacCntText; //사원번호,휴가일수를 구분자와 함께 저장
					}
				}//checked면
			});//foreach
			
			$('#empEmnoResult').val(empEmnoResult); //input hidden에 value로 입력
//	 		console.log($('#empEmnoResult').val());
			
			paging.ajaxFormSubmit("vacationCountUpdate.exc", "vacCntEmpFrm", function(rslt){
//	 			console.log("결과데이터:"+JSON.stringify(rslt));
				
				if(rslt == null){
					alert("저장에 실패하였습니다. 다시 시도해주세요.")
				}else{
					alert("저장이 완료되었습니다.");
					window.location.reload();
				}
			});//vacationCountUpdate.exc
		}
	}//vacCntSave

	//퇴직자 포함 체크여부
	function retrCheck(){
		if(($('#retrChk').prop("checked")) == true ){
			$('#retrDelYn').val('on');
		}else{
			$('#retrDelYn').val('off');
		}
	}//retrCheck

	//사원정보 리스트 ajax
	function vacCntEmpList(){
		retrCheck(); //퇴직자 포함 체크여부

		paging.ajaxFormSubmit(url, formId, function(rslt){
//	 		console.log("결과데이터:"+JSON.stringify(rslt));

			$('#vacCntEmpListTable').children('thead').css('width','calc(100% - 1.1em)'); //테이블 스크롤 css

			if(rslt == null || rslt.success == "N"){
				$('#vacCntEmpListTbody').append( //리스트가 없을 경우 : 조회된 데이터가 없습니다+조건초기화 버튼
	 				"<div class='text-center'>"+
	 					"<br><br><br><br>조회할 데이터가 없습니다.<br><br><br><br>"+
	 					"<button type='button' class='btn btn-info' id='searchresetBtn' onclick='searchReset()''>조건초기화</button>"+
	 				"</div>"
	 			);
			}else if(rslt.success == "Y"){
	 			$.each(rslt.vacationCountEmpList, function(k, v) {
					$('#vacCntEmpListTbody').append(
	 					"<tr style='display:table;width:100%;table-layout:fixed;'>"+
							"<td style='width:6%;'>"+
								"<label class='fancy-checkbox-inline'>"+
									"<input type='checkbox' id='emnoChk'>"+ //checkbox
									"<span></span>"+
								"</label>"+
							"</td>"+
							"<td style='width:12%;'>"+ v.retrDelYn +"</td>"+ //사원번호
							"<td style='width:12%;'>"+ v.empEmno +"</td>"+ //사원번호
							"<td style='width:12%;'>"+ v.empName +"</td>"+ //사원명
							"<td style='width:12%;'>"+ v.deptName +"</td>"+ //부서명
							"<td style='width:12%;'>"+ v.rankName +"</td>"+ //직급명
							"<td style='width:12%;'>"+ v.retrIncoDate +"</td>"+ //입사일자
							"<td><input type='text' class='form-control' id='empIncoDate' value='"+v.emreVacUd+"'>일</td>"+
						"</tr>"
					);//tbody append
	 			});
	 			
	 			//선택한 년도에 따른 예외처리 : 선택한 년도가 올해가 아니면 수정 제한
	 			if($('#baseYear').val() != moment().format('YYYY')){
	 				$("input[type=checkbox][id=retrChkAll]").prop('disabled',true); //체크박스 선택불가
	 				$("input[type=checkbox][id=emnoChk]").prop('disabled',true); //체크박스 선택불가
	 				$('#empIncoDate').prop('readonly',true); //휴가일수 입력불가
	 				$('#vacCntCalculationBtn').prop('disabled',true); //자동계산버튼 선택불가
	 				$('#vacCntSaveBtn').prop('disabled',true); //저장버튼 선택불가
	 			}else{
	 				$("input[type=checkbox][id=retrChkAll]").prop('disabled',false); //체크박스 선택불가
	 				$("input[type=checkbox][id=emnoChk]").prop('disabled',false); //체크박스 선택불가
	 				$('#empIncoDate').prop('readonly',false);
	 				$('#vacCntCalculationBtn').prop('disabled',false);
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
		});//vacationCountEmpList.exc
	}//vacCntEmpList

	/* 체크박스 전체선택 */
	function checkAllFunc(){ //최상단 체크박스를 click하면
		if($('#retrChkAll').is(":checked")){
			$("input[type=checkbox][id=emnoChk]").prop('checked', true);
		}else{
			$("input[type=checkbox][id=emnoChk]").prop('checked', false);
		}
	}//checkAllFunc

	//년도 달력
	function calendar(){
		$('#baseYear').val(moment().format('YYYY'));
	  $('#yearDateTimePicker').datetimepicker({
			viewMode: 'years', //올해 년도 보여줌
			format: 'YYYY'
		});
	  
		//년도의 최대값을 올해로 제한
		$('#yearDateTimePicker').data("DateTimePicker").maxDate(moment());
	}//calendar

	// 휴가신청현황 페이지로 이동 
	function vacCntEmpSignUp(){
		window.location.href = "${pageContext.request.contextPath}/vacationCountEmpSignUp";
	}

	//휴가일수설정 사원등록 필요 사원 개수
	function vacCntEmpSignUpCntNum(){
		paging.ajaxSubmit("vacationCountEmpSignUpCntNum.exc", "", function(rslt){
//	 		console.log("결과데이터:"+JSON.stringify(rslt));
			$("#empSignUpCntNum").html(rslt); //라벨 안에 개수 넣기
		});//vacationCountEmpSignUpCntNum.exc
	}//vacCntEmpSignUpCntNum
</script>