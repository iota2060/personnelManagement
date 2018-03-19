<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<H1>아웃풋</H1>
	<p>id : ${params.id } </p>
	<p>name : ${params.name } </p>
	<p>email : ${params.email } </p>
	<p>hobby :
	<c:forEach var="hobby" items="${params.hobby }">
		${hobby } &nbsp;
	</c:forEach>
	
<%-- 	<c:forEach var ="animal" items="${animal }"> --%>
<%-- 		${animal } &nbsp; --%>
		
<%-- 	</c:forEach> --%>
	
</body>
</html>