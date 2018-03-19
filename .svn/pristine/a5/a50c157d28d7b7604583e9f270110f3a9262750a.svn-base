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

		console.log("ajaxxxxxxxxxxxx: " + JSON.stringify(rslt));

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
		       		console.log("RSLT"+rslt.dbDate);
					$("#viewModal").find("form[id='viewForm']").find("input[id='startDate']").val(rslt.dbDate);
					$("#viewModal").find("form[id='viewForm']").find("input[id='holiMemo']").val(rslt.memo);
					$("#viewModal").find("form[id='viewForm']").find("select[name='holiselectbox']").val(rslt.event).prop("selected",true);
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
	$("#insertBtn").click(function () {
		//alert("저장");
		if (confirm("저장하시겠습니까?") == true) {
			$("#insertForm").attr("action", "/spring/calendarInsert.do").submit();
		} else {
			return false;
		}
	});
	//nav tab
	$('#fullcalrendar_vacMng a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
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
</script>