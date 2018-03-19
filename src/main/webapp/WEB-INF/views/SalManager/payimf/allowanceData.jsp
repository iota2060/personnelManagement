<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/common/css/allowance.css" type="text/css" /> --%>
<!-- <link rel="stylesheet" href="resources/common/css/allowance.css" type="text/css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script> -->

<script>
	
	function AllowanceSaveAjax(){
		//alert("Allowance");
		
		//var allowanceDataFrm = document.getElementById("allowanceDataFrm");
		//alert(allowanceDataFrm);
		//allowanceDataFrm.action = "${pageContext.request.contextPath}/allowanceDataInsert.do";
		//allowanceDataFrm.submit();
		
		console.log("before start");
		$("#allowanceDataFrm").ajaxForm({
			async : false,
			cache:false,
			type:"POST", //전송방식을 정하는 메쏘드
			url	:"${pageContext.request.contextPath}/allowanceDataInsert.do", //보낼페이지
			
			dataType:"JSON", 
			beforeSend:function(){
				console.log("beforeSend");
			},
			
			success: function(data){
				console.log("성공 data : " + JSON.stringify(data));
				
				$("#scomHhCst").val(data.scomHhCst);
				$("#scomNhCst").val(data.scomNhCst);
				$("#scomLhCst").val(data.scomLhCst);
				$("#scomElhCst").val(data.scomElhCst);
				$("#sempCmc").val(data.sempCmc);
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

		}).submit();
		
	}
	
	// 숫자만 입력, 콤마찍기, 첫자리 숫자 0 입력 안되게
	//콤마찍기
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	//콤마풀기
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	function onlyMoneyNumber(obj) {	//	obj 는 this 값 입니다
		$(obj).val($(obj).val().replace(/[^0-9]/g,"").replace(/(^0+)/, "") );
		$(obj).keyup(function(){			
			obj.value = comma(uncomma(obj.value));
	    });
	}
	
</script>

</head>
<body>
<div class="main">
	<div class="main-content">

		<div class="container-fluid">
			<h3 class="page-title">급여대장</h3>

			<div class="col-md-10">
				<div class="panel">
					<div class="panel-heading">
					
					</div>
						<div class="panel-body">
						
						<form action="" name="allowanceDataFrm" id="allowanceDataFrm" method="post">
							<div id="oneDiv" class="oneDiv">
								
									<div id="rightDiv">
										<table>
											<tr>
												<td>
													야근 시간당수당
												</td>
												<td>
													<input type="text" name="scomNhCst" style="width=100%; text-align:right;" id="scomNhCst" value='${ empty list ? "0": list.get(0).scomNhCst }' onkeydown="onlyMoneyNumber(this)" >
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;차량 유지비
												</td>
												<td>
													
													<input type="text" name="sempCmc" style="width=100%; text-align:right;" id="sempCmc" value='${ empty list ? "0": list.get(0).sempCmc }' onkeydown="onlyMoneyNumber(this)" >
												</td>
											</tr>
											<div></div>
											<tr>
												<td>
													주간 시간당수당
												</td>
												<td>
													<input type="text" name="scomHhCst" style="width=100%; text-align:right;" id="scomHhCst" value='${ empty list ? "0": list.get(0).scomHhCst }' onkeydown="onlyMoneyNumber(this)" >
												</td>
												<td>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;식대
												</td>
												<td>
													<input type="text" name="scomElhCst" style="width=100%; text-align:right;" id="scomElhCst" value='${ empty list ? "0": list.get(0).scomElhCst }' onkeydown="onlyMoneyNumber(this)" >
												</td>
											</tr>
											<div></div>
											<tr>
												<td><p>
													지각
												</td>
												<td>
													<input type="text" name="scomLhCst" style="width=100%; text-align:right;" id="scomLhCst" value='${ empty list ? "0": list.get(0).scomLhCst }' onkeydown="onlyMoneyNumber(this)" >
												</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td>
													<input type="button" value="저장" onclick="AllowanceSaveAjax()">
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</form>
					   </div>
				</div>
			</div>
		</div>
	</div>
</div>
					
				
	
	
</body>
</html>