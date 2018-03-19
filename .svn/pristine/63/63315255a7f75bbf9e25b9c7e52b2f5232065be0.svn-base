<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!-- 상위 메뉴 정보  -->
<div class="panel-heading">
	<h3 class="panel-title" id="">
		상위메뉴 : ${map.mnPrntName}
	</h3>
</div>
<!-- 메뉴 상세 정보 table 시작-->
<div class="panel-body">
	<table class="table table-bordered">
		<colgroup>
			<col width="25%">
			<col width="75%">
		</colgroup>
		<tbody>
			<tr>
				<th>메뉴코드</th>
				<td name="mnNo">${map.mnNo}</td>
			</tr>
			<tr>
				<th>메뉴명</th>
				<td name="mnName">${map.mnName}</td>
			</tr>
			<tr>
				<th>url</th>
				<td name="mnUrl">
				<c:if test="${map.mnUrl==''}"><span style="color:red;">하위메뉴가 있는경우 연결 ID 값을 작성해주세요</span></c:if>
					${map.mnUrl}
				</td>
			</tr>
			<tr>
				<th>메인여부</th>
				<td name="mnUseYn">${map.mnUseYn}</td>
			</tr>
			<tr>
				<th>순번</th>
				<td name="mnIdx">${map.mnIdx}</td>
			</tr>
			<tr>
				<th>생성일자</th>
				<td name="mnCrt">${map.mnCrt}</td>
			</tr>
			<tr>
				<th>수정일자</th>
				<td name="mnUpdt">${map.mnUpdt}</td>
			</tr>
			<tr>
				<th>속성</th>
				<td name="mnAttr">${map.mnAttr}</td>
			</tr>
		</tbody>
	</table>
	<div class="text-right">
		<button type="boutton" class="btn btn-info" onclick="menuUpdateForm()">수정</button>
		<button type="boutton" class="btn btn-danger" onclick="menuDelete()">삭제</button>
	</div>
</div>
<!-- 메뉴 상세 정보 table 끝-->
