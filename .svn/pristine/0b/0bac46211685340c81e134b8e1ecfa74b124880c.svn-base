<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<script>
	console.log('set');
	// datetimepicker 초기 설정
	$(function () {
		$('#hrApntDate3').datetimepicker({ //근무일자 달력
			viewMode: 'days',
			format: 'YYYY-MM-DD'
		});
	});
	$(function () {
		$('#hrApntDate4').datetimepicker({ //근무일자 달력
			viewMode: 'days',
			format: 'YYYY-MM-DD'
		});
	});
	$(function(){
		$('#cntnData1').datetimepicker({ //근무일자 달력
			viewMode: 'days',
			format: 'YYYY-MM-DD'
		});
	});
	$(function(){
		$('#cntnData23').datetimepicker({ //근무일자 달력
			viewMode: 'days',
			format: 'YYYY-MM-DD'
		});
	});

/// change 시 기능 변경 설정
$(document).ready(function(){
	
	//초기설정
	hrApntSelNum1();
	$('[name=cntnData2]').val( $('#cntnData21').val() );
	$('#dataName2').text("발령직급");

	// 달력 초기값 설정
	$("#cntnData1").datetimepicker().data('DateTimePicker').date(new Date());
	$("#cntnData23").datetimepicker().data('DateTimePicker').date(new Date());
	
	// 체크 박스 초기 설정	
	// 전체 반전
	$("#ckListAll").click(function(){
		if( $("#ckListAll").prop("checked") == true ){
			$("[name=ckList]").prop("checked",true);
		}else{
			$("[name=ckList]").prop("checked",false);
		}
	});
	// click 동작 처리
	$(document).on('click','[name=ckList]',function(e){
		e.stopPropagation();
	});
	// 테이블 클릭
	$(document).on('click','#empTable td',function(e){
		var thIndex = $(this).parent().parent().parent().children().index($(this).parent().parent());
		var rowIndex = $(this).parent().parent().children().index($(this).parent());
		var colIndex = $(this).parent().children().index($(this));

		if( thIndex == 1 ){
			$('[name=ckList]').eq( rowIndex ).prop("checked", !$('[name=ckList]').eq( rowIndex ).prop("checked") );
		}
	});
	
	//발령구분 변경시 처리
	$('#hrApntSel').change(function(){
		var hrApntSelNum = $('#hrApntSel').val();

		if( hrApntSelNum == 1 ){
			$('#dataName2').text("발령직급");
			hrApntSelNum1();
		}else if( hrApntSelNum == 2 ){
			$('#dataName2').text("이동부서");
			hrApntSelNum2();
		}else if( hrApntSelNum == 3 ){
			$('#dataName2').text("복직일자");
			hrApntSelNum3();
		}else if( hrApntSelNum == 4 ){
			$('#dataName2').text("복직일자");
			hrApntSelNum3();
		}else if( hrApntSelNum == 5 ){
			$('#dataName2').text("퇴직일자");
			hrApntSelNum3();
		}else if( hrApntSelNum == 6 ){
			$('#dataName2').text("채용직급");
			hrApntSelNum1();
		}
	});
	
	$('#hrApntSubmit').click(function(){
		
		//alert( $('#hrApntDate12').val() );
		/* $('#hrApntFrm').append("<div id='emptyEmp'></div>");
		
		$('#ListEmp tr').each(function(i){
			if( $("[name=ckList]").eq( i ).prop("checked") == true ){
				$('#emptyEmp').append( "<input type='hidden' value='"+$('#ListEmp tr').eq(i).children().eq(1).text()+"' name='empEmno'>" )
			}
		});
		
		$("#hrApntFrm").ajaxForm({
			async : false,
			cache:false,
			type:"POST", //전송방식을 정하는 메쏘드
			url	:"${pageContext.request.contextPath}/hrapntRegPro.ajax", //보낼페이지
			
			
			dataType:"JSON", 
			beforeSend:function(){
				console.log("beforeSend");
			},
			
			success: function(data){
				console.log("성공 data : " + JSON.stringify(data));
				//alert( $("#sempCmc").val() );
			},
			error: function(xhr, status, error){
				console.log("실패");
				//console.log("xhr:"+JSON.stringify(xhr));
				//console.log("status:"+status);
				//console.log("error:"+error);
			},
			complete: function(event, request, settings){ //마지막에 무조건 실행
				console.log("완료");
				//console.log("event : " + JSON.stringify(event));
				//console.log("request : " + request);
				//console.log("settings : " + settings);
			}

		}).submit(); */
		
		//$('#hrApntFrm').remove("<div id='emptEmp'></div>");
		$('#emptyEmp').remove();

		//$('#hrApntFrm').attr('action','/spring/hrapntRegPro.ajax').submit();
		
	});
});

	function hrApntSelNum1(){
		$('[name=cntnData2]').val( $('#cntnData21').val() );
		$('#cntnData21').show().change(function(){	//선택상자2 변경시 처리
			$('[name=cntnData2]').val( $('#cntnData21').val() );
		});
		$('#cntnData22').hide();
		$('#hrApntDate4').hide();
	}
	function hrApntSelNum2(){
		$('[name=cntnData2]').val( $('#cntnData22').val() );
		$('#cntnData21').hide();
		$('#cntnData22').show().change(function(){	//선택상자2 변경시 처리
			$('[name=cntnData2]').val( $('#cntnData22').val() );
		});
		$('#hrApntDate4').hide();
	}
	function hrApntSelNum3(){
		$('[name=cntnData2]').val( $('#cntnData23').val() );
		$('#cntnData21').hide();
		$('#cntnData22').hide();
		$('#hrApntDate4').show();
		
		$('#hrApntDate4').on('dp.change', function() { $('[name=cntnData2]').val( $('#cntnData23').val() )  });
	}
	
	function popup_close(){
		$('#modal_hrapntReg').hide();
		$('#dialog-background').hide();
		//e.stopPropagation();
	}

</script>




