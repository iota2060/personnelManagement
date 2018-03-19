<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>월 근태 현황</title>
</head>
<script>

	/* 근무년월 달력 함수 */
	$(function () {
		$('#workYyMm').datetimepicker({ //근무년월 달력
			viewMode: 'days',
			format: 'YYYY-MM'
		});
		$('#mnthAttdIpt').val(moment().format('YYYY-MM'));//페이지 시작시 날짜 자동입력
	});

	/* 사원번호 선택  Modal 함수 ==========================================================*/
	/* 퇴직자 포함 체크여부 */
	function retrCheck(){//모달창을 띄워 사원 list 띄우기
 		if(($('#retrChk').prop("checked")) == true ){
 			$('#retrDelYn').val('on');
 		}else{
 			$('#retrDelYn').val('off');
 		}
 		
	}//function empModal	
	
	function empListModal(url, formId){
		retrCheck();//퇴직자 포함 체크
		$('#empModalTbody').empty();//입력되있던 리스트데이터 삭제
		
		paging.ajaxFormSubmit(url, formId, function(rslt){
			console.log("결과데이터 " + JSON.stringify(rslt));
		
			$('#empModalTable').children('thead').css('width','calc(100% - 1em)'); //테이블 스크롤 css
			
			if(rslt == null){
				$('#empModalTbody').append(
				"조회할 데이터가 없습니다."
				
				);
			}else if(rslt.success == "Y"){
				$.each(rslt.empList, function(k, v) {
					$('#empModalTbody').append(
						"<tr style='display:table;width:100%;table-layout:fixed;'>"+
							"<td>"+
								"<label class='fancy-checkbox-inline'>" +
								"<input type='checkbox' name='empEmnoChk'>" +
								"<span></span>" +
								"</label>"+
							"</td>"+
							"<td>"+ v.retrDelYn +"</td>"+ //퇴직구분
							"<td>"+ v.empEmno +"</td>"+ //사원번호
							"<td>"+ v.empName +"</td>"+ //사원명
							"<td>"+ v.deptName +"</td>"+ //부서명
							"<td>"+ v.rankName +"</td>"+ //직급명
						"</tr>"
					);
				});//each
				
				$("input[type='checkbox'][name=empEmnoChk]").click(function(){	// 체크박스 선택 1개로 제한(라디오버튼처럼)
					if($(this).prop('checked')){ //check 이벤트가 발생했는지
						//체크박스 전체를 checked 해제후 click한 요소만 true로 지정
						$("input[type='checkbox'][name=empEmnoChk]").prop("checked", false);
						$(this).prop('checked',true);
					}
				});
				
				//테이블 내용 가운데 정렬
				$('#empModalTable tr').children().addClass('text-center');
				
				$(function(){ //테이블 정렬
					$("#empModalTable").tablesorter();
				});
				$(function(){
					$("#empModalTable").tablesorter({sortList: [[0,0], [1,0]]});
				});
				
			};//if
		});//paging.ajax
	}//empListModal
	
	/* 사원번호 검색창에 자동 채우기 */
	function empEmnoClick(){
 		var chkTr = $('input[name=empEmnoChk]:checked').closest('tr'); //체크된 체크박스와 가장 가까운 tr
 		var empEmnoVal = chkTr.children().eq(2).text(); //tr 하부 2번째 td의 텍스트(사번)
 		var empNameVal = chkTr.children().eq(3).text(); //tr 하부 3번째 td의 텍스트(이름)
 		var deptNameVal = chkTr.children().eq(4).text(); //tr 하부 4번째 td의 텍스트(부서)
 		var rankNameVal = chkTr.children().eq(5).text(); //tr 하부 5번째 td의 텍스트(직급)
 		
 		$('#empEmno').val(empNameVal);
 		$('#hiddenEmpEmno').val(empEmnoVal);
 		$('#hiddenEmpName').val(empNameVal);
 		$('#hiddenDeptName').val(deptNameVal);
 		$('#hiddenRankName').val(rankNameVal);
 		$(".modal-body input[name=keyword]").val(""); //키워드 내용 지우기
 	}
	
	/* 검색버튼 사원번호 / 성명 / 부서 / 직급 자동채우기  ajax
	<modal empEmnoChk hidden값으로 근태현황 입력창 내용 입력> ======================================*/
	function searchForm(){
		$('#empInfo tbody tr td:eq(0)').text($('#hiddenEmpEmno').val());
		$('#empInfo tbody tr td:eq(1)').text($('#hiddenEmpName').val());
		$('#empInfo tbody tr td:eq(2)').text($('#hiddenDeptName').val());
		$('#empInfo tbody tr td:eq(3)').text($('#hiddenRankName').val());
	}//searchForm
	
	/* 검색버튼 달력 출력 함수 ======================================================================*/
	function mnthAttdCal(url, formId){
		searchForm();// fucntion searchForm 근태현황 입력창 내용 입력
		
		paging.ajaxFormSubmit(url, formId, function(rslt){
			console.log("결과데이터 " + JSON.stringify(rslt));
			
			/* 선택한 달에 해당하는  resultList tbody에 출력*/
			for(i=0; i<rslt.resultList.length; i++){ //url, formId에 따른 결과값(rslt) resultList의 전체 길이를 1부터 length 만큼 출력 
				$('#mnthAttdCalInfo tbody tr td:eq(' + i + ')').text(rslt.resultList[i].day);
			}//for
			
			//근태
			for(i=32; i<rslt.resultList.length+32; i++){ //url, formId에 따른 결과값(rslt) resultList의 전체 길이를 1부터 length 만큼 출력
				
				var findIdx = -1;
				
				for(var j=0; j<rslt.resultWorkList.length; j++){ //그달에 근무한날의 list(1, 2, 5, 6, 13, 28일)가 
					if(rslt.resultWorkList[j].workDay == rslt.resultList[i-32].day){ //달력의 출력일과 같을때
						findIdx = j; //j값은 findIdx가 되어서
						break;//-1과 다르면 나옴
					}
				}//for
					
				if(findIdx >= 0){ // break 나온 수가  0 이상이면 
					$('#mnthAttdCalInfo tbody tr td:eq(' + i + ')').text(rslt.resultWorkList[findIdx].attendanceCd); // attendanceCd 를 그 칸에 출력
					
					$("#attdNumID td").each(function(){			// ID: attdNumID td	 두줄만 각각 입력 
						if($(this).text() == 'W1'){				//W1이면 ■로 바꿔
								$(this).text($(this).text().replace('W1','■'));
								$(this).css("color","red");
							
						}else if($(this).text() == 'W2'){		//W2이면 ■로 바꿔
								$(this).text($(this).text().replace('W2','■'));
								$(this).css("color","green");
								
						}else if($(this).text() == 'W3'){		//W3이면 ■로 바꿔
								$(this).text($(this).text().replace('W3','■'));
								$(this).css("color","blue");
								
						}else if($(this).text() == 'W4'){		//W4이면 ■로 바꿔
								$(this).text($(this).text().replace('W4','■'));
								$(this).css("color","darkgray");
							
						}else if($(this).text() == 'W5'){		//W5이면 ■로 바꿔
								$(this).text($(this).text().replace('W5','■'));
								$(this).css("color","magenta");
						}
					
					});
					
				}else{
					$('#mnthAttdCalInfo tbody tr td:eq(' + i + ')').text(''); //-1이고 0보다 작으면 빈칸 출력
				}
			}//for
			
			
			
		});//ajaxFormSubmit
	}//mnthAttdCal
	
</script>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">월 근태 현황</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" name="mAttdFrm" id="mAttdFrm" method="post" action="/spring/searchMnthAttdStat">	
							<table class="table table-bordered">
								<tr align="center">
									<td>근무년월</td>
									<td align="left">
										<!-- 달력 : 근무년월 -->										
										<div class="input-group date" id="workYyMm">
											<input type="text" class="form-control" id="mnthAttdIpt" name="workYyMm"/>
												<span class="input-group-addon">
													<span class="fa fa-calendar" />
												</span>
										</div>
									</td>
									<td>부서</td>  
									<td align="center">
										<select>
										<option value="">전체</option>
										<option value="" selected>(주)인크레파스</option>
										<option value="">인사부</option>
										<option value="">영업부</option>
										<option value="">성실부</option>
										</select>
									</td>
									<td>사원번호</td>
									<td align="left">
										<!-- 사원번호 입력 -->
										<div class="input-group">
											<input type="text" class="form-control" id="empEmno" name="empEmno" placeholder="사번입력  / 검색버튼" >
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-search" aria-hidden="true" data-toggle="modal" data-target="#empModal" onClick="empListModal('${pageContext.request.contextPath}/mAttdSelectEmpList.ajax','empFrm')"></span> <!-- 검색 아이콘 -->
											</span>	
										</div>
										<!-- 검색버튼 -->
										<input type="button" class="btn btn-danger btn-xs" style="float:right;"name="search" value="검색" onClick="mnthAttdCal('/spring/searchMnthAttdStat', 'mAttdFrm')">
									</td>
								</tr>
							</table>
						</form>
					</div>
					<div class="panel-body">
					<div class="subtitle">
						<h4 class="fleft">◈ 근태현황 <h4>
							<div align="right">
								<h5>
									<font color="red">■</font> : 출근&nbsp;&nbsp;&nbsp;&nbsp;
									<font color="blue">■</font> : 지각&nbsp;&nbsp;&nbsp;&nbsp;
									<font color="darkgray">■</font> : 조퇴&nbsp;&nbsp;&nbsp;&nbsp;
									<font color="magenta">■</font> : 휴가&nbsp;&nbsp;&nbsp;&nbsp;
									<font color="green">■</font> : 출장
								</h5>
							</div>	
					</div>
						<table border="1" style="table-layout:fixed" class="table table-bordered" id="empInfo">
							<thead>
								<tr align="center">
									<td>사원번호</td>
									<td>성명</td>
									<td>부서</td>
									<td>직급</td>
								</tr>
							</thead>
							<tbody id="dataTable">
								<tr align="center">
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
								</tr>	
							</tbody>
						</table>
						<table border="1" width="100" style="table-layout:fixed" class="table table-bordered" id="mnthAttdCalInfo">
							<tbody id="mnthAttdCalTbody">
								<tr align="center">
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
								</tr>
								<tr align="center">
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
								</tr>
								<tr align="center" id="attdNumID">
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
								</tr>
								<tr align="center" id="attdNumID">
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
									<td> 　　　　 </td>
								</tr>
							</tbody>
						</table>
					</div>
				</div><!-- "panel" -->
			</div>
		</div>
	</div>

	<!-- 사원번호 선택 Modal View -->
	<div id="empModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal 내용 -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button><!-- 닫기버튼 -->
					<div class="modal-title" align="center"><h2> 사원 정보 조회 </h2></div>
				</div>
				<!-- 검색 -->
				<div class="modal-body">
					<div class="search_wrap" style="padding: 0px 10px 20px 15px; ">
						<form class="form-inline" id="empFrm">
							검색어 &nbsp;
							<input type="text" class="form-control" name="keyword"> &nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="retrChk">
								퇴직자포함
							<input type="hidden" name="retrDelYn" id="retrDelYn" ><!-- 퇴직자 포함 히든 -->
							<input type="button" class="btn btn-danger btn-xs" style="float:right;" name="attendance" onClick="empListModal('${pageContext.request.contextPath}/mAttdSelectEmpList.ajax','empFrm')" value="검색">
						</form>
					</div>
				 </div>
					
				 <div class="list_wrap">
					<table class="table tablesorter table-bordered" id="empModalTable">
						<thead style="display:table;width:100%;table-layout:fixed;">
							<tr>
								<th class="sorter-false"></th>
								<th>구분</th>
								<th>사원번호</th>
								<th>이름</th>
								<th>부서</th>
								<th>직급</th>
							</tr>
							<input type="hidden" name="hiddenEmpEmno" id="hiddenEmpEmno"> <!-- 사원번호 Hidden -->
							<input type="hidden" name="hiddenEmpName" id="hiddenEmpName"> <!-- 이름 Hidden -->
							<input type="hidden" name="hiddenDeptName" id="hiddenDeptName"> <!-- 부서 Hidden -->
							<input type="hidden" name="hiddenRankName" id="hiddenRankName"> <!-- 직급 Hidden -->
						</thead>
						<tbody id="empModalTbody" style="display:block;height:200px;overflow:auto;"><!-- overflow:auto 스크롤 사용시 필요-->
							
							
							
							
							
						</tbody>
					</table>
				 <div class="modal-footer">
				 	<button type="button" class="btn btn-danger" data-dismiss="modal" onClick="empEmnoClick()">선택</button>
				 </div>
				 </div>
			</div>
		</div>
	</div>
	<p>
</body>
</html>

