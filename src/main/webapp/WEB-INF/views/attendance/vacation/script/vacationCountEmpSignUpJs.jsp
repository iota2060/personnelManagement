<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var formId = "vacCntSelectFrm"; //초기, 검색할 때 id를 기본값으로 세팅
	
	$(document).ready(function(){
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
// 			console.log("결과데이터:"+JSON.stringify(rslt));
	
// 			$('#vacCntEmpListTbody').empty(); //이전 리스트 삭제
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
				}//else
	
				$('.table tr').children().addClass('text-center'); //테이블 내용 가운데정렬
				
				//테이블 정렬
				$(function(){
					$("#vacCntEmpListTable").tablesorter();
				});
				$(function(){ 
					$("#vacCntEmpListTable").tablesorter({sortList: [[0,0], [1,0]]});
				});
			}
		});//vacationCountEmpSignUpList.exc
	}//vacationCountEmpSignUpList
	
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
	//	console.log($('#empEmnoResult').val());
		
		paging.ajaxFormSubmit("vacCntEmpSignUpInsert.exc", "vacCntEmpFrm", function(rslt){
// 			console.log("결과데이터:"+JSON.stringify(rslt));
			
			if(rslt == null){
				alert("저장에 실패하였습니다. 다시 시도해주세요.")
			}else{
				alert("저장이 완료되었습니다.");
				window.location.reload(); //새로고침
			}
		});//vacCntEmpSignUpInsert.exc
	};//vacCntSave
	
	//체크박스 전체선택 
	function checkAllFunc(){ //최상단 체크박스를 click하면
		if($('#retrChkAll').is(":checked")){
			$("input[type=checkbox][id=emnoChk]").prop('checked', true);
		}else{
			$("input[type=checkbox][id=emnoChk]").prop('checked', false);
		}
	}//checkAllFunc
	
	//년도 달력
	function calendar(){
		$('#baseYear').val(moment().format('YYYY')); //올해 년도 보여줌
		$('#yearDateTimePicker').datetimepicker({
			viewMode: 'years',
			format: 'YYYY'
		});
		
		//년도의 최대값을 올해로 제한
		$('#yearDateTimePicker').data("DateTimePicker").maxDate(moment());
	};//calendar
</script>