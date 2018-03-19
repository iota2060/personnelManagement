<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="/spring/resources/common/js/pagingNav.js"></script>
   	<script src="/spring/resources/common/management/js/menuTree.js"></script>
   	
   	<script>

		// datetimepicker 초기 설정
		$(function () {
			$('#hrApntDate1').datetimepicker({ //근무일자 달력
				viewMode: 'days',
				format: 'YYYY-MM-DD'
			});
		});
		$(function () {
			$('#hrApntDate2').datetimepicker({ //근무일자 달력
				viewMode: 'days',
				format: 'YYYY-MM-DD'
			});
		});
		$(function () {
			$('#hrApntDate11').datetimepicker({ //근무일자 달력
				viewMode: 'days',
				format: 'YYYY-MM-DD'
			});
		});
		$(function () {
			$('#hrApntDate12').datetimepicker({ //근무일자 달력
				viewMode: 'days',
				format: 'YYYY-MM-DD'
			});
		});
	
		
	$(document).ready(function(){
		initDayView();	//view2	// 날짜셋팅
		searchStart2(); //사원리스트 출력 함수 호출
		searchEvent2(); //검색 이벤트 함수 호출
		
		//var url = "./modalTest123";
		var url = "/spring/hrapntReg";
		//$('#modal_hrapntReg').load(url);
		$('#modal_hrapntReg').load(url);
		
		
		//alert( $('#cntnData23').val() );
		
		$("#hrapntOpen").click(function(){
			//$('#modal_hrapntReg').load(url);
			//$('#modal_hrapntReg').load(url);
			$('#dialog-background').show();
			$('#modal_hrapntReg').show();
		});
		
		$("#m_close").click(function(){
			//$('#modal_hrapntReg').remove();
			$('#modal_hrapntReg').hide();
			$('#dialog-background').hide();
			//empListPrint(); //사원리스트 출력 함수 호출
			
			//jQuery('#modal_hrapntReg').css("display", "block");
			
		});
		
		
		
		
	
	});
	
	function initDayView(){
		// 달력 초기값 설정
		//alert("view2");
		var setDate1 = new Date();
		var setDate2 = new Date();
		// 1. 오늘날짜와 한달 전 날짜
		setDate1.setMonth(setDate1.getMonth() - 1);
		$("#hrApntDate11").text("viewTest2");
		$("#hrApntDate11").datetimepicker().data('DateTimePicker').date(setDate1);
		$("#hrApntDate12").datetimepicker().data('DateTimePicker').date(setDate2);
		console.log("달력값을넣음.")
	
		// 2. 이번달 출력
		/* setDate1.setDate(1);
		setDate2.setMonth(setDate2.getMonth() + 1);
		setDate2.setDate(1);
		setDate2.setDate(setDate2.getDate() - 1);
		$("#hrApntDate11").datetimepicker().data('DateTimePicker').date(setDate1);
		$("#hrApntDate12").datetimepicker().data('DateTimePicker').date(setDate2); */
	}
	
	</script>
	
	<style>
	
	#dialog-background {
	    display: none;
	    position: fixed;
	    top: 0; left: 0;
	    width: 100%; height: 100%;
	    background: rgba(0,0,0,.3);
	    z-index: 1000;
	}
	#modal_hrapntReg {
	    display: none;
	    position: fixed;
	    left: calc( 30% - 160px ); top: calc( 30% - 70px );
	    width: 800px; height: 500px; 
	    background: #fff;
	    z-index: 1001;
	    padding: 10px;
	}
	
	</style>

	<script>
		
	var searching =false; //검색 활성화 값 boolean
	var searchCnd; //검색 옵션
	var searchWd; //검색 text
	var apntTypeNm;
	var hrApntDate1;
	var hrApntDate2;
	
	//검색 이벤트 발생 시 유효성 검사 후 검색 리스트 출력 함수 호출
	var searchEvent2 = function(){
		$("input[name='searchViewBtn']").on('click',function(){
			
			/* if(!$("[name='searchCnd']>option").index($("[name='searchCnd']>option:selected"))){
				alert("option을 선택해주세요"); 
			}else if($("[name='searchWd']").val()==""){
				alert("검색내용이 없습니다");
			}else{ */
				searching = true;
				searchStart2();
			//}//유효성 검사 후 리스트 출력 함수 호출if else
			
		});//onclick
	}//searchEvent2
	
	//리스트 전 처리 후 출력 함수 호출 
	var searchStart2 =function(choicePage){
		//alert( $("[name='hrApntDate1']").val() );
		//if(searching){
			searchCnd  = $("#searchCnd").val();
			searchWd = $("#searchWd").val();
			apntTypeNm = $("#apntTypeNm").val();
			hrApntDate1 = $("#hrApntDate1").val();
			hrApntDate2 = $("#hrApntDate2").val();

		//}//if
		empListPrint2(searchCnd,searchWd,choicePage,apntTypeNm,hrApntDate1,hrApntDate2); //리스트 출력함수 호출
	}//searchStart2
	
	//리스트 출력 함수
	var empListPrint2 = function(searchCnd,searchWd,choicePage,apntTypeNm,hrApntDate1,hrApntDate2){
		//alert("view");
		if(choicePage==undefined){
			choicePage = 1;
		}//선택 페이지값이 들어오지 않은 경우 if
		if(searchCnd==undefined){
			searchCnd = "";
		}//검색 옵션 값이 들어오지 않은 경우 if
		if(searchWd==undefined){
			searchWd = "";
		}//검색 text 값이 들어오지 않은 경우 if
		if(apntTypeNm==undefined){
			apntTypeNm = "";
		}//검색 옵션 값이 들어오지 않은 경우 if
		if(hrApntDate1==undefined){
			hrApntDate1 = "";
		}//검색 text 값이 들어오지 않은 경우 if
		if(hrApntDate2==undefined){
			hrApntDate2 = "";
		}//검색 text 값이 들어오지 않은 경우 if
		
		var url = "hrapntRsList.ajax"; //data를 보낼 url
		var data = {"choicePage":choicePage, "searchCnd":searchCnd, "searchWd":searchWd,"apntTypeNm":apntTypeNm,"hrApntDate1":hrApntDate1,"hrApntDate2":hrApntDate2 }; //보낼데이터
		var str=""; //append 시킬 string 저장 변수
		var thisList; //사원리스트 저장변수
		
		//paging.ajaxSubmit 호출
		paging.ajaxSubmit(url,data,function(result){
			
			//alert( $('#cntnData23').val() );
			
			//console.log( JSON.stringify(result) );
			//console.log( JSON.stringify(result.ListHrapnt) );
			//console.log( result.ListHrapnt );
			
			//$("#empTotal").text(result.totalNoticeNum);
			$('#HrapntTotal').text( result.totalNoticeNum );
			
			thisList = result.ListHrapnt;

			if(thisList!=null){
				$.each(thisList,function(index){
					
					console.log( thisList[index].hrapntnum );
					
					str += "<tr style='cursor:pointer'>";
					str += "<td>"+thisList[index].hrapntnum+"<input type='hidden' name='apntDeptName' value="+thisList[index].deptName+"></td>"
					str += "<td>"+thisList[index].apntTypeNm+"</td>";
					str += "<td>"+thisList[index].apntRegDate+"</td>";
					str += "<td>"+thisList[index].apntEmpno+"</td>";
					str += "<td>"+thisList[index].EMPNAME+"</td>";
					str += "<td>"+thisList[index].apntCntnInfo1+"/"+thisList[index].apntCntnInfo1+"</td>";
					str += "<td>"+thisList[index].apntRmrk+"</td>";
					str += "</tr>";
				});//each
				
				$("#ListHrapnt").children().remove();
				$("#ListHrapnt").append(str);
				
				//detailEvent();
				
				
				var obj = {"totalNoticeNum":result.totalNoticeNum,"choicePage":choicePage,"viewPageMaxNum":3,"viewNoticeMaxNum":3};
				//$("nav[name='pagingNavView']").pagingNav(obj,"pageViewClick");
			}//if
			
		});//paging.ajaxSubmit
	};//empListPrint2
	
	//paging 처리 
	/* var pageViewClick = function(target){
		searching = false;
		searchStart2(target.attr("name"));
	}//pageClick */
	
	
	//사원 권한 상세보기
	/* var detailEvent = function(){
		//사원 리스트 table에 이벤트 등록
		$("tbody td").on("click",function(){
			var empEmno = $(this).parent("tr").children("td[name='empEmno']").text(); //사원코드 저장
			$("input[name='empEmno']").val(empEmno);
			//$("form[name='hiddenForm']").submit();
		});//onclick
	}//detailEvent */
	
	</script>

