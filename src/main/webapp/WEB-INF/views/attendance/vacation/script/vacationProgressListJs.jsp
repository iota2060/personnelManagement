<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	/* 실행함수 모음 */
	$(document).ready(function(){
		calendar();	//달력
		deptSelect();	//부서 셀렉 
		rankSelect();	//직급 셀렉
		situationSelect();	//승인현황 셀렉
		progList();	//승인현황 리스트 ajax
		enterKey();	//검색 후 엔터키
		$('.table tr').children().addClass('text-center'); //테이블 내용 가운데정렬
	});
	
	/* ajax - list */
	function progList() {
		paging.ajaxFormSubmit("vacationProgressList.exc", "f1", function(rslt){
			console.log("ajaxFormSubmit -> callback");
			console.log("결과데이터" + JSON.stringify(rslt));
			
			//이전 리스트 삭제
			$('#deptNameList').empty();	//부서 셀렉박스
			$('#rankNameList').empty();	//직급 셀렉박스
			$('#progressTbody').empty();	//사원 리스트
			
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
			
			//사원 리스트
			if(JSON.stringify(rslt.vacationProgressList) == '[]'){
				$('#progressTbody').append(
					"<tr>"+
						"<td colspan='11'>조회할 자료가 없습니다.</td>"+
					"</tr>"
				);
			}else{
				$.each(rslt.vacationProgressList, function(index, s){
					$("#progressTbody").append(
						"<tr val='"+s.vastSerialNumber+"'>" +
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
							"<td>" + s.vastReqDate + "</td>" +
							"<td>" + 
								"<input type='hidden' id='vastC', name='vastC' value='"+ s.vastC +"'>" + 
									s.vastType + "</td>" +
							"<td>" + s.vastTerm + "</td>" +
							"<td>" + s.vastVacUd + "</td>" +
							"<td>" + s.vastCont + "</td>" +
							"<td val='"+s.vastProgressSituation+"'>" + s.vastProgressSituation + "</td>"+
							"<input type=hidden id='vastDelYn' name='vastDelYn' val='"+ s.vastDelYn +"'>"+
						"</tr>"
					);//append
				});//each.List
				
				//table 가운데 정렬
				$('#progressTable').children().addClass('text-center');
				//table sorter
				$(function(){
					$("table").trigger("update"); 
				});
				$(function(){
					$('#progressTable').tablesorter({sortList: [[0,0],[1,0]]});
				});	
			}//if-table 생성
				
			//마우스오버
			$('#progressTbody tr').hover(function(){		
				//승인대기면 x 아이콘 생성하고
				if($(this).children().eq(10).text() == "승인대기"){
					$(this).append("<span class='fa fa-close right-icon' name='delBtn' onclick='vacDel(this)' style='margin-top:12px'></span>");					
				}//if
			},	
			function(){
				if($(this).children().eq(10).text() == "승인대기"){
					$(this).find("span:last").remove();					
				}//if
			});
		});//paging
	}//ajax로 리스트 불러오기
	
	/*검색 버튼 */
	function searchClick(){		
		progList();
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
	
	/* 부서명 셀렉 */
	function deptSelect(){
		$("#deptNameList").change(function(){
			$('#deptHidden').val($(this).children("option:selected").select().val()); 
			progList(); //ajax 실행
		});
	}
		
	/* 직급명 셀렉 */
	function rankSelect(){
		$('#rankNameList').change(function(){
			$('#rankHidden').val($(this).children("option:selected").select().val());
			progList();	//ajax 실행
		});
	}
	
	/* 승인현황 셀렉 */
	function situationSelect(){
		$('#situationList').select().val('승인대기');
		$('#situationList').change(function(){
			$('#situationHidden').val($(this).children('option:selected').select().val());
			progList();	//ajax 실행
		});
	}
	
	/* 달력 */
	function calendar(){
		$('#baseYear').val(moment().format('YYYY'));	//올해 년도 보여줌
		$('#yearDateTimePicker').datetimepicker({
			viewMode: 'years',
			format: 'YYYY'
		});
		
		$('#yearDateTimePicker').data("DateTimePicker").maxDate(moment()); //년도의 최대값을 올해로 제한
	};	
		
	/* 체크박스 전체선택 */
	function checkAllFunc(obj){ //최상단 체크박스를 click하면
		$("input[type='checkbox'][name=chk]").each(function() {
			this.checked = obj.checked;  //name이 chk인 체크박스를 checked로 변경
		})
	} 
	
	/* 승인취소 버튼 */
	function toggleOff(){
		var chk = $("[name=chk]").length; //체크박스 갯수
		
		$('[name=chk]').each(function(){
			var progTr = $(this).closest('tr'); //체크박스와 가까운 위치의 tr
			var progTd = progTr.children().eq(10); //tr 자식인 10번째 인덱스의 td(승인현황 있는 위치의 td)
			console.log("TD10번째"+progTd);
			if($(this).prop('checked')){
				progTd.html('승인취소');
			}
		});	
	}//toggleOff
	
	/* 승인완료 버튼 */
	function toggleOn(){
		var chk = $("[name=chk]").length; //체크박스 갯수
		
		$("[name=chk]").each(function() {
			console.log(chk);
			var progTr = $(this).closest('tr'); //체크박스와 가까운 위치의 tr
			var progTd = progTr.children().eq(10); //tr 자식인 10번째 인덱스의 td(승인현황 있는 위치의 td)
			
			if($(this).prop('checked')){			
				progTd.html('승인완료');
				console.log(progTd+"ssasss");
			}//if
		});	//name-each	
	}//toggleOn
	
	
	/* 승인완료&취소 후 저장하기  */
	function vacProgSave(){
		var chk = $("[name=chk]").length; //체크박스 갯수
		var progToggleResult;	//체크된 것 저장할 결재상황
			
		$("[name=chk]").each(function(){	
			if($(this).prop('checked')){
				var chkTr = $(this).closest('tr');	//체크한 것과 가장 가까운 tr
				var chkHi = chkTr.children().children("input[type=hidden][id=vastSerialNumber]").val();//체크한 것의 히든 value 값
				var chkVc = chkTr.children().children("input[type=hidden][id=vastC]").val();	//휴가코드 value
				var chkSi = chkTr.children().eq(10).text();	//결재상황 
				var chkUd = chkTr.children().eq(8).text(); //휴가사용일수(개수)
	
				console.log("xxxxxx"+chkHi+"xxxx"+chkVc+"xxxx"+chkSi+"xxxx"+chkUd);
		
				if(progToggleResult == null){
					progToggleResult = chkHi + "^" + chkVc + "#" + chkSi + "^" + chkUd;
				} else{
					//시리얼넘버 + 결재상황 을 구분자와 함께 저장			
					progToggleResult = progToggleResult +"/"+ chkHi + "^" + chkVc + "#" + chkSi + "^" + chkUd;
					console.log("저장::"+progToggleResult);
				}//if	
			}//if.prop
		});//input.each		
		//input Hidden에 value로 저장
		$('#progToggleResult').val(progToggleResult);
			console.log("저장후::"+$('#progToggleResult').val());
		
		paging.ajaxFormSubmit("vacationProgSave.exc", "f2", function(rslt){
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
	
	
	/* 휴가 삭제 */
	function vacDel(){
		var vacationDel;	//삭제되는 데이터 저장 변수
		var delTr = $(this).parent();	//마우스오버된 해당 행
	
		if(confirm("삭제하시겠습니까?") == true){	//확인
			delTr.remove();	//해당 행 삭제 
		
			$('[name=delBtn]').each(function(){
				if($('[name=delBtn]').prop('click')){
					var chkTr = $(this).closest('tr');	//클릭한 것과 가장 가까운 tr
					var chkHi = chkTr.children().children("input[type=hidden][id=vastSerialNumber]").val();//체크한 것의 히든 value 값
					console.log("////"+chkHi+"//");
					
					if(vacationDel == null){
						vacationDel = chkHi;
					} else{
						vacationDel = vacationDel +"/"+chkHi;
						console.log("삭제삭제::"+vacationDel);
					}
				}//if
			//input Hidden에 value로 저장
			$('#progToggleResult').val(vacationDel);
				console.log("삭제 후::::"+$('#progToggleResult').val());
				
				$('#vastSerialNumber').val($('#progToggleResult').val());
			paging.ajaxFormSubmit("vacationDel.exc","f2", function(rslt){
				console.log("ajaxFormSubmit -> callback");
				console.log("결과데이터" + JSON.stringify(rslt));
				
				if(rslt == null){
					alert("삭제에 실패하였습니다. 다시 시도해주세요.")
				} else{
					alert("삭제되었습니다.")
					window.location.reload();	//새로고침
				}
			});//paging.ajax
			});
		} else{	//취소
			return false;
		}
	}//vacDel
</script>