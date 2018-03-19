<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


 	<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="panel panel-headline">
						
						
						<div class="panel-heading">
							<h3 class="panel-title">사원조회</h3>
							
								
				 				<table class="table table-bordered">
								<tr>
									<td>
										사원번호
									</td>
									<td>
										성명
									</td>
									
									<td>
										직책
									</td>
									
									<td>
										부서
									</td>
									
									<td>
										입사일자
									</td>
									<td>
										핸드폰
									</td>
									
									<td>
										회사이메일
									</td>
									
									<td>
										주소
									</td>
									
								</tr>
								
							<!-- 작업중 -->
							
							<c:forEach items="${list}" var="list" varStatus="status">
							
							
								<tr onclick="getEmno(${status.index})">
								
									<td id="emno${status.index}" name="${list.emp_emno}">${list.emp_emno}</td>
										
									<td>
										${list.emp_name}
									</td>
									
									 <td>
									  보류
									<!--직위(sql join) 	랭크 -->
									</td>
									<td>
										${list.dept_code}
									</td>
									
									<td>
										${list.emp_inco_date}
									</td>
									
									<td>
										${list.emp_tno}
									</td>
									<td>
										${list.emp_email}
									</td>
									
									<td>
										${list.emp_addr}
									</td>
									
									<td>
										<button type="button" id="delete-btn${status.index}" class="btn btn-default" onClick="emp_delete('${status.index}')">
										<i class ="fa fa-trash-o">
										</i>
										</button>
									</td>
									
								</tr>
								
								
							</c:forEach>
							
								
							
								
								
								
							
							
							</table>
							
							
							
						</div>
					</div>
						
						
						<div class="panel_body">
							
				 				<form id="update">
				 				<div class="col-md-9">
				 				
				 				<table class="table table-bordered">
				 					<tr>
				 						<td rowspan="2">
				 							
				 						</td>
				 						<td>
				 							성명(한글)<input type="text" name="empName"> 
				 						</td>
				 						
				 						<td>
				 							생년월일 <input type="text" name="empBday">
				 						</td>
				 					</tr>
				 					
				 					<tr>
				 						<td>
				 							성명(영문)<input type="text" name="empEname">
				 						</td>
				 						
				 						<td>
				 							전화번호<input type="text" name="empTno">
				 						</td>
				 					</tr>
				 					
				 					
				 					
				 				</table>
				 				</div>
				 				
				 				<div class="col-md-4">
				 				<table class="table table-hover">
				 					
				 					
				 					<tr>
				 						<td>
				 								사원번호<input type="text" name="empEmno" readonly/> 
				 						</td>
				 						
				 						<td>
				 						</td>
				 					</tr>
				 					
				 					<tr>
				 						<td>
				 								사원 ID<p><input type="text" name="empId"> 
				 						</td>
				 						
				 						<td>
				 								사원 PW<p><input type="text" name="empPw">
				 						</td>
				 					</tr>
				 				
				 					<tr>
				 						<td>
				 								병역여부 <input type="text" name="armyYN">
				 						</td>
				 					
				 						<td>
				 								직위/직급<input type="text" name="position">
				 						</td>
				 					</tr>
				 					
				 					<tr>
				 						<td>
				 								입사일 <p><input type="text" name="empIncodate"> 
				 						</td>
				 						
				 						<td>
				 								개인계좌 <input type="text" name="bankAcount">
				 						</td>
				 					</tr>
				 					
				 					<tr>
				 						<td>
				 								입사코드
				 								<select name="ictyCode">
							    					<option value="1">1</option>
							    					<option value="2">2</option>
							    				</select>
							   
				 						</td>
				 						
				 						<td>
				 								부서코드
				 								<select name="deptCode">
											    	<option value="1">마켓팅</option>
											   		<option value="2">개발</option>
												</select>
				 						</td>
				 					</tr>
				 					
				 					<tr>
				 						<td>
					 							직위/직급 코드
					 							<select name="rankCode">
								    				<option value="1">팀장</option>
								    				<option value="2">사원</option>
								   
												</select>
				 						</td>
				 						
				 						<td>
				 							등록날짜<input type="text" name="empRegDate">
				 						</td>
				 					</tr>
				 				</table>
				 				
				 				<input type="button" value="수정" onclick="emp_update('update')">
								<input type="button" value="삭제" onclick="emp_deletc('update')">
				 				</form>
				 			
				 			
				 			
				 				<form id="insert">
				 				<button type="button" class = "btn btn-success btn-xxs" data-backdrop="static" data-keyboard="false" 
												data-toggle="modal" data-target="#myModal" 
												data-title="Test Title" onclick="">신규등록</button>
								  <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true">

									<div class="modal-dialog">
										<div class="modal-content">
										
										
											<div class="modal-header">
												<!-- 모달버튼 헤더 -->
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">신규 직원등록</h4>
											</div>

											
												<div class="modal-body">
													<table class="table table-bordered tbl01">
													
														<tr>
									 						<td rowspan="3" width="150px" nowrap>
									 							
									 						</td>
									 						<td>
									 								성명(한글)<input type="text" name="empName"> 
									 						</td>
									 						
									 						<td>
									 								생년월일 <input type="text" name="empBday">
									 						</td>
									 					</tr>
									 					
									 					<tr>
									 					
					
									 						
									 						<td>
									 								성명(영문)<input type="text" name="empEname">
									 						</td>
									 						
									 						<td>
									 								전화번호<input type="text" name="empTno">
									 						</td>
									 					</tr>
									 					
									 					<tr>
									 						
									 						
									 						<td>
									 								사원번호<input type="text" name="empEmno" > 
									 						</td>
									 						
									 						<td>
									 						</td>
									 					</tr>
									 					
									 					<tr>
									 						<td rowspan="5">
									 						
									 						</td>
									 						<td>
									 								사원 ID<p><input type="text" name="empId"> 
									 						</td>
									 						
									 						<td>
									 								사원 PW<p><input type="text" name="empPw">
									 						</td>
									 					</tr>
									 				
									 					<tr>
									 						<td>
									 								병역여부 <input type="text" name="armyYN">
									 						</td>
									 					
									 						<td>
									 								직위/직급<input type="text" name="position">
									 						</td>
									 					</tr>
									 					
									 					<tr>
									 						<td>
									 								입사일 <p><input type="text" name="empIncodate"> 
									 						</td>
									 						
									 						<td>
									 								개인계좌 <input type="text" name="bankAcount">
									 						</td>
									 					</tr>
									 					
									 					<tr>
									 						<td>
									 								입사코드
									 								<select name="ictyCode">
												    					<option value="1">1</option>
												    					<option value="2">2</option>
												    				</select>
												   
									 						</td>
									 						
									 						<td>
									 								부서코드
									 								<select name="deptCode">
																    	<option value="1">마켓팅</option>
																   		<option value="2">개발</option>
																	</select>
									 						</td>
									 					</tr>
									 					
									 					<tr>
									 						<td>
										 							직위/직급 코드
										 							<select name="rankCode">
													    				<option value="1">팀장</option>
													    				<option value="2">사원</option>
													   
																	</select>
									 						</td>
									 						
									 						<td>
									 							등록날짜<input type="text" name="empRegDate">
									 						</td>
									 					</tr>
													</table>
												</div>
												
												<div class="modal-footer">
													
													<button type="button" class="btn btn-default pull-left"
														data-dismiss="modal">닫기</button>
													<button type="button" class="btn btn-primary"
														data-dismiss="modal" onclick="emp_insert('insert')">저장</button>
												
												</div>
											
										</div>
									</div>
								</div>
								</form>
						</div>
						
					</div>
							
								
							
															
					 			<!-- <input type="button" value="신규등록" onclick="emp_insert('insert')"> -->
								<!-- onclick 링크이용 -->
									
								
				 				
		
							
							</div>
						
			
	
				</div>
			</div>
		</div>
	
	
	
  
 	
 	<script>
 		
 	function emp_insert(formId) {
 		
 		var json;
 		
 		$("#" + formId).ajaxForm({
	
			url : "/spring/emp_insert.ajax",
			type : 'GET',
			data : json,
			
			
			
			success : function(data) {
				console.log("결과데이터 : "+JSON.stringify(data));
				alert("저장성공!");
				location.reload();
				
			},
				
			error:function(jqXHR, textStatus, errorThrown){
					alert("사원번호가 중복되었습니다.다시 입력해주세요 \n" + textStatus + " : " + errorThrown);
				            
			}
		}).submit();
 	}
 	
 	function getEmno(i){
 		
 		var emno = $("td[id=emno"+i+"]").attr('name');
 		//alert(emno);
 		var json={"emno" : emno};
 		$.ajax({
 			
 			url : "/spring/emp_select.ajax",
			type : 'GET',
			data : json,
			
			
			
			success : function(data) {
				console.log("결과데이터 : "+JSON.stringify(data));
				
				$("[name=empName]").val(data.list[0].emp_name);
				$("[name=empBday]").val(data.list[0].emp_bday);
				$("[name=empEname]").val(data.list[0].emp_ename);
				$("[name=empTno]").val(data.list[0].emp_tno);
				$("[name=empEmno]").val(data.list[0].emp_emno);
				$("[name=empId]").val(data.list[0].emp_id);
				$("[name=empPw]").val(data.list[0].emp_pswd);
				$("[name=armyYN]").val(data.list[0].emp_mits_yn);
				$("[name=emplncodaate]").val(data.list[0].emp_inco_date);
				
				$("[name=empRegDate]").val(data.list[0].emp_reg_date);
				
				
			},
				
			error:function(jqXHR, textStatus, errorThrown){
					alert("에러 \n" + textStatus + " : " + errorThrown);
				            
			}
 		}); 
 	}
 	
 	function emp_update(formId){
 		
		var json;
 		
 		$("#" + formId).ajaxForm({
 			
			url : "/spring/emp_update.ajax",
			type : 'GET',
			data : json,
			
			
			
			success : function(data) {
				console.log("결과데이터 : "+JSON.stringify(data));
				alert("수정 성공!");
				
				
			},
				
			error:function(jqXHR, textStatus, errorThrown){
					alert("수정을 실패하였습니다 \n" + textStatus + " : " + errorThrown);
				            
			}
		}).submit();
 	}
 	//delete
 		
	function emp_delete(i){
		var emno = $("td[id=emno"+i+"]").attr('name');
 		//alert(emno);
 		var json = {"emno":emno};
	 		
	 		$.ajax({
	 			
				url : "/spring/emp_delete.ajax",
				type : 'GET',
				data : json,
				
				
				
				success : function(data) {
					console.log("결과데이터 : "+JSON.stringify(data));
					alert("삭제 성공!");
					location.reload();
					
					
				},
					
				error:function(jqXHR, textStatus, errorThrown){
						alert("삭제가 되지 않았습니다.\n" + textStatus + " : " + errorThrown);
					            
				}
			});
	 	}
	 	
	 	
 	

 	</script>
</body>
</html>