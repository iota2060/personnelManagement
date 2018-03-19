<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!-- 메뉴 수정   -->
<div class="panel-heading">
	<h3 class="panel-title" style="font-size: 16px" id="">
		${map.mnPrntName}								
	</h3>
</div>
<!-- 메뉴 수정  form 시작 -->
<div class="panel-body">
	<form action="" name="insertForm" id="updateForm" method="POST">
		<div class="form-group row">
			<input type="hidden" name="mnNo" value="${map.mnNo}">
			<label for="mnName" class="col-sm-2 col-form-label">메뉴명</label>
			<div class="col-sm-10" id="mnName">
				<input type="text" class="form-control" name="mnName" value="${map.mnName}">
			</div>
		</div>
		<div class="form-group row">
			<label for="mnUrl" class="col-sm-2 col-form-label">URL</label>
			<div class="col-sm-10" id="mnUrl">
				<input type="text" class="form-control" name="mnUrl" value="${map.mnUrl}">
			</div>
		</div>
		<div class="form-group row">
			<label for="mnUse" class="col-sm-2 col-form-label">공개여부</label>
			<div class="col-sm-10" id="mnUse">
				<input class="form-check-input" type="radio" name="mnUseYn" id="mnUseY" value="Y" <c:out value="${map.mnUseYn eq 'Y' ? 'checked' : ''}"/>>
				<label class="form-check-label" for="mnUseY">메인</label>
				<input class="form-check-input" type="radio" name="mnUseYn" id="mnUseN" value="N"<c:out value="${map.mnUseYn eq 'N' ? 'checked' : ''}"/>>
				<label class="form-check-label" for="mnUseN">서브</label>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="mnAttr">메뉴속성</label>
			<div class="col-sm-10" id="mnAttr">
				<input type="radio" class="form-check-input" id="attrAll" name="mnAttr" value="all">
				<label class="form-check-label" for="attrAll">전체</label>
				<input type="radio" class="form-check-input" id="attrInsert" name="mnAttr" value="insert" <c:if test="${fn:indexOf(map.mnAttr, 'insert') != -1}">checked="checked"</c:if>>
				<label class="form-check-label" for="attrInsert">등록</label>
				<input type="radio" class="form-check-input" id="attrUpdate" name="mnAttr" value="update" <c:if test="${fn:indexOf(map.mnAttr, 'update') != -1}">checked="checked"</c:if>>
				<label class="form-check-label" for="attrUpdate">수정</label>
				<input type="radio" class="form-check-input" id="attrDelete" name="mnAttr" value="delete" <c:if test="${fn:indexOf(map.mnAttr, 'delete') != -1}">checked="checked"</c:if>>
				<label class="form-check-label" for="attrDelete">삭제</label>
				<input type="radio" class="form-check-input" id="attrView" name="mnAttr" value="view" <c:if test="${fn:indexOf(map.mnAttr, 'view') != -1}">checked="checked"</c:if>>
				<label class="form-check-label" for="attrView">조회</label>
			</div>
		</div>	
		<div class="form-group row">
			<label for="mnIdxBtn" class="col-sm-2 col-form-label">카테고리 정렬</label>
			<div class="col-sm-10" id="mnIdxBtn">
				<button type="button" class="btn btn-default" name="up">위</button>
				<button type="button" class="btn btn-default" name="down">아래</button>
				<button type="button" class="btn btn-default" name="top">맨위로</button>
				<button type="button" class="btn btn-default" name="buttom">맨아래로</button>
			</div>
			<input type="hidden" name="mnIdxStr" value=""/>
		</div>
	</form>
	<div class="text-right">
		<button type="button" class="btn btn-info" onclick="menuUpdate()">적용</button>
		<button type="button" class="btn btn-danger" onclick="menuEsc()">취소</button>
	</div>
</div>
<!-- 메뉴 수정  form 끝-->
