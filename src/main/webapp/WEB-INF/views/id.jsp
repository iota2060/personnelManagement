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
	 <form id="formId" method="get" >
	id : <input type="text" name="id" id="id">	
	</form>
	<button type="button" id="btnIdInput" onClick="pageMove()">입력</button>
</body>
</html>