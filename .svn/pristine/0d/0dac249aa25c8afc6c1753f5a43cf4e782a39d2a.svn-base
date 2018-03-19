<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script src="/spring/resources/common/js/JMap.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		console.log($('#weekRosterTable thead>tr:eq(1)>th:eq(0)').text());
		var week = $('input[name=yearMonth]').val();
		
		var thisWeek = weekCalculation(week);
		
		$("#weekInput").html("주간근무표("+ thisWeek[0] + "~" + thisWeek[6] + ")");
		
		dbDataInputOutput(thisWeek);
	});
	
	var eventsMap = new JMap();
	
	function dateSetting(weekRosterDateString){
		var year = weekRosterDateString.substring(0,4);
		var month = weekRosterDateString.substring(5,7);
		var day = weekRosterDateString.substring(8,10);
		
		var thisWeek = new Date(year, month-1, day);
		
		console.log("new day : " + thisWeek.getDate());
		
		return thisWeek;
	}
	
	function dateAddSetting(weekRosterDateString, i){
		var year = weekRosterDateString.substring(0,4);
		var month = weekRosterDateString.substring(5,7);
		var day = weekRosterDateString.substring(8,10);
		
		var thisWeek = new Date(year, month-1, day);
		
		thisWeek.setDate(thisWeek.getDate() + i);
		
		var yearMonth = thisWeek.getFullYear() + "-" + ((thisWeek.getMonth()+1)<10 ? '0' + (thisWeek.getMonth()+1) : (thisWeek.getMonth()+1)) + '-' +
        (thisWeek.getDate()<10 ? '0'+thisWeek.getDate() : thisWeek.getDate());
		
		return yearMonth;
	}
	
	function weekCalculation(week){
// 		var weekRosterDateString = week;
		
// 		var year = weekRosterDateString.substring(0,4);
// 		var month = weekRosterDateString.substring(5,7);
// 		var day = weekRosterDateString.substring(8,10);
		
// 		var thisWeek = new Date(year, month-1, day);
		var thisWeek = dateSetting(week);
		var theYear = thisWeek.getFullYear();
		var theMonth = thisWeek.getMonth();
		var theDate  = thisWeek.getDate();
		var theDayOfWeek = thisWeek.getDay();
		
		var thisWeek = [];
		
		for(var i=0; i<7; i++) {
			var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
			var yyyy = resultDay.getFullYear();
			var mm = Number(resultDay.getMonth()) + 1;
			var dd = resultDay.getDate();
			
			mm = String(mm).length === 1 ? '0' + mm : mm;
			dd = String(dd).length === 1 ? '0' + dd : dd;
			
			thisWeek[i] = yyyy + '-' + mm + '-' + dd;
			
			$('#weekRosterTable thead>tr:eq(1)>th').eq(i).text(dd);
			$('#weekRosterTable thead>tr:eq(1)>th').eq(i).attr("name", (mm+dd));
// 			console.log($('#weekRosterTable thead>tr:eq(1)>th').eq(i).attr("name"));
		}
		
		console.log(thisWeek);
		
		return thisWeek;
	}
	
	function dbDataInputOutput(firstDay){
// 		var obj = new Object();
// 		var dataArray = new Array();
		
		var startFirstDay = firstDay[0];
		var startLastDay = firstDay[6];
		var endFirstDay = dateAddSetting(firstDay[0], 1);
		var endLastDay = dateAddSetting(firstDay[6], 1);
		var eventsList;
		
// 		dataArray.push(obj);
		
		var data = {"startFirstDay" : startFirstDay, startLastDay, endFirstDay, endLastDay};
		console.log(JSON.stringify(data));
		
		var eventsObj = new Object();
		var eventsArray = new Array();
		
		//db에 있는 데이터(options.events)를 받아와서  jsp페이지에있는 근무표에 자신이 몇번 근무인지 알수있게 넣어주는 곳.
		//비동기를 동기로 바꿔서 순서대로 처리할수있게해줌.
		//eventsObj에 options.events에 들어가는 데이터들을 다 넣고
		//eventsArray 배열에 오브젝트를 넣어줌.
		paging.ajaxSubmit("/spring/holidayRosterEventsList2.ajax", data, function(result){
			if(result != null){
				for(var i = 0 ; i < result.length ; i++){
					eventsObj.start = result[i].start;
					eventsObj.end = result[i].end;
					eventsObj.text = result[i].text;
					eventsObj.id = result[i].id;
					eventsObj.resource = result[i].resource;
					
					eventsArray.push(eventsObj);
					eventsObj = {};
				}
				console.log(eventsArray);
			}
// 			options.events = eventsArray;
			eventsList = eventsArray;
    	}, false);
		
		var eventsLength = eventsList.length;
		
// 		$('#weekRosterTable tbody>tr:eq(0)>th').eq(1).text("ss");
		
// 		for(var i = 0 ; i < eventsLength ; i++){
// 			var eventsDay = (eventsList[i].start).substring(8,10);
			
// 			//console.log("start : " + eventsDay);
// // 			$('#weekRosterTable tbody>tr:eq(0)>th').eq(i).text("ss");
// // 			console.log("log : " + $('#weekRosterTable thead>tr:eq(1)>th').eq(i).text());
			
// 			for(var j = 0 ; j < 7 ; j++){
// 				var weekDay = $('#weekRosterTable thead>tr:eq(1)>th').eq(j).text();
				
// 				console.log("weekDay : " + weekDay);
				
// 				if(eventsDay == weekDay){
// // 					$('#weekRosterTable tbody>tr:eq(0)>th').eq((j+1)).text(eventsList[i].resource);
// 				}
				
// 			}
// 		}
		
		var tmpData = "";
		
		for(var i = 0 ; i < eventsLength ; i++){
			var startDateEvents = eventsList[i].start;
        	var endDateEvents = eventsList[i].end;				//events안에서 end(ex : "2018-02-13T00:00:00")
        	
        	var startDateString = ((JSON.stringify(startDateEvents).substring(1,11))).split('-');		//ex) 2018-02-08만 남기고 거기서 '-'를 제거함
			var startDate = new Date(startDateString[0], (startDateString[1]-1), startDateString[2]);	//date 함수에 넣음.
			var endDateString = ((JSON.stringify(endDateEvents).substring(1,11))).split('-');
			var endDate = new Date(endDateString[0], (endDateString[1]-1), endDateString[2]);
			var tmpDate = new Date(startDateString[0], (startDateString[1]-1), startDateString[2]);
     		
 	   		var diff = endDate - startDate;
 			var currDay = 24 * 60 * 60 * 1000;				//일차이
 			var currMonth = currDay * 30;					//월차이
 			var currYear = currMonth * 12;					//연차이
 			var diffCurrDay = parseInt(diff/currDay);
 			var key;
 			
			for(var j = 0 ; j < diffCurrDay ; j++){
				for(var k = 0 ; k < 7 ; k++){
					var weekDay = $('#weekRosterTable thead>tr:eq(1)>th').eq(k).attr("name");
					
					var mm = Number(tmpDate.getMonth()) + 1;
					var dd = tmpDate.getDate();
					
					mm = String(mm).length === 1 ? '0' + mm : mm;
					dd = String(dd).length === 1 ? '0' + dd : dd;
					
					if(weekDay == (mm+dd)){
						key = weekDay + eventsList[i].text;
						
						if(eventsMap.containsKey(key)){
							tmpData = eventsMap.get(key);
							
	 						if(tmpData.indexOf(eventsList[i].resource) == -1){
	 							tmpData = tmpData + eventsList[i].resource;
	 						}
	 						
	 						eventsMap.put(key, tmpData);
	          			}else{
	          				console.log("실험 3 : " + weekDay + " : " + eventsList[i].resource);
	          				eventsMap.put(key, eventsList[i].resource);
	          			}

					}
				}
				
				tmpDate.setDate(tmpDate.getDate() + 1);
			}
		}
		
		//map에 key값만 가져옴.
      	var keyArray = eventsMap.keys();
            
        //map을 돌면서 결과 string에 값을 넣어줌.
        for(var i = 0 ; i < keyArray.length; i++){
        	console.log("map2 : " + keyArray[i] + " : " + eventsMap.get(keyArray[i]));
        	var roster = keyArray[i].substring(4,5);
        	var day = keyArray[i].substring(0,4);
        	
        	console.log("day : " + day + " roster : " + roster);
        	
        	for(var j = 0 ; j < 7; j++){
        		var weekDay = $('#weekRosterTable thead>tr:eq(1)>th').eq(j).attr("name");
        		
        		if(weekDay == day){
        			if(roster == 'D'){
        				$('#weekRosterTable tbody>tr:eq(0)>th').eq((j+1)).text(eventsMap.get(keyArray[i]));
        			}else if(roster == 'E'){
        				$('#weekRosterTable tbody>tr:eq(1)>th').eq((j+1)).text(eventsMap.get(keyArray[i]));
        			}else if(roster == 'N'){
        				$('#weekRosterTable tbody>tr:eq(2)>th').eq((j+1)).text(eventsMap.get(keyArray[i]));
        			}
        		}
        	}
        }
        
	}
	
	function iconClick(obj){
		for(var j = 0 ; j < 7; j++){
    		$('#weekRosterTable tbody>tr:eq(0)>th').eq((j+1)).text("");
    		$('#weekRosterTable tbody>tr:eq(1)>th').eq((j+1)).text("");
    		$('#weekRosterTable tbody>tr:eq(2)>th').eq((j+1)).text("");
    	}
		
		console.log("바뀌어라33333");
		
		var weekRosterDateString = $('input[name=yearMonth]').val();
		
		var year = weekRosterDateString.substring(0,4);
		var month = weekRosterDateString.substring(5,7);
		var day = weekRosterDateString.substring(8,10);
		
		var week = new Date(year, month-1, day);
		
		if($(obj).attr('id') == 'rightIcon'){
			week.setDate(week.getDate() + 7);
		}else{
			week.setDate(week.getDate() - 7);
		}
		
		var yearMonth = week.getFullYear() + "-" + ((week.getMonth()+1)<10 ? '0' + (week.getMonth()+1) : (week.getMonth()+1)) + '-' +
        (week.getDate()<10 ? '0'+week.getDate() : week.getDate());
		
		$('input[name=yearMonth]').val(yearMonth);
		
		var thisWeek = weekCalculation($('input[name=yearMonth]').val());
		
		$("#weekInput").html("주간근무표("+ thisWeek[0] + "~" + thisWeek[6] + ")");
		
		dbDataInputOutput(thisWeek);
	}
	
</script> 

<body>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<span class="icon"><i class="fa fa-chevron-left" onclick="iconClick(this)" id="leftIcon"></i></span>
				<div id="weekInput" style="display:inline"></div>
			<span class="icon"><i class="fa fa-chevron-right" onclick="iconClick(this)" id="rightIcon"></i></span>
			
			<table border="1" id="weekRosterTable" style="margin-top: 10px;">
				<thead>
					<tr>
						<th rowspan="2">구분</th>
						<th class="sun">일요일</th>
						<th>월요일</th>
						<th>화요일</th>
						<th>수요일</th>
						<th>목요일</th>
						<th>금요일</th>
						<th class="sat">토요일</th>
					</tr>
					<tr>
						<th class="sun"></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th class="sat"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="D">Day 근무</th>
						<th class="D"></th>
						<th class="D"></th>
						<th class="D"></th>
						<th class="D"></th>
						<th class="D"></th>
						<th class="D"></th>
						<th class="D"></th>
					</tr>
					<tr>
						<th class="E">Eve 근무</th>
						<th class="E"></th>
						<th class="E"></th>
						<th class="E"></th>
						<th class="E"></th>
						<th class="E"></th>
						<th class="E"></th>
						<th class="E"></th>
					</tr>
					<tr>
						<th class="N">Night 근무</th>
						<th class="N"></th>
						<th class="N"></th>
						<th class="N"></th>
						<th class="N"></th>
						<th class="N"></th>
						<th class="N"></th>
						<th class="N"></th>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="yearMonth" value="${formYearMonth}">
		</div>
	</div>
</div>
</body>
</html>