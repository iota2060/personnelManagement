<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- <script src="./pagingNav2.js"></script> -->
    <!-- <script src="/spring/src/main/weapp/WEB-INF/views/personnel/hrapnt/script/paging2.js"></script> -->
    
    <script src="/spring/resources/common/js/pagingNav.js"></script>
    
	<script>
	console.log('reg');
	var searching =false; //검색 활성화 값 boolean
	var searchCnd; //검색 옵션
	var searchWd; //검색 text
		
	$(document).ready(function(){
		empListPrint(); //사원리스트 출력 함수 호출
		searchEvent(); //검색 이벤트 함수 호출
	});
	
	//검색 이벤트 발생 시 유효성 검사 후 검색 리스트 출력 함수 호출
	var searchEvent = function(){
		$("input[name='searchBtnReg']").on('click',function(){
			
			/* if(!$("[name='searchCnd']>option").index($("[name='searchCnd']>option:selected"))){
				alert("option을 선택해주세요");
			}else if($("[name='searchWd']").val()==""){
				alert("검색내용이 없습니다");
			}else{ */
				searching = true;
				searchStart();
			//}//유효성 검사 후 리스트 출력 함수 호출if else
			
		});//onclick
	}//searchEvent
	
	//리스트 전 처리 후 출력 함수 호출 
	var searchStart =function(choicePage){
		if(searching){
			searchCnd  = $("[name='searchCnd'] option:selected").val();
			searchWd = $("input[name='searchWd']").val();
		}//if
		empListPrint(searchCnd,searchWd,choicePage); //리스트 출력함수 호출
	}//searchStart
	
	//리스트 출력 함수
	var empListPrint = function(searchCnd,searchWd,choicePage){
		//alert("reg");
		if(choicePage==undefined){
			choicePage = 1;
		}//선택 페이지값이 들어오지 않은 경우 if
		
		if(searchCnd==undefined){
			searchCnd = "";
		}//검색 옵션 값이 들어오지 않은 경우 if
		
		if(searchWd==undefined){
			searchWd = "";
		}//검색 text 값이 들어오지 않은 경우 if
		
		var url = "hrapntEmpList.ajax"; //data를 보낼 url
		var data = {"choicePage":choicePage, searchCnd:searchCnd, searchWd:searchWd }; //보낼데이터
		var str=""; //append 시킬 string 저장 변수
		var thisList; //사원리스트 저장변수
		
		//paging.ajaxSubmit 호출
		paging.ajaxSubmit(url,data,function(result){
			
			//console.log( JSON.stringify(result) );
			//console.log( JSON.stringify(result.listEmp) );
			//console.log( result.listEmp );
			
			//$("#empTotal").text(result.totalNoticeNum);
			
			//alert( result.totalNoticeNum );
			
			$('#empTotal').text( result.totalNoticeNum );
			
			thisList = result.listEmp;
			
			if(thisList!=null){
				$.each(thisList,function(index){
					str += "<tr style='cursor:pointer'>";
					str += "<td><span name='ckListOut'><input type='checkbox' name='ckList'></span></td>";
					str += "<td name='empEmno'>"+thisList[index].empEmno+"</td>"
					str += "<td>"+thisList[index].empName+"</td>";
					str += "<td>"+thisList[index].rankName+"</td>";
					str += "<td>"+thisList[index].deptName+"</td>";
					str += "</tr>";
				});//each
				
				$("#ListEmp").children().remove();
				$("#ListEmp").append(str);
				
				//detailEvent();
				
				
				var obj = {"totalNoticeNum":result.totalNoticeNum,"choicePage":choicePage,"viewPageMaxNum":3,"viewNoticeMaxNum":3};
				$("nav[name='pagingNavReg']").pagingNav(obj,"pageClickReg");
			}//if
			
		});//paging.ajaxSubmit	
	};//empListPrint
	
	//paging 처리 
	var pageClickReg = function(target){
		searching = false;
		searchStart(target.attr("name"));
	}//pageClick
	
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
	

