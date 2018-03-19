<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!-- mnName  -->
<div class="panel-heading">
	<h3 class="panel-title" id="mnNo" name="${menuList.mnNo}">${menuList.mnName} : ${menuList.mnUrl}</h3>
</div>
<!-- 메뉴 상세 정보 table 시작-->
<div class="panel-body">
	<table class="table table-bordered">
		<thead>
			<tr>	
				<th class="text-center">권한유형</th>
				<th class="text-center">적용시작날짜</th>
				<th class="text-center">적용종료날짜</th>
				<th class="text-center">수정시작날짜</th>
				<th class="text-center">수정종료날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${authoData ne null}"> 
			<tr>
				<td>${authoData.atrAttr}</td>
				<td>${authoData.atrAplyStrt}</td>
				<td>${authoData.atrAplyFini}</td>
				<td>${authoData.atrUpdtStrt}</td>
				<td>${authoData.atrUpdtFini}</td> 
			</tr>
		</c:if> 		
		</tbody>
	</table>
	<c:if test="${authoData eq null && fn:indexOf(menuList.mnUrl,'#')<0}"><p>해당 메뉴로 등록된 권한이 없습니다.</p></c:if>
	<div class="text-right">
		<c:if test="${fn:length(authoData)==0 && fn:indexOf(menuList.mnUrl,'#')<0}">
			<button type="button" name="insertBtn" class="btn btn-info">등록</button>
		</c:if>
		<c:if test="${fn:length(authoData)>0}">
			<button type="button" name="updateBtn" class="btn btn-info">수정</button>
		</c:if>	
	</div>
</div>
<!-- 메뉴 상세 정보 table 끝-->    