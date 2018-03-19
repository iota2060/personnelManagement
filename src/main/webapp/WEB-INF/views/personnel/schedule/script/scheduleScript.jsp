<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var emno = $("#empEmno").val();
	var deptCode = ${empInfo.deptCode};
	
	console.log("emno : " + emno);
	console.log("deptCode : " + deptCode);
	
	paging.ajaxSubmit("individuaSchedule.do",{"emno":emno},function(rslt){
		console.log("결과데이터(개인) : " + JSON.stringify(rslt));
		
		calendarView(rslt); //캘린더함수호출
	});//페이지 로딩시 사용자의 db 일정정보를 가져온다 


	function calendarView(data){ //캘린더함수
		$('#calendar').fullCalendar({
			header : {
				left : '',
				center : 'title',
				right : 'today prev,next'
			},
			lang : "ko", //한글패치
			defaultDate : new Date(), //초기날짜
			editable : false, //드래그사용여부
			googleCalendarApiKey:"AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE", //구글api키값
			eventSources : [{
				//공휴일
				googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",//구글캘린더 주소
				className : "koHolidays",
				color : "#FFFFFF",
				textColor : "#FF0000"
			},
				data
			],
			//events : data,
			eventClick : function(calEvent, jsEvent, view){
				/*alert('Event: ' + calEvent.title);
		        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
		        alert('View: ' + view.name);*/
		        //alert(calEvent.id);
		        
		        var start = JSON.stringify(calEvent.start);
		        
		        var end = JSON.stringify(calEvent.end);
		        
		        var url = "";
		        
		        if(calEvent.url != null){
		        	return false;
		        }//구글에서 가져온 공휴일 이벤트 막기
		        
		        if(calEvent.id == 10){ //개인일정
		        	url = "individuaDetail.do";
		        	$("#viewModal").find("form[id='viewForm']").find("input[name='departmentCheck']").prop("checked",false);
		        }else{					 //회사일정
		        	url = "departmentDetail.do";
		        	$("#viewModal").find("form[id='viewForm']").find("input[name='departmentCheck']").prop("checked",true);
		        }
		        
		        var obj = {};
				obj.emno = emno;
				obj.start = start;
				obj.end = end;
		        
		       	paging.ajaxSubmit(url,obj,function(rslt){
		        	console.log("결과데이터 : " + JSON.stringify(rslt));
		        	
		        	var seq = 0; 				//일련번호
	        		var emno = "";				//사원번호
	        		var title = "";				//제목
	        		var content = "";			//내용	
	        		var rsltStartDate = "";		//dateformat 시작날짜
	        		var rsltEndDate = "";		//dateformat 종료날짜	
	        		var startDate = "";			//시작날짜	
	        		var startTime = "";			//시작시간
	        		var endDate = "";			//종료날짜
	        		var endTime = "";			//종료시간
		        	var deptCode = "";			//부서코드
		        	
		        	$.each(rslt,function(index){
		        		if(url == "individuaDetail.do"){ //개인일정일시
		        			seq = rslt[index].inpnSeq;
		        			emno = rslt[index].empEmno;
		        			title = rslt[index].inpnTit;
		        			content = rslt[index].inpnCntn;
		        			rsltStartDate = rslt[index].inpnStrtDate;
		        			rsltEndDate = rslt[index].inpnEndDate;
		        			startDate = rsltStartDate.substring(0,10);
		        			startTime = rsltStartDate.substring(11);
		        			endDate = rsltEndDate.substring(0,10);
		        			endTime = rsltEndDate.substring(11);
		        		}else { //회사일정일시
		        			seq = rslt[index].depnSeq;
		        			deptCode = rslt[index].deptCode;
		        			emno = rslt[index].empEmno;
		        			title = rslt[index].depnTit;
		        			content = rslt[index].depnCntn;
		        			rsltStartDate = rslt[index].depnStrtDate;
		        			rsltEndDate = rslt[index].depnEndDate;
		        			startDate = rsltStartDate.substring(0,10);
		        			startTime = rsltStartDate.substring(11);
		        			endDate = rsltEndDate.substring(0,10);
		        			endTime = rsltEndDate.substring(11);
		        			
		        			$("#viewModal").find("form[id='viewForm']").find("input[name='deptCode']").val(deptCode);
		        		}
		        		
		        		$("#viewModal").find("form[id='viewForm']").find("input[name='seq']").val(seq);
		        		$("#viewModal").find("form[id='viewForm']").find("input[name='emno']").val(emno);
		        		$("#viewModal").find("form[id='viewForm']").find("input[name='title']").val(title);
		        		$("#viewModal").find("form[id='viewForm']").find("textarea[name='content']").text(content);
		        		$("#viewModal").find("form[id='viewForm']").find("input[name='startDate']").val(startDate);
		        		$("#viewModal").find("form[id='viewForm']").find("input[name='startTime']").val(startTime);
		        		$("#viewModal").find("form[id='viewForm']").find("input[name='endDate']").val(endDate);
		        		$("#viewModal").find("form[id='viewForm']").find("input[name='endTime']").val(endTime);
		        	});
		        	
		        	//종료날짜
		        	$("[name='endDate']").datetimepicker({ 
		        		viewMode : 'days',
		        		format : 'YYYY-MM-DD'
		        	});
		        }); 	
		        
		        $(this).attr("data-toggle","modal");
		        $(this).attr("data-target","#viewModal");
		        
			},//일정상세보기
			/*eventMouseover : function(event, jsEvent, view){
				alert();
			},//일정삭제 */
			dayClick: function(date, jsEvent, view) {
		        /* alert('Clicked on: ' + date.format());
		        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
		        alert('Current view: ' + view.name); */
				
		        $("table tr td.fc-day,table tr td.fc-day-top").attr("data-toggle","modal");
				$("table tr td.fc-day,table tr td.fc-day-top").attr("data-target","#insertModal"); //등록모달창띄우기
				
				//insert 달력
				$("[name='startDate']").val(date.format()); //시작날짜
		    }//일정등록
		});
		
		mouseMove(); //마우스이벤트
		
		//왼쪽버튼 클릭시 
		$("button.fc-prev-button").click(function(){
			mouseMove();
		});
		
		//왼쪽버튼 클릭시 
		$("button.fc-next-button").click(function(){
			mouseMove();
		});
		
		//today버튼 클릭시 
		$("button.fc-today-button").click(function(){
			mouseMove();
		});
		
	}//calendarView
	
	function mouseMove(){
		$("table tr td.fc-day,table tr td.fc-day-top").on('mouseover', function() {
			color = $(this).css('background-color');
			$(this).css({
				'background-color' : '#bbe1fd',
				'opacity' : '0.3'
			});
		});
		$("table tr td.fc-day,table tr td.fc-day-top").on('mouseout', function() {
			$(this).css({
				'background-color' : color,
				'opacity' : '1'
			});
		});//마우스 이벤트
	}
	
	//종료날짜
	$("[name='endDate']").datetimepicker({ 
		viewMode : 'days',
		format : 'YYYY-MM-DD'
	});
	//insert 시간선택
	$("[name='startTime']").timepicker({
		step: 30,            //시간간격 : 30분
		timeFormat: "H:i"    //시간:분 으로표시
	});
	$("[name='endTime']").timepicker({
		step: 30,            //시간간격 : 30분
		timeFormat: "H:i"    //시간:분 으로표시
	});
	
	//일정등록 저장버튼클릭시
	$("#insertBtn").click(function(){
		var url = "/spring/scheduleInsert.do";
		//var frim = $("#insertForm").attr("id");
		
		if(confirm("저장하시겠습니까?") == true){
			paging.ajaxFormSubmit(url,"insertForm", function(result){
				console.log("result : " + result);
				if(result > 0){
					alert("저장되었습니다");
					location.href="/spring/scheduleView.do";
				}else{
					alert("저장실패. 다시 입력해주세요");
				}
			});
		}else{
			return false;
		}
	});
	
	//일정상세보기 삭제버튼 클릭시
	$("#deleteBtn").click(function(){
		//var frim = $("#viewForm").attr("id");
		var url = "";
		
		if($("#viewModal").find("form[id='viewForm']").find("input[name='departmentCheck']").prop("checked") == false){ //개인일정
			url = "/spring/individuaDelete.do";
		}else {
			url = "/spring/departmentDelete.do";
		}
		
		if(confirm("삭제하시겠습니까?") == true){
			paging.ajaxFormSubmit(url,"viewForm", function(result){
				console.log("result : " + result);
				if(result > 0){
					alert("삭제되었습니다");
					location.href="/spring/scheduleView.do";
				}else{
					alert("삭제실패. 다시 실행해주세요");
				}
			});
		}
	});
	
	//일정상세보기 수정버튼 클릭시
	$("#updateBtn").click(function(){
		var url = "";
		
		if($("#viewModal").find("form[id='viewForm']").find("input[name='departmentCheck']").prop("checked") == false){ //개인일정
			url = "/spring/individuaUpdate.do";
		}else {
			url = "/spring/departmentUpdate.do";
		}
			
		if(confirm("수정하시겠습니까?") == true){
			paging.ajaxFormSubmit(url,"viewForm",function(result){
				console.log("result : " + result);
				if(result > 0){
					alert("수정되었습니다");
					location.href="/spring/scheduleView.do";
				}else{
					alert("수정실패. 다시 입력해주세요");
				}
			});
		}
	});
	
	//회사일정 체크시 부서일정보기
	$("#department").click(function(){
		if($(this).prop( "checked" ) == true){ //회사일정 체크시
			paging.ajaxSubmit("departmentSchedule.do",{"emno":emno,"deptCode":deptCode},function(rslt){
				console.log("결과데이터(회사) : " + JSON.stringify(rslt));
				$("#calendar").fullCalendar("addEventSource",rslt);
			});//회사일정db 가져온다
		}else{ //회사일정 체크아닐시
			$("#calendar").fullCalendar("removeEvents",20);
		}
	});
	
</script>