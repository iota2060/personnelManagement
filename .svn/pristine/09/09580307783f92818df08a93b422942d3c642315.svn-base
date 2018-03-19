<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- script -->
<script>
	$(function () {
		$('#crtDate').datetimepicker({ //휴가 등록일 달력
			viewMode: 'days',
			format: 'YYYY-MM-DD'
		});
	});

	paging.ajaxSubmit("calendarList.exc","",function(rslt){
		$("input[name='startDate']").val($('input[id="aaa"]').val()); //시작날짜

		//console.log("ajaxxxxxxxxxxxx: " + JSON.stringify(rslt));

		calendarView(rslt); //캘린더함수호출
	});//페이지 로딩시 사용자의 db 일정정보를 가져온다

	function calendarView(data){
		$('#calendar').fullCalendar({
			header: {
				left: '',
				center: 'title',
				right: 'today prev,next'
			},
			lang: "ko",
			defaultDate: new Date(),
			editable: false, //draging
			googleCalendarApiKey: "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE",
			eventSources: [data],

			eventClick: function (calEvent, jsEvent, view) {

		        var start = JSON.stringify(calEvent.start);

		        	/*alert('Event: ' + start);
				 alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
				 alert('View: ' + view.name); */
				if (calEvent.url != null) {
					return false; //google event block.
				}
				 
			    var obj = {};
				obj.start = start;
				paging.ajaxSubmit('calendarListDB',obj,function(rslt){
		       		console.log("결과데이터 : " + JSON.stringify(rslt));
		       		console.log("RSLT========"+rslt.dbDate);
					$("#viewModal").find("form[id='viewForm']").find("input[id='startDate']").val(rslt.dbDate);
					$("#viewModal").find("form[id='viewForm']").find("input[name='holiMemo']").val(rslt.memo);
					$("#viewModal").find("form[id='viewForm']").find("select[name='selectBox']").val(rslt.event).prop("selected",true);
					//alert(JSON.stringify(rslt.event));
					//alert($("#viewModal").find("form[id='viewForm']").find("input[name='holiselectbox']").val(rslt.event));
				});
				/* alert(calEvent.title); */
				$(this).attr("data-toggle", "modal");
				$(this).attr("data-target", "#viewModal");

			}, //일정상세보기
			eventMouseover: function (event, jsEvent, view) {
				//alert("mouseover");
			}, //일정삭제
			dayClick: function (date, jsEvent, view) {

				/* alert('Clicked on: ' + date.format());
				alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
				alert('Current view: ' + view.name); */

				$("table tr td.fc-day,table tr td.fc-day-top").attr("data-toggle", "modal");
				$("table tr td.fc-day,table tr td.fc-day-top").attr("data-target", "#insertModal");

				//insert 달력
				$("[name='startDate']").val(date.format()); //시작날짜
				$("[id=aaa]").val(date.format()); //시작날짜
			} //일정등록
		});

		mouseMove(); //마우스이벤트
		function mouseMove() {
			$("table tr td.fc-day,table tr td.fc-day-top").on('mouseover', function () {
				color = $(this).css('background-color');
				$(this).css({
					'background-color': '#bbe1fd',
					'opacity': '0.3'
					});
			});
			$("table tr td.fc-day,table tr td.fc-day-top").on('mouseout', function () {
				$(this).css({
					'background-color': color,
					'opacity': '0.9'
					});
			}); //마우스 이벤트
		}
		//왼쪽버튼 클릭시
		$("button.fc-prev-button").click(function () {
			mouseMove();
		});

		//왼쪽버튼 클릭시
		$("button.fc-next-button").click(function () {
			mouseMove();
		});

		//today버튼 클릭시
		$("button.fc-today-button").click(function () {
			mouseMove();
		});
	}

	//일정등록 저장버튼클릭시
	$("#insertBtn").click(function(){
		var url = "/spring/calenderUpdate.do";
		
		if(confirm("저장하시겠습니까?") == true){
			paging.ajaxFormSubmit(url,"insertForm", function(result){
				console.log("result : " + result);
				if(result > 0){
					alert("저장되었습니다");
					location.href="/spring/holiDyMng";
				}else{
					alert("저장실패. 다시 입력해주세요");
				}
			});
		}else{
			return false;
		}
	});
	//일정 보기 수정 버튼클릭시
	$("#updateBtn").click(function(){
		var url = "/spring/calenderUpdate.do";
		
		if(confirm("수정하시겠습니까?") == true){
			paging.ajaxFormSubmit(url,"viewForm", function(result){
				console.log("result : " + result);
				if(result > 0){
					alert("수정되었습니다");
					location.href="/spring/holiDyMng";
				}else{
					alert("수정 실패. 다시 입력해주세요");
				}
			});
		}else{
			return false;
		}
	});
	//nav tab
	$('#fullcalrendar_vacMng a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
	});
	
	$('#fullcalrendar_vacMng .tableCalendar').click(function(){
		secondTbodyList();
	});

	//day 클릭
	$('#cale	ndar').fullCalendar({
	    dayClick: function(date, jsEvent, view) {
	        alert('Clicked on: ' + date.format());
	        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
	        alert('Current view: ' + view.name);

	        // change the day's background color just for fun
	        $(this).css('background-color', 'red');

	    }
	});
	//xbnt 클릭시 내용 비우기
	$('[name=xbtn]').click(function(){
		$("input[name='holiMemo']").val("");
	});
	
	
	//second tab calendar List
	/* 표 리스트 불러오기 start */
 	function secondTbodyList(){ //휴가 날자,휴가구분,메모 리스트 출력
		
 		var today = new Date();
 		var dd = today.getDate();
 		var mm = today.getMonth()+1; //January is 0!
 		var yyyy = today.getFullYear();

 		if(dd<10) {
 		    dd='0'+dd
 		} 

 		if(mm<10) {
 		    mm='0'+mm
 		} 

 		today = yyyy+'-'+mm+'-'+dd;
 		console.log("찍히니4?");
 		console.log(today);
 		
 		var yearEndDay = yyyy + "-12-31";
 		
 		console.log(yearEndDay);
 		
 		var data = {"startEndDay" : today, yearEndDay};
 		
 		console.log("44");
		
 		$('#tbody').empty(); //이전 리스트 삭제
 		
		paging.ajaxSubmit('SecondTabCalendarTableList', data, function(rslt){
//  			console.log("second tab calendar List AjaxFormSubmit -> callback");
 			console.log("결과데이터:"+JSON.stringify(rslt));

 			$('#calendarTableOption').children('thead').css('width','calc(100% - 1em)'); //테이블 스크롤때문에 css
 			
			for(var i = 0 ; i < rslt.length ; i++){
				if(rslt == null){
					$('#tbody').append( //리스트가 없을 경우 : 조회된 데이터가 없습니다
	  	 				"<div class='text-center'><br><br><br><br>조회할 데이터가 없습니다.</div>"
	  	 			);
				}else{
					var hangul;
					
					
					if(rslt[i].event == 'regualWork'){
						hangul = "정상근무";
					}else if(rslt[i].event == 'unpaidDayoff'){
						hangul = "무급휴무일";
					}else if(rslt[i].event == 'unpaidHoli'){
						hangul = "무급휴무";
					}else if(rslt[i].event == 'paidHoli'){
						hangul = "유급휴일";
					}
					
					$('#tbody').append(
 	 					"<tr style='display:table;width:100%;table-layout:fixed;'>"+
								"<td style='width:6%;' >"+
							"<label class='fancy-checkbox-inline'>"+
								"<input type='checkbox' name='chk'>"+ //checkbox
								"<span></span>"+
							"</label>"+
						"</td>"+
						"<td >"+ rslt[i].dbDate +"</td>"+ 
						//"<td >"+ rslt[i].event +"</td>"+ 
						"<td >"+ hangul +"</td>"+ 
						"<td >"+ rslt[i].memo +"</td>"+ 
					"</tr>"
					);
				}
			}
 			
			$('.table tr').children().addClass('text-center'); //테이블 내용 가운데정렬

//  			$('#calendarTableOption').children('thead').css('width','calc(100% - 1em)'); //테이블 스크롤때문에 css 
 			
//  			if(rslt == null){
//  				$('#tbody').append( //리스트가 없을 경우 : 조회된 데이터가 없습니다
//  	 				"<div class='text-center'><br><br><br><br>조회할 데이터가 없습니다.</div>"
//  	 			);
//  			}else if(rslt.success == "Y"){
//  	 			$.each(rslt.SecondTabCalendarTableList, function(k, v) {
// 					$('#tbody').append(
//  	 					"<tr style='display:table;width:100%;table-layout:fixed;'>"+
// 								"<td style='width:6%;' >"+
// 							"<label class='fancy-checkbox-inline'>"+
// 								"<input type='checkbox' id='chk'>"+ //checkbox
// 								"<span></span>"+
// 							"</label>"+
// 						"</td>"+
// 						"<td >"+ v.dbDate +"</td>"+ 
// 						"<td >"+ v.event +"</td>"+ 
// 						"<td >"+ v.memo +"</td>"+ 
// 					"</tr>"
// 					);
//  	 			});
//  			}
//  			$('.table tr').children().addClass('text-center'); //테이블 내용 가운데정렬

		});
 	}
</script>