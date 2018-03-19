<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정보기</title>
<!-- fullcalendar -->
<link href="/spring/resources/common/fullcalendar/css/fullcalendar.min.css" rel="stylesheet"/>
<link href="/spring/resources/common/fullcalendar/css/fullcalendar.print.min.css" rel="stylesheet" media="print"/>
<link href="/spring/resources/common/fullcalendar/css/jquery.timepicker.css" rel="stylesheet"/><!-- 시간선택 -->
<script src="/spring/resources/common/fullcalendar/js/moment.min.js"></script>
<script src="/spring/resources/common/fullcalendar/js/fullcalendar.min.js"></script>
<script src="/spring/resources/common/fullcalendar/js/ko.js"></script><!-- 한글패치 -->
<script src="/spring/resources/common/fullcalendar/js/gcal.js"></script><!-- 구글캘린더 -->
<script src="/spring/resources/common/fullcalendar/js/jquery.timepicker.min.js"></script><!-- 시간선택 -->
</head>
<body>
	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">일정관리</h3><br>
				<!-- OVERVIEW -->
				<div class="row">
					<div class="col-md-10">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h4 class="panel-title" style="font-size:20px; padding-left:15px;">일정 보기</h4>
							</div>
							
							<div>
								<input type="checkbox" id="department">회사일정
							</div>
							
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="panel">
							<div id="calendar">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<!-- Date Insert Modal -->
	<div id="insertModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-md">
    		<div class="modal-content">
     			<div class="modal-header">
					<h4 class="modal-title">일정 등록하기</h4>
				</div>
				<div class="modal-body">
				
					<div class="row">
						<div class="col-md-10" style="padding-top:20px;">
							<form id="insertForm" method="post">
								<input type="hidden" value="1111111111" name="emno">
								<input type="hidden" value="1" name="deptCode">
								<input type="hidden" value="" name="id">
								<input type="checkbox" name="departmentCheck">회사일정
								<p>제목<p><input type="text" name="title">
								<p>내용<p><textarea rows="7" cols="70" name="content" style="resize:none"></textarea>
								<p>날짜<p><input type="text" size=8 id="startDate" name="startDate" value="">
										<input type="text" name="startTime" value="" placeholder="시간선택" id="startTime" size="5">
										~<input type="text" size=8 id="endDate" name="endDate" placeholder="날짜선택">
										<input type="text" name="endTime" value="" placeholder="시간선택" id="endTime" size="5">
							</form>
							<div class="modal-footer">
								<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">저장</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>	
    		</div>
  		</div>
	</div>
	
	<!-- Data View Modal -->
	<div id="viewModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-md">
    		<div class="modal-content">
     			<div class="modal-header">
					<h4 class="modal-title">일정 상세보기</h4>
				</div>
				<div class="modal-body">	
					<div class="row">
						<div class="col-md-10" style="padding-top:20px;">
							<form id="viewForm">
								<p><input type="hidden" value="" name="emno">
								<p><input type="hidden" value="" name="seq">
								<p><input type="hidden" value="" name="deptCode">
								<input type="checkbox" name="departmentCheck">회사일정 
									<p>제목<p><input type="text" name="title" value="">
									<p>내용<p><textarea rows="7" cols="70" name="content" style="resize:none"></textarea>
									<p>날짜<p><input type="text" size=8 id="startDate" name="startDate" value="">
											<input type="text" name="startTime" value="" id="startTime" size="5">
											~<input type="text" size=8 id="endDate" name="endDate" value="">
											<input type="text" name="endTime" value="" id="endTime" size="5">
							</form>
							<div class="modal-footer">
								<button type="button" id="updateBtn" class="btn btn-default" data-dismiss="modal">수정</button>
								<button type="button" id="deleteBtn" class="btn btn-default" data-dismiss="modal">삭제</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>	
    		</div>
  		</div>
	</div>
</body>
</html>