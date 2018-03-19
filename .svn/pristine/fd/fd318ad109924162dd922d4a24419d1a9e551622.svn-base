<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="resources/common/js/jquery-3.2.1.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="resources/common/js/paging.js"></script> -->

<script>


	var checklength = ${count};

	var checkcount = 0;

	/* $(document).ready(function() {
		//최상단 체크박스 클릭
		$("#checkall").click(function() {
			//클릭되었으면
			if ($("#checkall").prop("checked") ==true) {//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	
				for (var i = 0; i < checklength; i++) {
					
					//var code = $('[name=empcode'+i+']').attr('id');
					 $("input[name=sali"+i+"]").remove();
					   $("input[name=tami"+i+"]").remove();
					   $("input[name=fdei"+i+"]").remove();
					   $("input[name=cmci"+i+"]").remove(); 
					  if ($("#chk" + i).prop("checked") == false) {
							$("#chk" + i).prop("checked",true);
							
							$('td[name=saltext'+ i +']').text("");
							$('td[name=bsttext'+ i +']').text("");
							$('td[name=nsttext'+ i +']').text("");
							$('td[name=tamtext'+ i +']').text("");
							$('td[name=fdetext'+ i +']').text("");
							$('td[name=cmctext'+ i +']').text("");
							$('td[name=lsttext'+ i +']').text("");
							
							$("td[name=empcode"+ i+ "]").append('<input type="hidden" name=code'+i+'  value='+$('[name=empcode'+i+']').attr('id')+' >');
							$("td[name=saltext"+ i+ "]").append('<input type="text" name=sali'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=saltext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
							$("td[name=bsttext" + i + "]").append('<input type="text" name=bsti'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=bsttext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
							$("td[name=nsttext" + i + "]").append('<input type="text" name=nsti'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=nsttext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
							$("td[name=tamtext"+ i+ "]").append('<input type="text" name=tami'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=tamtext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
							$("td[name=fdetext"+ i+ "]").append('<input type="text" name=fdei'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=fdetext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
							$("td[name=cmctext"+ i+ "]").append('<input type="text" name=cmci'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=cmctext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
							$("td[name=lsttext" + i + "]").append('<input type="text" name=lsti'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=lsttext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
							//$('td[name=saltext'+ i +']').text("");
					   }
					}
				
		  }else {
		  	  $("input[type=checkbox]").prop("checked", false);
				
			  for(var i = 0; i < checklength; i++) {
				
					$("input[name=code" + i + "]").remove();
					
					$('td[name=saltext'+ i +']').text($('[name=saltext'+i+']').attr('id'));
					$("input[name=sali" + i + "]").remove();
					
					$("td[name=bsttext" + i + "]").text($('[name=bsttext'+i+']').attr('id'));
					$("input[name=bsti" + i + "]").remove();
					
					$("td[name=nsttext" + i + "]").text($('[name=nsttext'+i+']').attr('id'));
					$("input[name=nsti" + i + "]").remove();
					
					$('td[name=tamtext'+ i +']').text($('[name=tamtext'+i+']').attr('id'));
					$("input[name=tami" + i + "]").remove();
					
					$('td[name=fdetext'+ i +']').text($('[name=fdetext'+i+']').attr('id'));
					$("input[name=fdei" + i + "]").remove();
					
					$('td[name=cmctext'+ i +']').text($('[name=cmctext'+i+']').attr('id'));
					$("input[name=cmci" + i + "]").remove();
					
					$("td[name=lsttext" + i + "]").text($('[name=lsttext'+i+']').attr('id'));
					$("input[name=lsti" + i + "]").remove();
							
			 }
	
		   }
		});
	}); */
	
	function allcheck() {
		if ($("#checkall").prop("checked") ==false) {//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			$("#checkall").prop("checked",true);
			$("[id ^= checkPoint").addClass("danger");
			for (var i = 0; i < checklength; i++) {
				
				//var code = $('[name=empcode'+i+']').attr('id');
				/* $("input[name=sali"+i+"]").remove();
				   $("input[name=tami"+i+"]").remove();
				   $("input[name=fdei"+i+"]").remove();
				   $("input[name=cmci"+i+"]").remove(); */
				  if ($("#chk" + i).prop("checked") == false) {
						$("#chk" + i).prop("checked",true);
						
						$('td[name=saltext'+ i +']').text("");
					/* 	$('td[name=bsttext'+ i +']').text("");
						$('td[name=nsttext'+ i +']').text(""); */
						$('td[name=tamtext'+ i +']').text("");
						$('td[name=fdetext'+ i +']').text("");
						$('td[name=cmctext'+ i +']').text("");
						//$('td[name=lsttext'+ i +']').text("");
						
						$("td[name=empcode"+ i+ "]").append('<input type="hidden" name=code'+i+'  value='+$('[name=empcode'+i+']').attr('id')+' >');
						$("td[name=saltext"+ i+ "]").append('<input type="text" name=sali'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=saltext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
						/* $("td[name=bsttext" + i + "]").append('<input type="text" name=bsti'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=bsttext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
						$("td[name=nsttext" + i + "]").append('<input type="text" name=nsti'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=nsttext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">'); */
						$("td[name=tamtext"+ i+ "]").append('<input type="text" name=tami'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=tamtext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
						$("td[name=fdetext"+ i+ "]").append('<input type="text" name=fdei'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=fdetext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
						$("td[name=cmctext"+ i+ "]").append('<input type="text" name=cmci'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=cmctext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
						//$("td[name=lsttext" + i + "]").append('<input type="text" name=lsti'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=lsttext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
						//$('td[name=saltext'+ i +']').text("");
				   }
				}
			
	  }else {
		  $("#checkall").prop("checked",false);
	  	  $("input[type=checkbox]").prop("checked", false);
	  	  $("[id ^= checkPoint").removeClass("danger");
		  for(var i = 0; i < checklength; i++) {
				
				$("input[name=code" + i + "]").remove();
				
				$('td[name=saltext'+ i +']').text($('[name=saltext'+i+']').attr('id'));
				$("input[name=sali" + i + "]").remove();
			/* 	
				$("td[name=bsttext" + i + "]").text($('[name=bsttext'+i+']').attr('id'));
				$("input[name=bsti" + i + "]").remove();
				
				$("td[name=nsttext" + i + "]").text($('[name=nsttext'+i+']').attr('id'));
				$("input[name=nsti" + i + "]").remove(); */
				
				$('td[name=tamtext'+ i +']').text($('[name=tamtext'+i+']').attr('id'));
				$("input[name=tami" + i + "]").remove();
				
				$('td[name=fdetext'+ i +']').text($('[name=fdetext'+i+']').attr('id'));
				$("input[name=fdei" + i + "]").remove();
				
				$('td[name=cmctext'+ i +']').text($('[name=cmctext'+i+']').attr('id'));
				$("input[name=cmci" + i + "]").remove();
				
			/* 	$("td[name=lsttext" + i + "]").text($('[name=lsttext'+i+']').attr('id'));
				$("input[name=lsti" + i + "]").remove(); */
						
		 }

	   }
	}
	function check(i) {

		if ($("#chk" + i).prop("checked") == false) {
			
			$("#chk" + i).prop("checked",true);
			$("#checkPoint"+i).addClass("danger");
			//alert(list);
			$('td[name=saltext'+ i +']').text("");
		/* 	$('td[name=bsttext'+ i +']').text("");
			$('td[name=nsttext'+ i +']').text(""); */
			$('td[name=tamtext'+ i +']').text("");
			$('td[name=fdetext'+ i +']').text("");
			$('td[name=fdetext'+ i +']').text("");
			$('td[name=cmctext'+ i +']').text("");
			//$('td[name=lsttext'+ i +']').text("");
			
			$("td[name=empcode" + i + "]").append('<input type="hidden" name=code'+i+'  value='+$('[name=empcode'+i+']').attr('id')+' >');
			$("td[name=saltext" + i + "]").append('<input type="text" name=sali'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=saltext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
			//$("td[name=bsttext" + i + "]").append('<input type="text" name=bsti'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=bsttext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
			//$("td[name=nsttext" + i + "]").append('<input type="text" name=nsti'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=nsttext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
			$("td[name=tamtext" + i + "]").append('<input type="text" name=tami'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=tamtext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
			$("td[name=fdetext" + i + "]").append('<input type="text" name=fdei'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=fdetext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
			$("td[name=cmctext" + i + "]").append('<input type="text" name=cmci'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=cmctext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
			//$("td[name=lsttext" + i + "]").append('<input type="text" name=lsti'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=lsttext'+i+']').attr('id')+' onkeydown="onlyMoneyNumber(this)">');
		} else {
			$("#chk" + i).prop("checked",false);
			$("#checkPoint"+i).removeClass("danger");
			
			$("input[name=code" + i + "]").remove();
			
			$('td[name=saltext'+ i +']').text($('[name=saltext'+i+']').attr('id'));
			$("input[name=sali" + i + "]").remove();
			
/* 			$("td[name=bsttext" + i + "]").text($('[name=bsttext'+i+']').attr('id'));
			$("input[name=bsti" + i + "]").remove();
			
			$("td[name=nsttext" + i + "]").text($('[name=nsttext'+i+']').attr('id'));
			$("input[name=nsti" + i + "]").remove(); */
			
			$('td[name=tamtext'+ i +']').text($('[name=tamtext'+i+']').attr('id'));
			$("input[name=tami" + i + "]").remove();
			
			$('td[name=fdetext'+ i +']').text($('[name=fdetext'+i+']').attr('id'));
			$("input[name=fdei" + i + "]").remove();
			
			$('td[name=cmctext'+ i +']').text($('[name=cmctext'+i+']').attr('id'));
			$("input[name=cmci" + i + "]").remove();
			
	/* 		$("td[name=lsttext" + i + "]").text($('[name=lsttext'+i+']').attr('id'));
			$("input[name=lsti" + i + "]").remove(); */
			
		
		}

	}
 	function update_sal_emp(){
	
		var frm = document.f1;
		
		for(var i=0; i<checklength; i++) {
			
			if($("input[id=chk"+i+"]").prop("checked") == false){
				checkcount++;
			}
			
			if($("input[name=sali"+i+"]").val() == "") {
					
				 alert("급여에 공백이 있습니다. 입력해주세요.");
				 checkcount = 0;
				 break;
			}
			if(checkcount == checklength ) {
				
				alert("아무것도 체크하지 않았습니다.!");
				checkcount = 0;
				return;
			}
			if(checklength-1==i) {
				frm.action ="/spring/update_sal_empcode";
				frm.submit();
				
			}
		}
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main">
	<div class="main-content">

		<div class="container-fluid">
			<h3 class="page-title">직원급여정보</h3>

			<div class="col-lg-12">
				<div class="panel">
					<div class="panel-heading">

						<form id="frm" name="f1" method="POST">
							<div class="panel-body">
								<table class="table table-bordered table-hover">
									<tr onclick="allcheck()">
										<th class="text-center" onclick="allcheck()"><input type="checkbox" id="checkall" /></th>
										<th>사번</th>
										<th>사원이름</th>
										<th>급여</th>
										<th>주휴근무수당</th>
										<th>연장근무수당</th>
										<th>교통비</th>
										<th>식대</th>
										<th>차량유지비</th>
										<th>지각</th>
								
									</tr>
									
									<c:forEach var="tb" items="${list}" varStatus="status">
										<tr id="checkPoint${status.index}">
											<td width="5"   align="center" onclick="check('${status.index}')"><input type="checkbox" id="chk${status.index}" onclick="check('${status.index}')"></td>
											<td width="50"  name="empcode${status.index}" id="${tb.EMP_EMNO}" onclick="check(${status.index})">${tb.EMP_EMNO}</td>
											<td width="100" onclick="check(${status.index})">${tb.EMP_NAME}</td>
											<td width="100" name="saltext${status.index}" id="${tb.SEMP_SAL}" align="center">${tb.SEMP_SAL}</td>
											<td width="100" name="bsttext${status.index}" id="${tb.SEMP_BW_CST}" align="center">${tb.SEMP_BW_CST}</td>
											<td width="100" name="nsttext${status.index}" id="${tb.SEMP_NW_CST}" align="center">${tb.SEMP_NW_CST}</td>
											<td width="100" name="tamtext${status.index}" id="${tb.SEMP_TAMT}" align="center">${tb.SEMP_TAMT}</td>
											<td width="100" name="fdetext${status.index}" id="${tb.SEMP_FDEX}" align="center">${tb.SEMP_FDEX}</td>
											<td width="100" name="cmctext${status.index}" id="${tb.SEMP_CMC}" align="center">${tb.SEMP_CMC}</td>
											<td width="100" name="lsttext${status.index}" id="${tb.SEMP_L_CST}" align="center">${tb.SEMP_L_CST}</td>
										</tr>	
									</c:forEach>
								</table>
								<input type="button" class="btn btn-info" value="저장" onclick="update_sal_emp();">
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