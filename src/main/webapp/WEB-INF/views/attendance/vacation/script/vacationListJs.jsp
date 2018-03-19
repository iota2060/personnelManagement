<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		vacTypeList(); //휴가 셀렉박스 ajax
		calendar(); //달력
		vacSelect(); //휴가 셀렉박스 
		
		//휴가일수설정에 등록된 사원인지 체크하여 alert창 띄우기
		paging.ajaxFormSubmit("empVacChk.exc", "vacListFrm", function(rslt){
			if(rslt != '1'){
				$('#vacStatementTbody').append( //리스트가 없을 경우 : 조회된 데이터가 없습니다
		 				"<div class='text-center'><br><br><br><br>조회할 데이터가 없습니다.</div>"
		 		);
				$('#printBtn').attr("disabled", true); //인쇄버튼 막기
				$('#excelBtn').attr("disabled", true); //엑셀버튼 막기
				
				alert('휴가일수가 설정되지 않았습니다.\n관리자에게 문의하세요.');
			}else{
				$('.button').attr('disabled',false);
				vacationListSelect(); //휴가신청내역 ajax
			}
		});
	});
	
	function calendar() {
		$('#vastReqDate').val(moment().format('YYYY.MM.DD')); //휴가 신청일
		$('#vastStartDate').val(moment().format('YYYY.MM.DD')); //휴가 시작일
		$('#vastEndDate').val(moment().format('YYYY.MM.DD')); //휴가 종료일
		$('#vastVacUd').val(moment().format('1'));
		
		$('#crtDate').datetimepicker({ //휴가신청일 달력
			viewMode : 'days',
			format : 'YYYY.MM.DD'
		});
		
		$('#startDate').datetimepicker({ //휴가시작일 달력
			viewMode : 'days',
			format : 'YYYY.MM.DD'
		});
	
		$('#endDate').datetimepicker({ //휴가종료일 달력
			viewMode : 'days',
			format : 'YYYY.MM.DD'
		});
	
		//휴가종료날짜가 시작날짜 이전인 날짜는 선택 불가능하도록 제한
		$('#startDate').on("dp.change", function(e) {
			$('#endDate').data("DateTimePicker").minDate(e.date);
		});
	
		//일수 자동 계산 - startDate 변경시
		$('#startDate').on("dp.change", function() { //시작날짜를 변경할 때마다
			var startDate = moment($('#vastStartDate').val(), "YYYYMMDD");
			var endDate = moment($('#vastEndDate').val(), "YYYYMMDD");
	
			$('#vastVacUd').val(endDate.diff(startDate, "days")+1); //endDate-startDate를 일수로 출력
		});
		
		//일수 자동 계산 - endDate 변경시
		$('#endDate').on("dp.change", function() {
			var startDate = moment($('#vastStartDate').val(), "YYYYMMDD");
			var endDate = moment($('#vastEndDate').val(), "YYYYMMDD");
	
			$('#vastVacUd').val(endDate.diff(startDate, "days")+1); //endDate-startDate를 일수로 출력
		});
	};//calendar
	
	/* ajax - 휴가타입 셀렉박스 */
	function vacTypeList(){
		paging.ajaxFormSubmit("vacTypeList.exc", "vacReqFrm", function(rslt){
			console.log("결과데이타" + JSON.stringify(rslt));
			
			//이전 리스트 삭제
			$('#vacationTypeList').empty();	//휴가타입 셀렉트
			//휴가 셀렉박스
			if(rslt.vacationTypeList != null){
				$('#vacationTypeList').append(
					"<option value=''>"+ '선택' +"</option>");
				$.each(rslt.vacationTypeList, function(k,v){
					$('#vacationTypeList').append(
						"'<option value='"+ v.vastC +"'>"+ v.vastType +"</option>"
					);//append	
				});	//each.vacationTypeList
				$('#vacationTypeList').val($('#vacationTypeHidden').val()).prop("selected", true);//hidden 값 value를 선택하고 유지	
			} else{
				$('#vacationTypeList').append('<option>'+ '선택' +'</option>');
			}//if
		});//paging
	}//vacationTypeList AJAX
	
	function vacSelect(){
	 	$("#vacationTypeList").click(function(){
	 		var startDate = moment($('#vastStartDate').val(), "YYYYMMDD");
			var endDate = moment($('#vastEndDate').val(), "YYYYMMDD");			
			
			if($("#vacationTypeList option:selected").text() == "반차"){ //반차면 일수 0.5로 변경
				$('#vastVacUd').val('0.5');//일수 입력창이 0.5로 바뀜
				$('#vastEndDate').val($('#vastStartDate').val());
				if(endDate-startDate != 0){
					alert("반차는 시작날짜와 끝날짜가 같아야 합니다.");
					$('#vastVacUd').val('0.5'); //input hidden값 value를 선택
				}
			} else{
				$('#vastVacUd').val(endDate.diff(startDate, "days")+1); //endDate-startDate를 일수로 출력
			}
	 	});
	}//vacSelect
	
	//테이블 정렬
	function tablesorterFunc(){
		$("#vacStatementTable").tablesorter();
		$("#vacStatementTable").tablesorter({sortList: [[0,0], [1,0]]});
	}
	
	//사원별 휴가 개수, 휴가신청내역 ajax
	function vacationListSelect(){
		paging.ajaxFormSubmit("vacationListSelect.exc", "vacListFrm", function(rslt){
	//			console.log("휴가신청내역:"+JSON.stringify(rslt));
	
			$('#vacStatementTable').children('thead').css('width','calc(100% - 1.1em)'); //테이블 스크롤 css
	
			if(rslt == null || rslt.success == "N"){
				$('#vacStatementTbody').append( //리스트가 없을 경우 : 조회된 데이터가 없습니다
	 				"<div class='text-center'><br><br><br><br>조회할 데이터가 없습니다.</div>"
	 			);
			}else if(rslt.success == "Y"){
	 			var i = 1;
	 			$.each(rslt.vacationProgressList, function(k, v) {
		 			$.each(rslt.empRemindingVacList, function(k, v) {
		 				$('#empEmno').text($("input[type=hidden][name=empEmno]").val());
		 				$('#empName').text(v.empName);
		 				$('#baseDate').text(v.baseDate);
		 				$('#emreVacUd').text(v.emreVacUd);
		 				$('#emrePvacUd').text(v.emrePvacUd);
		 				$('#remndrDate').text(v.remndrDate);
		 			});
	 				
					$('#vacStatementTbody').append(
						"<tr data-toggle='modal' data-target='#myModal' id='"+v.vastSerialNumber+"' onclick='empVacationList("+JSON.stringify(v.vastSerialNumber)+")' style='display:table;width:100%;table-layout:fixed;cursor:pointer;'>"+
		 					"<td>"+ i +"</td>"+ //번호
		 					"<td>"+ v.vastReqDate +"</td>"+ //신청일
		 					"<td>"+ v.vastType +"</td>"+ //휴가항목
		 					"<td>"+ v.vastTerm +"</td>"+ //휴가기간
		 					"<td>"+ v.vastVacUd +"</td>"+ //일수
		 					"<td>"+ v.vastProgressSituation +"</td>"+ //결재상황
						"</tr>"
					);
					i++; //번호 1 증가
					if(v.vastProgressSituation == "승인대기"){ //승인대기면 색상 변경
						$("#vacStatementTbody tr:last").attr("bgcolor","#f0ad4e");
					}
	 			});
			}
			$('#empInfo tr').children().addClass('text-center'); //테이블 내용 가운데 정렬
			$('#vacStatementTable tr').children().addClass('text-center'); //테이블 내용 가운데 정렬
			tablesorterFunc();
		});
	}
	
	function empVacationList(vastSerialNumber){
		$('input[name=vastSerialNumber]').val(vastSerialNumber);
		
		paging.ajaxFormSubmit("empVacListDetail.exc", "vacListFrm", function(rslt){
			console.log("결과데이터:"+JSON.stringify(rslt));
			
				$.each(rslt.empVacListDetail, function(k, v) {
					$('#vastReqDate').val(v.vastReqDate); //휴가신청일
					$('#vacationTypeList').val(v.vastC).attr("selected","selected") //휴가구분
					$('#vastProgressSituation').val(v.vastProgressSituation); //진행상태
					$('#vastStartDate').val(v.vastStartDate); //휴가시작일
					$('#vastEndDate').val(v.vastEndDate); //휴가종료일
					$('#vastVacUd').val(v.vastVacUd); //일수
					$('#vastCont').val(v.vastCont); //휴가사유
					
					if(v.vastProgressSituation == '승인완료' || v.vastProgressSituation == '승인취소'){
						$('#vastReqDate').attr("readonly",true); //휴가신청일
	 				$('#vacationTypeList').attr("readonly",true); //휴가구분
	 				$('#vastStartDate').attr("readonly",true); //휴가시작일
	 				$('#vastEndDate').attr("readonly",true); //휴가종료일
	 				$('#vastCont').attr("readonly",true); //휴가사유
	 				
						$('#footer').children().hide(); //승인완료면 수정,삭제 불가능하게 버튼 제거
					}else{
						$('#vastReqDate').attr("readonly",false); //휴가신청일
		 				$('#vacationTypeList').attr("readonly",false); //휴가구분
		 				$('#vastStartDate').attr("readonly",false); //휴가시작일
		 				$('#vastEndDate').attr("readonly",false); //휴가종료일
		 				$('#vastCont').attr("readonly",false); //휴가사유
	 				
						$('#footer').children().show(); //승인대기면 수정,삭제 가능
					}
				});
		});//empVacListDetail.exc
	}//empVacationList
	
	//휴가 수정
	function modalUpdate(){
		var result = confirm('수정하시겠습니까?');
		
		if(result){ //수정
			$('#vastReqDate').val(moment().format('YYYY.MM.DD'));	//휴가 신청일
			
			paging.ajaxFormSubmit("vacationListUpdate.exc", "vacReqFrm", function(rslt){
	// 			console.log("결과데이터:"+JSON.stringify(rslt));
	
		 		if(rslt.success == "Y"){
					alert('수정되었습니다.');
					window.location.reload(); //새로고침
		 		}
			});//vacationListUpdate.exc
		}
	}//modalUpdate
	
	//휴가 삭제
	function modalDelete(){
		var result = confirm('삭제하시겠습니까?');
		
		if(result){ //삭제
			paging.ajaxFormSubmit("vacationListDelete.exc", "vacReqFrm", function(rslt){
	// 			console.log("결과데이터:"+JSON.stringify(rslt));
	
		 		if(rslt.success == "Y"){
					alert('삭제되었습니다.');
					window.location.reload(); //새로고침
		 		}
			});//vacationListDelete.exc
		}
	}//modalDelete
	
	//인쇄
	function vacListPrint(){
		$('#mainDiv').printElement();
	}//vacListPrint
	
	//엑셀 다운
	function vacListExcelExport(){
		$("#vacStatementTable").excelexportjs({
			containerid: 'vacStatementTable',
			datatype: 'table'
		});
	}//vacListExcelExport
</script>