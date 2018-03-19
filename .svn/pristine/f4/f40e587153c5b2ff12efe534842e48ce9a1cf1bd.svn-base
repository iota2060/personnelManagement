<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*, java.text.*"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="resources/common/js/jquery-3.2.1.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<script src="resources/common/js/paging.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/vendor/bootstrap/css/bootstrap.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/vendor/font-awesome/css/font-awesome.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/vendor/linearicons/style.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/vendor/chartist/css/chartist-custom.css"/>">
	<!-- MAIN CSS -->
	
	<link href="<c:url value="/resources/common/assets/css/main.css" />" rel="stylesheet">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="<c:url value="/resources/common/assets/css/demo.css"/>">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">

	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">

	<script type="text/javascript">
		
/* 		 function ajaxFormSubmit(url,formId){
			
			paging.ajaxFormSubmit(url,formId,function(rslt){
				
				console.log("결과데이터 "+JSON.stringify(rslt));
				
				if(rslt.success == "true") {
					
					alert("취미를 야구로 선택하셨습니다.");
				}else {
					
					frm.action="/spring/departmentList.do"
					frm.submit();
				}
			});
			
		} */
	 	function makePayc(formId) {
			
	/* 		var pyy = $("#pyy").val();
			var pmm = $("#pmm").val();
			var pyymm = (pyy+pmm);
			
			var paycname = $("#paycname").val();
			
			var payyy = $("#payyy").val();
			var paymm = $("#paymm").val();
			var paytoday = $("paytoday").val();
			
			var payday = $("#payyy").val()+$("#paymm").val();+$("#paytoday").val();
			var payyymm = $("#payyy").val()+$("#paymm").val();
			 */

			 var json;
			//var json = {"pyymm":pyymm, "paycname":paycname, "payday":payyy+paymm+paytoday, "payyymm":payyy+paymm}; 
			 $("#" + formId).ajaxForm({
				
				url:"/spring/makePayc.ajax",
				type:'GET',
				data:json,
				
				success:function(data) {
					
					window.opener.location.reload();
					
					if(data.success == "true") {
						
						alert("저장성공!");
					}else {
						
						alert("중복된 급여대장이 있습니다.");
					}
					console.log("결과데이터 : "+JSON.stringify(data));
					self.close();
				},
				
				error:function(jqXHR, textStatus, errorThrown){
					alert("중복된 급여대장이 있습니다. \n" + textStatus + " : " + errorThrown);
		            self.close();
				}
				
			}).submit();
		} 
	 /* function makePayc() {
		
			var url = "/spring/makePayc.do";
			frm.action=url;
			frm.target="fn";
			frm.submit();
			//self.close();
			//alert("");
			//opener.parent.location.reload();
			
		} */
	</script>
</head>
<body>

<form id="frm" name="fn">
	<table border ="1" height="200" width="400">
		<tr>
			<td>
				귀속년월
			</td>
			
			<td>
				<select name ="pyy">
					<c:forEach var="year" items="${year}" >
       				 	<option>${year}</option> 
   					</c:forEach>
					
				</select>
		
			
				 <select name="pmm">
					<c:forEach var="month" items="${month}" >
       				 	<option>${month}</option> 
   					</c:forEach>
				  
				 </select> 
			</td>
		</tr>
		
		<tr>
			<td>
				대상기간
			</td>
			
			<td>
				<select name ="perSyy">
					<c:forEach var="year" items="${year}" >
       				 	<option>${year}</option> 
   					</c:forEach>
					
				</select>
		
			
		
				<select name="perSmm">
					<c:forEach var="month" items="${month}" >
       				 	<option>${month}</option> 
   					</c:forEach>
				 
				</select> 
				 
				 		<input type ="text" value="1" name="perSday"style="width:20px; height:22px" >
				 
				<p>
				<select name ="perEyy">
					<c:forEach var="year" items="${year}" >
       				 	<option>${year}</option> 
   					</c:forEach>
					
				</select> 
		
			
		
				  <select name ="perEmm">
				 	<c:forEach var="month" items="${month}" >
       				 	<option>${month}</option> 
   					</c:forEach>
				 
				 
				 </select>
				  <input type ="text" value="${lastday}" name="perEday"style="width:20px; height:22px" >
				 
			</td>
		</tr>
		
		<tr>
			<td>
				지급일
			</td>
			
			<td>
				 <select name ="payyy">
					<c:forEach var="year" items="${year}" >
       				 	<option>${year}</option> 
   					</c:forEach>
					
				 </select> 
		
			
		
				<select name="paymm">
				 	<c:forEach var="month" items="${month}" >
       				 	<option>${month}</option> 
   					</c:forEach>
				 
				 
				</select> 
				
				<input type="text" value="${today}" name="paytoday" style="width:20px; height:22px">
			</td>
				
		</tr>
		
		<tr>
			<td>
				급여대장이름
			</td>
			
			
			<td>
				<input type="text" name= "paycname" style="font-size:8pt;" >
			</td>
		</tr>
	
	
	
		</table>
		<div class="text-left">
								
		
				<input type="button" class="btn btn-info" value ="저장" onclick="makePayc('frm')"></button>
		
								
		</div>
	</form>
</body>
</html>