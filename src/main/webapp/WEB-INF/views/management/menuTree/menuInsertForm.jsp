<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<div class="panel-heading">
<!-- 메뉴등록    -->
	<h3 class="panel-title" style="font-size: 16px" id="">
		메뉴 등록								
	</h3>
</div>
<!-- 메뉴등록 form 시작  -->
<div class="panel-body">
	<form action="" name="insertForm" id="insertForm" method="POST">
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">메뉴명</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="mnName" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">URL</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="mnUrl" placeholder="하위메뉴 존재 시에는 연결 아이디 값을 작성해주세요.ex)#아이디명 url의 경우 ex)test.do" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">메인여부</label>
			<div class="col-sm-10">
				<input class="form-check-input" type="radio" name="mnUseYn" id="mnUseY" value="Y">
				<label class="form-check-label" for="mnUseY">메인</label>
				<input class="form-check-input" type="radio" name="mnUseYn" id="mnUseN" value="N">
				<label class="form-check-label" for="mnUseN">서브</label>
			</div>
		</div>
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">메뉴속성</label>
			<div class="col-sm-10">
				<input type="radio" class="form-check-input" id="attrAll" name="mnAttr" value="all">
				<label class="form-check-label" for="attrAll">전체</label>
				<input type="radio" class="form-check-input" id="attrInsert" name="mnAttr" value="insert">
				<label class="form-check-label" for="attrInsert">등록</label>
				<input type="radio" class="form-check-input" id="attrUpdate" name="mnAttr" value="update">
				<label class="form-check-label" for="attrUpdate">수정</label>
				<input type="radio" class="form-check-input" id="attrDelete" name="mnAttr" value="delete">
				<label class="form-check-label" for="attrDelete">삭제</label>
				<input type="radio" class="form-check-input" id="attrView" name="mnAttr" value="view">
				<label class="form-check-label" for="attrView">조회</label>
				<input type="hidden" name="mnPrntNo" value="0">
				<input type="hidden" name="mnIdx" value="">
			</div>
		</div>
	</form>
	<div class="text-right">
		<button type="button" class="btn btn-info" onclick="menuInsert()">저장</button>
		<button type="button" class="btn btn-danger" onclick="menuEsc()">취소</button>
	</div>
</div>
<!-- 메뉴등록 form 끝 -->