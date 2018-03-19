<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="/spring/resources/common/management/js/menuTree.js"></script>	
	<script>
		
		//menuTree 에 들어갈 menu data load
		paging.ajaxSubmit("menuList.ajax","","menuTree",true);
	
		//menuUpdateForm html load
		var menuUpdateForm = function(){
	
		     var mnNo = $("[name='mnNo']").text(); //가져올 menu code 변수
		     
		     var obj={}; 
		     obj.mnNo = mnNo;
	
		    //form html append ajax
		    paging.ajaxSubmit("menuUpdateForm.do",obj,function(html){
		    	 //panel에 html append
	            $("[name='detail']").html(html);
	            //카테고리 이동 버튼 이벤트 등록
	            moveEvent();
		    },true,"html");//paging.ajaxSubmit
		    
		};//menuUpdateForm
	
		//menu update 함수
		var menuUpdate = function(){
		    //해당위치의 모든 menu index 저장변수
		    var menuIdxStr = "";
	
		    var mnNo = $("[name='mnNo']").val();// 해당 menu code
		    var $thisMenu = $("#tree #"+mnNo); // menuTree에서 해당 menu code를 가진 li
		    var $thisParent = $thisMenu.parent("ul"); // menuTree에서 해당 메뉴의 부모 ul 노드
	
		    //해당 위치의 모든 menu each
		    $thisParent.children("li").each(function(index){
		        //menu index string에 저장
		        menuIdxStr += $(this).attr("id")+":"+index+"^";
		    });//each
	
		    //menuIdxStr input에 저장
		    $("input[name='mnIdxStr']").val(menuIdxStr);
	
		    //ajax submit 실행
		    paging.ajaxFormSubmit("menuUpdate.do","updateForm","resultData");
	
		};//menuUpdate
	
		//이동 버튼 이벤트 등록 함수
		var moveEvent = function(){
		    $("#mnIdxBtn>button").on("click",function(){
		        menuMove($(this));
		    });//onClick
		};//moveEvent
	
		//menu 이동 이벤트 함수
		var menuMove = function(thisBtn){
	
		    var mnNo = $("[name='mnNo']").val(); //menu code 저장변수
		    var $thisMenu = $("#tree #"+mnNo); // menuTree에서 해당 menu code를 가진 li
		    var $thisParent = $thisMenu.parent("ul"); // menuTree에서 해당 메뉴의 부모 ul 노드
	
		    //switch (이벤트 실행 버튼 종류)
		    switch(thisBtn.attr("name")){
		        case "up" :
		                    $thisMenu.insertBefore($thisMenu.prev());
		                    break;
		        case "down" :
		                    $thisMenu.insertAfter($thisMenu.next());
		                    break;
		        case "top" :
		                    $thisMenu.prependTo($thisParent);
		                    break;
		        case "buttom" :
		                    $thisMenu.appendTo($thisParent);
		                    break;
		    }//switch
		};//menuMove
	
		//menu 등록 함수
		var menuInsert = function(){
		    paging.ajaxFormSubmit('/spring/menuInsert.do','insertForm',"resultData");
		    //사이드 메뉴 재 배치를 위한 함수 호출
		    commMenu();
		};//menuInsert
	
		var menuDelete = function(){
		    var mnNoData = {}; 
		    mnNoData.mnNo =  $("[name='mnNo']").text()//가져올 menu code 변수
		    
		    paging.ajaxSubmit("/spring/menuDelete.do",mnNoData,"resultData",true);
		}//menuDelete
	
		//menu 수정, 업데이트 , 삭제 결과 함수
		var resultData = function(result){
		    if(result="1"){
		        alert("정상처리되었습니다.");
		        window.location.href = "menuTreeMain.do";
		    }else{
		        alert("다시 시도해주세요.");
		    }//if else
	
		};//resultData
	
		//가져온 menu list 를 menu Tree에 배치하는 함수
		var menuTree = function menuTree(result){
		    //ssTree 호출
		   
		    $("#tree").ssTree(result.data);
		    //클릭 이벤트 등록
		    $("#tree li").clickEvent();
		    //버튼 추가 이벤트 등록
		    $("button[name='menuAdd']").addEvent();
		};//menuTree
	
		//작업 취소 함수
		var menuEsc = function(){
		    window.location.href = "menuTreeMain.do";
		};//menuEsc
</script>
</body>
</html>