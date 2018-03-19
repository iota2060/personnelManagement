<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<script>
	function pageMove(){
			var formAction = document.getElementById('formId');
			formAction.submit();
	}
	
</script>

<body>
	 <form id="formId" method="get" action="/spring/requestParamTest07.do" >
	id : <input type="text" name="id" id="id">	
	name : <input type="text" name="name" id="name">	
	email : <input type="text" name="email" id="email">	
	<p> 취미 : <input type="checkbox" name="hobby" value="baseball">야구,
			<input type="checkbox" name="hobby" value="basketball">농구
	<p> 성별 : <input type="radio" name="sex" value="man">남자,
			<input type="radio" name="sex" value="woman">여자
	<p> 동물 : 
			<select name="selAnimal">
				<option value="dog">강아지</option>
				<option value="cow">소</option>
				<option value="cat">고양이</option>
				<option value="cat">고양이</option>
			</select>		
	
	</form>
	<button type="button" id="btnIdInput" onClick="pageMove()">입력</button>
</body>
</html>