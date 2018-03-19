<!-- 
	휴가관리 메인 대시보드
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가관리</title>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/pie.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script>
	
	//document ready
	$(function(){
		$('input[name=empEmno]').val('0905000411'); //강병욱으로 테스트
		$('input[name=baseMonth]').val(moment().format('YYYYMM')); //YYYYMM
		empVacInfo(); //사원휴가정보
		monthlyVacChart(); //월별 휴가사용개수 그래프 + ajax
		vacTodayEmpList(); //오늘의 휴가자 ajax
		tablesorterFunc(); //테이블 정렬
		thisMonthVacChart(); //이번달 휴가 사용 그래프 + ajax
	});
	
	function empVacInfo(){
		paging.ajaxFormSubmit("empVacInfo.ajax", "frm", function(rslt){
			console.log("결과데이터:"+JSON.stringify(rslt));

	 		$.each(rslt.empVacInfo, function(k, v) {
	 			$('#emreVacUd').html(v.emreVacUd); //연차일수
	 			$('#emrePvacUd').html(v.emrePvacUd); //사용일수
	 			$('#emreRemndrUd').html(v.emreRemndrUd); //잔여일수
	 			$('#emreUpvacUd').html(v.emreUpvacUd); //기타휴가사용일수
	 		});
		});
	}
	
	
	//월별 휴가사용개수 그래프 ajax
	function monthlyVacChart(){
		paging.ajaxFormSubmit("monthlyVacChart.ajax", "frm", function(rslt){
			console.log("결과데이터:"+JSON.stringify(rslt.monthlyVacChart));
			
			AmCharts.makeChart("Monthlychartdiv",{
				"type": "serial",
				"categoryField": "date",
				"dataDateFormat": "YYYYMM",
				"plotAreaBorderColor": "#666666",
				"borderColor": "#666666",
				"color": "#666666", //글씨색
				"theme": "light",
				"categoryAxis": {
					"minPeriod": "MM",
					"parseDates": true
				},
				"chartCursor": {
					"enabled": true,
					"categoryBalloonDateFormat": "MMM YYYY",
					"cursorColor": "#666666"
				},
//  				"chartScrollbar": {
//  					"enabled": true
//  				},
				"trendLines": [],
				"graphs": [
					{
						"fillAlphas": 0.7,
						"id": "allData",
						"lineAlpha": 0,
						"title": "전체 사원의 평균 연차 사용일",
						"valueField": "allData"
					},
					{
						"fillAlphas": 0.7,
						"id": "userData",
						"lineAlpha": 0,
						"title": "나의 연차 사용일",
						"valueField": "userData"
					}
				],
				"guides": [],
				"valueAxes": [
					{
						"dashLength": 2,
						"totalTextColor": "#666666",
						"color": "#666666",
						"gridColor": "#666666"
//  						"id": "ValueAxis-1",
//  						"title": "Axis title"
					}
				],
				"allLabels": [],
				"balloon": {},
				"legend": {
					"enabled": true,
					"align": "center"
				},
//  				"titles": [
//  					{
//  						"id": "Title-1",
//  						"size": 15,
//  						"text": "Chart Title"
//  					}
//  				],
				"dataProvider": JSON.parse(JSON.stringify(rslt.monthlyVacChart))
			});
		});
	}
		
	
	//테이블 정렬
	function tablesorterFunc(){
		$("#vacTable").tablesorter();
		$("#vacTable").tablesorter({sortList: [[0,0], [1,0]]});
	}
	
	//오늘의 휴가자
	function vacTodayEmpList(){
		paging.ajaxSubmit("vacTodayEmpList.ajax", "", function(rslt){
			console.log("결과데이터:"+JSON.stringify(rslt));
			
// 			$('#vacTable').children('thead').css('width','calc(100% - 1.1em)'); //테이블 스크롤 css

			if(rslt == null || rslt.success == "N"){
				$('#vacTable').children('tbody').append( //리스트가 없을 경우 : 조회된 데이터가 없습니다
	 				"<div class='text-center'><br><br><br>휴가자가 없습니다.</div>"
	 			);
			}else if(rslt.success == "Y"){
	 			$.each(rslt.vacTodayEmpList, function(k, v) {
	 				$('#vacTable').children('tbody').append(
						"<tr style='display:table;width:100%;table-layout:fixed;cursor:pointer;'>"+
			 				"<td>"+ v.empEmno +"</td>"+ //사원번호
			 				"<td>"+ v.empName +"</td>"+ //성명
			 				"<td>"+ v.deptName +"</td>"+ //부서
			 				"<td>"+ v.vastTerm +"</td>"+ //휴가기간
						"</tr>"
					);
	 				
	 				//연차 primary 반차 success 기타휴가 warning
	 				if(v.vastC == '연차'){ //연차
	 					$('#vacTable > tbody > tr:last').append(
	 						"<td><span class='label label-primary'>"+v.vastC+"</span></td>"
	 					);
	 				}else if(v.vastC == '반차'){ //반차
	 					$('#vacTable > tbody > tr:last').append(
		 					"<td><span class='label label-success'>"+v.vastC+"</span></td>"
		 				);
	 				}else if(v.vastC == '기타휴가'){ //기타휴가
	 					$('#vacTable > tbody > tr:last').append(
		 					"<td><span class='label label-warning'>"+v.vastC+"</span></td>"
		 				);
	 				}
	 			});
			}
			$('#vacTable tr').children().addClass('text-center'); //테이블 내용 가운데 정렬
		});
	}
	
	//나의 이번달 사용 휴가 내역
	function thisMonthVacChart(){
		paging.ajaxFormSubmit("thisMonthVacChart.ajax", "frm", function(rslt){
			console.log("결과데이터:"+JSON.stringify(rslt.thisMonthVacChart));
			
			AmCharts.makeChart("thisMonthchartdiv",{
				"type": "pie",
				"balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
				"labelRadius": 10,
				"marginBottom": 0,
				"marginTop": 0,
				"fontSize": 15,
				"labelColorField": "#666666",
				"labelTickColor": "#666666",
				"titleField": "vastType",
				"valueField": "vastVacUd",
				"borderColor": "#666666",
				"color": "#666666",
				"percentPrecision": 0,
				"theme": "light",
				"allLabels": [],
				"balloon": {},
				"legend": { //범주
					"enabled": true,
					"align": "center",
					"bottom": -1,
					"marginBottom": -2,
					"markerLabelGap": 3,
					"markerType": "circle"
				},
				"titles": [],
				"dataProvider": 
// 					[
// 						{
// 							"category": "category 1",
// 							"column-1": 8
// 						},
// 						{
// 							"category": "category 2",
// 							"column-1": 6
// 						},
// 						{
// 							"category": "category 3",
// 							"column-1": 2
// 						}
// 					]
				JSON.parse(JSON.stringify(rslt.thisMonthVacChart))
			}); //amcharts
		});
	}
	
</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
				<div class="panel panel-headline"> <!-- START box1 -->
					<div class="panel-heading">
<!-- 						<h3 class="panel-title">Weekly Overview</h3> -->
<!-- 						<p class="panel-subtitle">Period: Oct 14, 2016 - Oct 21, 2016</p> -->
					</div>
					<div class="panel-body">
						<form id="frm">
							<input type="hidden" name="empEmno">
							<input type="hidden" name="baseMonth">
						</form>
						<div class="row">
							<div class="col-md-3">
								<div class="metric">
									<span class="icon"><i class="fa fa-battery-full" style="position:relative;top:15px;"></i></span>
									<p>
										<span class="number" id="emreVacUd">1,252</span>
										<span class="title">연차일수</span>
									</p>
								</div>
							</div>
							<div class="col-md-3">
								<div class="metric">
									<span class="icon"><i class="fa fa-battery-three-quarters" style="position:relative;top:15px;"></i></span>
									<p>
										<span class="number" id="emrePvacUd">203</span>
										<span class="title">사용일수</span>
									</p>
								</div>
							</div>
							<div class="col-md-3">
								<div class="metric">
									<span class="icon"><i class="fa fa-battery-quarter" style="position:relative;top:15px;"></i></span>
									<p>
										<span class="number" id="emreRemndrUd">274,678</span>
										<span class="title">잔여일수</span>
									</p>
								</div>
							</div>
							<div class="col-md-3">
								<div class="metric">
									<span class="icon"><i class="fa fa-bed" style="position:relative;top:15px;"></i></span>
									<p>
										<span class="number" id="emreUpvacUd">35%</span>
										<span class="title">기타휴가사용일수</span><!-- 연차가 아닌 휴가 사용 -->
									</p>
								</div>
							</div>
						</div>
						<div class="row">
<!-- 							<div class="col-md-9">그래프  -->
								<div id="Monthlychartdiv" style="width: 100%; height: 350px; background-color: #FFFFFF;" ></div>	
<!-- 							</div> -->
<!-- 							<div class="col-md-3"> -->
<!-- 								<div class="weekly-summary text-right"> -->
<!-- 									<span class="number">2,315</span> <span class="percentage"><i class="fa fa-caret-up text-success"></i> 12%</span> -->
<!-- 									<span class="info-label">Total Sales</span> -->
<!-- 								</div> -->
<!-- 								<div class="weekly-summary text-right"> -->
<!-- 									<span class="number">$5,758</span> <span class="percentage"><i class="fa fa-caret-up text-success"></i> 23%</span> -->
<!-- 									<span class="info-label">Monthly Income</span> -->
<!-- 								</div> -->
<!-- 								<div class="weekly-summary text-right"> -->
<!-- 									<span class="number">$65,938</span> <span class="percentage"><i class="fa fa-caret-down text-danger"></i> 8%</span> -->
<!-- 									<span class="info-label">Total Income</span> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div>
				</div><!-- END box1 -->
				<div class="row">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">오늘의 휴가자</h3>
							</div>
							<div class="panel-body no-padding">
								<table class="table table-striped tablesorter" id="vacTable">
									<thead style="display:table;width:100%;table-layout:fixed;">
										<tr>
											<th>사원번호</th>
											<th>성명</th>
											<th>부서</th>
											<th>휴가기간</th>
											<th>휴가구분</th>
										</tr>
									</thead>
									<tbody id="vacTbody" style="display:block;height:350px;overflow:auto;">
									</tbody>
								</table>
							</div>
						</div>
					</div><!-- END box2 -->
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">내가 이번달에 사용한 휴가는?</h3>
							</div>
							<div class="panel-body">
								<div id="thisMonthchartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
							</div>
						</div>
					</div><!-- END box3 -->
				</div><!-- End row(box2,box3) -->
			</div><!-- END container fluid -->
		</div><!-- END main content -->
	</div><!-- END main -->
</body>
</html>