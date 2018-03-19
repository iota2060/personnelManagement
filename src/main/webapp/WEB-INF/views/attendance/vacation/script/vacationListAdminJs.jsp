<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/spring/resources/common/management/js/menuTree.js"></script>
<script>

	$(document).ready(function(){
		calendar();		//달력함수
		retSelect();	//재직 여부
		deptSelect();	//부서 셀렉 
		rankSelect();	//직급 셀렉
		vacEmpList();	//사원 리스트 함수 AJAX
		enterKey();	//검색 후 엔터키 작동
		$('.table tr').children().addClass('text-center'); //테이블 내용 가운데정렬
	});
	
	/* 휴가 조회 리스트  ajax */
	function vacEmpList(){
		paging.ajaxFormSubmit("vacationListAdmin.exc", "vacListAdminFrm", function(rslt){
			console.log("ajaxFormSubmit -> callback");
			console.log("결과데이터:"+JSON.stringify(rslt));
			
			//이전 리스트 삭제
			$('#deptNameList').empty();	//부서 셀렉박스
			$('#rankNameList').empty();	//직급 셀렉박스
			$('#vacListTbody').empty();	//사원 리스트
			
			//테이블 스크롤 CSS
			$('#vacListTable').children('thead').css('width','calc(100% - 1.1em)');
			
			//부서명 셀렉박스
			if(rslt.deptNameList == null){
				$('#deptNameList').append("<option value=''>"+ 없음  +"</option>");
			} else {
				$('#deptNameList').append(
					"<option value=''>"+ '부서' +"</option>");
				$.each(rslt.deptNameList, function(k, v){
					$('#deptNameList').append(
						"<option value='"+v.deptCode+"'>"+ v.deptName +"</option>"	
					);
				});//.each.deptName
				$('#deptNameList').val($('#deptHidden').val()).prop("selected", true); //input hidden값 value를 선택
			}//if
	
			
			//직급명 셀렉박스
			if(rslt.rankNameList == null){
				$('#rankNameList').append("<option value=''>"+ 없음  +"</option>");
			} else {
				$('#rankNameList').append(
					"<option value=''>"+ '직급' +"</option>");
				$.each(rslt.rankNameList, function(k, v){
					$('#rankNameList').append(
						"<option value='"+ v.rankCode +"'>"+ v.rankName + "</option>"		
					);
				});//each.rankName
				$('#rankNameList').val($('#rankHidden').val()).prop("selected", true); //input hidden값 value를 선택
				
			}//if
			
			//사원 휴가 리스트
			if(rslt.vacationList == null){
				$('#vacListTbody').append(
					"<div class='text-center'><br><br><br><br>조회할 데이터가 없습니다.</div>"	
				);
			} else {
				$.each(rslt.vacationList, function(k, v){
					$('#vacListTbody').append(
						"<tr data-toggle='modal' data-target='#myModal' id='"+v.empEmno+"' onclick='empVacationList("+JSON.stringify(v.empEmno)+")'>"+
							"<td>"+ v.retrDelYn +"</td>"+	//재직구분
							"<td>"+ v.empEmno +"</td>"+ //사원번호
							"<td>"+ v.empName +"</td>"+ //사원명
							"<td>"+ v.deptName +"</td>"+ //부서명
							"<td value='"+v.rankCode+"'>"+ v.rankName +"</td>"+ //직급명
							"<td>"+ v.emreVacUd +"</td>"+ //휴가 전체 일수
							"<td>"+ v.emrePvacUd +"</td>"+ //휴가 사용 일수
							"<td>"+ v.remineVacUd +"</td>"+	//휴가 잔여일수
						"</tr>"
					);
				});//each list
	
				//테이블 내용 가운데 정렬	
				$('#vacListTable').children().addClass('text-center');	
				//테이블 sort
				$(function(){
					$("table").trigger("update"); 
				});
				$(function(){
					$('#vacListTable').tablesorter({sortList: [[0,0], [1,0]]});
				});	 	
					
			}//if-table 생성
			
			
			//테이블 마우스오버시 (행을 지날 때), 색 바뀜
			$('table tbody tr').mouseover(function(){ 
				$(this).css("backgroundColor","#f2f2f2"); 
				$(this).click(function(){
					$(this).css("backgroundColor","#88C9DF").selected();
				});
			}); 
			$('table tr').mouseout(function(){ 
				$(this).css("backgroundColor","#fff"); 
			});
		});//paging.ajaxFormSubmit
	};//vacationAdemin List : END
	
	/*검색 버튼 */
	function searchClick(){
		vacEmpList();
	};
	
	/* 검색어 입력 후 엔터키 작동 */
	function enterKey(){
		$("#keyword").keydown(function(f){
			if(f.keyCode == 13){	//javaScript에서는 13이 enter키를 의미함
				searchClick();
				return false;
			}
		});
	}
	
	/* 재직 셀렉 */
	function retSelect(){
		$('#retTypeList').change(function(){
			$('#retHidden').val($(this).children("option:selected").select().val());
			vacEmpList();
		});
	}
	
	/* 부서명 셀렉 */
	function deptSelect(){
		$("#deptNameList").change(function(){
			//input hidden의 vlaue로 선택한 option을 입력
			$('#deptHidden').val($(this).children("option:selected").select().val()); 
			vacEmpList(); //ajax 실행
		});
	}
		
	/* 직급명 셀렉 */
	function rankSelect(){
		$('#rankNameList').change(function(){
			$('#rankHidden').val($(this).children("option:selected").select().val());
			vacEmpList();	//ajax 실행
		});
	}
	
	/* 년도 달력 */
	function calendar(){
		$('#baseYear').val(moment().format('YYYY'));	//올해 년도 보여줌
		$('#yearDateTimePicker').datetimepicker({
			viewMode: 'years',
			format: 'YYYY'
		});
		
		//년도의 최대값을 올해로 제한
		$('#yearDateTimePicker').data("DateTimePicker").maxDate(moment());
	};	
	
	/* 휴가신청현황 페이지로 이동 */
	function vacationProgressList() {
		window.location.href = "${pageContext.request.contextPath}/vacationProgressList";
	}
	
	/* 휴가 신청현황 개수 표시 */
	$(function() {
		paging.ajaxSubmit("vacationProgCntNum.exc", "", function(rslt) {
			console.log("결과데이터:" + JSON.stringify(rslt));
			$("#countNum").html(rslt);
		});
	});
	
	//인쇄
	function vacListPrint(){
		$('#mainDiv').printElement();
	}
	
	//엑셀 다운
	function vacListExcelExport(){
		$("#vacListTable").excelexportjs({
			containerid: 'vacListTable',
			datatype: 'table'
		});
	}
	
	/*모달 리스트 START */
	$(function(){
		empVacationList();	//사원 휴가 사용 내역 ajax
		$('#empVacListTable').children().addClass('text-center'); //테이블 내용 가운데 정렬
	});
	
	//테이블 정렬
	function tablesorterFunc(){
		$('#empVacListTable').tablesorter();
		$('#empVacListTable').tablesorter({sorterList: [[0,0],[1,0]]});
	}
	
	//휴가 신청 내역 ajax start
	function empVacationList(empEmno){
		$('#empEmno').val(empEmno);	
		console.log(empEmno);
		
		paging.ajaxFormSubmit("empVacationList.exc", "empVacFrm", function(rslt){
			console.log("결과데이터:"+JSON.stringify(rslt));
			
			//테이블 스크롤 CSS
			$('#empVacListTable').children('thead').css('width','calc(100% - 1.1em)');
			$('#empVacListTbody').empty();	//이전 리스트 삭제
			//상단 사원 정보
			$.each(rslt.empInfo, function(k, v){
				$('#empInfoH').html('[' + v.deptName + ']' + '&nbsp;' + v.empName + '&nbsp;' + v.rankName + '&nbsp;' + "휴가 현황");
			});	//each.empInfo
			
			//휴가 현황 정보 리스트
			var i = 1;
			$.each(rslt.empVacList, function(k, v){	
				$('#empVacListTbody').append(
					"<tr>"+
	 					"<td>"+ i +"</td>"+ //번호
	 					"<td>"+ v.vastReqDate +"</td>"+	//휴가신청날짜
	 					"<td>"+ v.vastType +"</td>"+	//휴가명
	 					"<td>"+ v.vastTerm +"</td>"+	//휴가기간
	 					"<td>"+ v.vastVacUd +"</td>"+	//사용개수
	 					"<td>"+ v.vastCont +"</td>"+	//휴가 사유
 					"</tr>"
				);//append Tbody
				i++;	//번호 1씩 증가
			});//each.empVacList

			//휴가 개수 
			$.each(rslt.empVacNum, function(k, v){
				$('#empVacListTbody').append(
					"<th colspan='2' class='text-center' id='vacationNumTh'>" + '합계' + "</th>" +
					"<th colspan='5'>" +
						"·총 휴가일수:" +"&nbsp;"+ v.emreVacUd +"&nbsp;&nbsp;" +	//휴가 전체 일수
						"·사용일수:" +"&nbsp;"+ v.emrePvacUd +"&nbsp;&nbsp;" +	//사용 일수
						"·잔여일수:" +"&nbsp;"+ v.remineVacUd +"&nbsp;&nbsp;" +	//잔여 일수
					"</th>"	
				);//append th
			});	//each.empVacNum
		});//paging
	}//휴가 신청 내역 ajax end
	/*모달 리스트 END */
</script>