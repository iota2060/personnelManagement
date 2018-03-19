﻿﻿/**
 * @classDescription		: 공통 스크립트 
 * @since					: 2016.09.22
 */

// 아래 항목들은 "/resources/common/jsp/common.jsp" 파일에서 "properties.xml"로 받은 값을 세팅하므로 재선언하거나 재정의 하지 말것.
var prop_mode = {};
	prop_mode.isDebug;						// 디버그 모드 ( true / false )
	
var prop_view = {};
	prop_view.pageLists;					// 페이지당 리스트 수 : 10 개
	
$(document).ready(function(){
	$(document).keydown(function(e) {		// 아무곳에서나 엔터키를 치면 textarea제외하고 문서가 submit 되는걸 방지
		if (e.keyCode == 13) {
			if(e.target.nodeName != "TEXTAREA"){        
				e.preventDefault();
			}
		} // if
	}); // keydown
	
}); // $document

var paging = {};


/**
 * @Description				form내용을 JSON데이타로 변환하는 함수
 * 
 * 
 * <pre>
 *     1.form내용을 JSON데이타로 변환하는 함수
 *        
 *     2. var o = $('#formId').serializeObject(); 형식으로 사용
 *
 *	   3. JSON.stringify()로 확인.  
 *        
 * </pre>
 * @author KWS
 */

$.fn.serializeObject = function()	{
    var o = {};
    var a = this.serializeArray();
    console.log(">>>>>>>>" + JSON.stringify(a));
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};




/**
 * @Description				ajaxForm 서브밋 
 * 
 * @param url				처리 할 URL
 * @param formId			해당 폼 ID
 * @param callbackFunc		콜백 함수명 ( function / string 형 )
 * <pre>
 *     기존 방식은 paging.ajaxSubmit 함수와 동일. 하지만 파일업로드인 form 특성에 따른 몇가지 주의 사항이 따른다.
 *     
 *            
 *     3. 해당 기능은 /resources/common/js/upload/jquery.form.js 을 기반으로 만든 함수임을 밝힘.       
 *        
 * </pre>
 * @author KWS
 */
paging.ajaxFormSubmit = function( url, formId, callbackFunc ){
	if( url == "" || url == null || url == undefined ) {
		alert( "처리할 URL이 없습니다.\n\n> 입력한 URL : " + url );
		return false;
	} // if
	
	$('#' + formId).ajaxForm({             
    	type:"POST"
      ,  url:url
      , dataType: "json"
      , success: function( result ) {
    	  if( typeof(callbackFunc) == "string" ) {
				eval( callbackFunc )( result );
			} else if( typeof(callbackFunc) == "function" ) {
				callbackFunc( result );
			} // else if

			isReturn = true;
		}, error: function( result ) {
			if( typeof(callbackFunc) == "string" ) {
				eval( callbackFunc )( null );
			} else if( typeof(callbackFunc) == "function" ) {
				callbackFunc( null );
				return false;
			} // else if
		} // error                              
  }).submit();
  return false;  
}



/**
 * @Description				ajax 서브밋
 * 
 * @param url				( String )				처리 할 URL
 * @param dataNode			( Object )				데이터노드 ( 노드의 root를 넣는다. )
 * @param callbackFunc		( function / string )	콜백 함수명
 * @param asyncType			( String / Boolean )	동기 / 비동기 형식 [ 비우면 비동기(true) ]
 * 							> 성공 시 변수에 데이터 노드 반환 / 실패시 null 반환
 * <pre>
 *							paging.ajaxSubmit( "url", datas, function(rslt){		// rslt -> 바꿔도 됨
 * 								if( rslt != null ) {		// 에러 발생 시 데이터 노드가 아닌 null 반환
 * 									alert( rslt.cnt );		> 123
 * 									// 정상 처리
 * 								} else {
 * 									// 에러 처리
 * 								} // else
 * 							});
 * </pre>
 * @author LSJ
 */
paging.ajaxSubmit = function( url, dataNode, callbackFunc, asyncType, dataType ) {
	var isReturn = false;
	if( url == "" || url == null || url == undefined ) {
		alert( "처리할 URL이 없습니다.\n\n> 입력한 URL : " + url );
		return false;
	} // if
	
	if( dataNode == "" || dataNode == null || dataNode == undefined ) {
		dataNode = {};
	} // if
	
	if( (typeof(asyncType) == "string" && asyncType == "") || asyncType == null || asyncType == undefined ) {
		asyncType = true;
	} // if
	
	if( dataType == "" || dataType == null || dataType == undefined ) {
		dataType = "json";
	} // if
	
	$.ajax({
		beforeSend: function( xmlHttpRequest ){					// Interceptor에서 ajax를 판독하기 위함
			xmlHttpRequest.setRequestHeader( "isAjax", "true" );
		},
		async: eval( asyncType ),
		type: "post",
		dataType : dataType,
//		contentType : "application/json; charset=UTF-8",		// 넣으면 데이터가 안넘어감..
		cache: false,
		url: url,
		data: dataNode,
		success:function( result ) {
			
			if( typeof(callbackFunc) == "string" ) {
				eval( callbackFunc )( result );
			} else if( typeof(callbackFunc) == "function" ) {
				callbackFunc( result );
			} // else if

			isReturn = true;
		}, error: function( result ) {
			console.log(">>>server error:" + JSON.stringify(result));
			var rMsg		= result.responseText;
			var errorMsg	= rMsg.substring( rMsg.search("<u>")+"<u>".length, rMsg.search("</u>") );				// 에러 메시지

			if( Number(errorMsg) == 0 ) {
				errorMsg	= rMsg.substring( rMsg.search("<title>")+"<title>".length, rMsg.search("</title>") );	// 에러 메시지
			} // if
			
			alert( "[" + result.status + "] " + errorMsg );		// 에러 메시지 출력

			if( typeof(callbackFunc) == "string" ) {
				eval( callbackFunc )( null );
			} else if( typeof(callbackFunc) == "function" ) {
				callbackFunc( null );
			} // else if
			
			
			isReturn = false;
		} // error
	});

	return isReturn;
} // paging.ajaxSubmit()
