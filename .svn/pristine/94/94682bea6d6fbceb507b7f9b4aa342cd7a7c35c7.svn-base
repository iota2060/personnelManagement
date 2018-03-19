<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script>
	$(document).on("click", "button[name=addTr]", function(){
		var addStaffText =  '<tr name="vacationOption">'+
							'<td class="w3"><label class="fancy-checkbox-inline"><input type="checkbox" id="chk"><span></span></label></td>' +
							'<td class="w10"><input type="text" class="form-control w_80" value="휴가" ></td>' +
							'<td class="w10"><input type="text" class="form-control w_80" ></td>' +
							'<td class="w20"><input type="text" class="form-control" ></td>' +
							'<td class="w10"><label class="fancy-checkbox-inline"><input type="checkbox" ><span></span></label><input type="hidden"></td>' +
							'<td class="w10"><label class="fancy-checkbox-inline"><input type="checkbox" ><span></span></label><input type="hidden"></td>' +
							'<td class="w37"><input type="text" class="form-control w_300" ></td>' +
							'</tr>';
							
		$("#vacationOptionTable #headTr").before(addStaffText);
	});
	
	$(document).on("click", "button[name=deleteTr]", function(){
		var $obj = $('input:checkbox[id="chk"]');
		var checkCount = $obj.size();
		
		for(var i = 0 ; i < checkCount ; i++){
			if($obj.eq(i).is(":checked")){
				$obj.eq(i).parent().parent().parent().remove();
			}
		}
	});
	
	function selectAll(){
		var obj = $('input:checkbox[id="selectAll_chk"]');

		var $obj2 = $('input:checkbox[id="chk"]');
		var $obj3 = $('input:checkbox[id="notDeleteChk"]');
		
		if(obj.is(":checked")){
			$obj2.prop("checked", true);
			$obj3.prop("checked", true);
		}else{
			$obj2.prop("checked", false);
			$obj3.prop("checked", false);
		}
	}
	
// 	$(function(){
		
// 	});
	
	
	function insertForm(){
		$("#insertForm").submit();
	}

	function insertDB(formId){
		var checkCount = $('input:checkbox[id="chk"]');
		
		//네임값 배열
		var nameString = new Array('', 'divide', 'code', 'title', 'AnnualLeaveReflectionCheckbox', 'UseOrFailureCheckbox', 'note');
		
		//체크되있는것들만 네임 부여함.
		$('input:checkbox[id="chk"]').each(function(){
			if($(this).prop('checked')){
				
				var progTr = $(this).closest('tr');
				var progTd = progTr.children().eq(1);
				
				
				for(var i = 0 ; i < 7 ; i++ ){
					//tr안에 몇번째 td인지 체크해주는 거
					var progTd = progTr.children().eq(i);
						
					//1,2,3,6번째 td는 input text가 td 밑에 있기떄문에 children() 한번해줌.
					if(i == 1 || i == 2 || i == 3 || i==6){
						var inputName = progTd.children();
						
						//네임부여함.
						inputName.attr({
							name : nameString[i]
						});
					}else if(i == 4){
						var inputName = progTd.children().children();
						
						inputName.attr({
							name : nameString[i]
						});
						
						var inputHiddenName = progTd.children().eq(1);
						inputHiddenName.attr({
							name : "AnnualLeaveReflection"
						});
					}else if(i==5){
						var inputName = progTd.children().children();
						
						inputName.attr({
							name : nameString[i]
						});
						
						var inputHiddenName = progTd.children().eq(1);
						inputHiddenName.attr({
							name : "UseOrFailure"
						});
					}
				}
			}
		});
		
		//체크되있는것들만 네임 부여함.
		$('input:checkbox[id="notDeleteChk"]').each(function(){
			if($(this).prop('checked')){
				var progTr = $(this).closest('tr');
				var progTd = progTr.children().eq(1);
				
				
				for(var i = 0 ; i < 7 ; i++ ){
					var progTd = progTr.children().eq(i);
					
					if(i == 1 || i == 2 || i == 3 || i==6){
						var inputName = progTd.children();
						
						inputName.attr({
							name : nameString[i]
						});
					}else if(i == 4){
						var inputName = progTd.children().children();
						
						inputName.attr({
							name : nameString[i]
						});
						
						var inputHiddenName = progTd.children().eq(1);
						inputHiddenName.attr({
							name : "AnnualLeaveReflection"
						});
					}else if(i==5){
						var inputName = progTd.children().children();
						
						inputName.attr({
							name : nameString[i]
						});
						
						var inputHiddenName = progTd.children().eq(1);
						inputHiddenName.attr({
							name : "UseOrFailure"
						});
					}
				}
			}
		});
		
		var AnnualLeaveReflectionCheckbox = $("input[name='AnnualLeaveReflectionCheckbox']");
		var UseOrFailureCheckbox = $("input[name='UseOrFailureCheckbox']");
		var count = AnnualLeaveReflectionCheckbox.size();
		
		var AnnualLeaveReflectionCheckboxresult = $("input[name='AnnualLeaveReflectionCheckbox']").prop("checked");
		var UseOrFailureCheckboxresult = $("input[name='UseOrFailureCheckbox']").prop("checked");
		
		var AnnualLeaveReflection = $("input[name='AnnualLeaveReflection']");
		var UseOrFailure = $("input[name='UseOrFailure']");
		
		$("input[name='AnnualLeaveReflectionCheckbox']").val(AnnualLeaveReflectionCheckboxresult);
		$("input[name='UseOrFailureCheckbox']").val(UseOrFailureCheckboxresult);
		
		//checkbox에 체크되어있으면 해당하는 hidden에 true값 넣어주고 아니면 false값 넣어줌.
		for(var i = 0 ; i < count ; i++){
			if(AnnualLeaveReflectionCheckbox.eq(i).is(":checked")){
				AnnualLeaveReflection.eq(i).val('true');
			}else{
				AnnualLeaveReflection.eq(i).val('false');
			}
			
			if(UseOrFailureCheckbox.eq(i).is(":checked")){
				UseOrFailure.eq(i).val('true');
			}else{
				UseOrFailure.eq(i).val('false');
			}
		}
		
		
		AnnualLeaveReflectionCheckbox.removeAttr("name");
		UseOrFailureCheckbox.removeAttr("name");
		
		var json;
		var obj = new Object();
		var jsonObj = $("#" + formId).serializeArray();
		var jobj = {};
		var jArray = new Array();
		
		$(jsonObj).each(function(index, obj){
			
			jobj[obj.name] = obj.value;
			//index 0에 divide : 휴가  1에 code : 00 이렇게 들어감. 그래서 json 한세트에 6개 들어가서 6개씩  짤라줌.
			//{"divide":"휴가","code":"00","title":"휴가(년차)","AnnualLeaveReflection":"false","UseOrFailure":"false","note":""} 6개 넣으면 이렇게 완성됨.
			if((index+1) % 6 == 0 ){
					
				jArray.push(jobj);
					
				//한번하면 초기화해줘야됨. 그래야 맨밑에있는값들로만 안들어감.
				jobj = {};
			}
			
			console.log(index + ":" + obj.name +":"+ obj.value);
		});
		
		//데이터를 전송할때 Map 형식으로 보내야 하기 때문에 key값과 value값을 나눠서 보냈음.
		var dataObj = {"jArray":JSON.stringify(jArray)};
		//var dataObj = jArray;

		console.log(dataObj);
		
		paging.ajaxSubmit("/spring/holidaySetDBInset.ajax",dataObj,function(result){
			
		});

		console.log("-------------"+jArray);
		
	}
	
</script>

<body>
	<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">휴가항목설정</h3>
					<!-- OVERVIEW -->
						
					<div class="panel panel-headline">
						<div class="panel-body">
							<form class="form-inline" name="searchForm">
								<strong class="pdu_8 ftl">근태구분</strong>
								<select name="attendanceDivision" class="w_120 mgl_8 mgu_8">
									<option value="vacation">휴가</option>
								</select>
							
								<span class="ftr">
									<button type="button" class="btn btn-primary" onClick="">검색</button>
								</span>
							</form>
						</div>
					</div>

					<!-- TABLE STRIPED -->
					<div class="panel panel-headline">
						<div class="boxArea text-center">
							<strong class="pdu_8 ftl">휴가항목설정 </strong>
							<span class="ftr">
								<button type="button" name="addTr" class="btn btn-primary" onClick="">행추가</button>
								<button type="button" name="deleteTr" class="btn btn-primary" onClick="">행삭제</button>
							</span>
						</div>	
						<div class="panel-body mgu_15">
							<form class="form-inline" name="f2" action="/spring/holidaySetDBInset.do" id="insertForm">
								
								<table class="table table-bordered" id="vacationOptionTable" style="980px;">
   <!--                      <thead> -->
		                           <colgroup>
		                              <col width="3%">
		                              <col width="10%">
		                              <col width="10%">
		                              <col width="20%">
		                              <col width="10%">
		                              <col width="10%">
		                              <col width="37%">
		                           </colgroup>
		                           <thead class="scrollHead">
		                              <tr>
		                                 <th class="w3">
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" id="selectAll_chk" onClick="selectAll()">
		                                       <span></span>
		                                    </label>
		                                 </th>
		                                 <th class="text-center w10"><i class="fa fa-asterisk-red" aria-hidden="true" ></i>구분</th>
		                                 <th class="text-center w10"><i class="fa fa-asterisk-red" aria-hidden="true" ></i>코드</th>
		                                 <th class="text-center w20"><i class="fa fa-asterisk-red" aria-hidden="true" ></i>명칭</th>
		                                 <th class="text-center w10">연차반영</th>
		                                 <th class="text-center w10">사용여부</th>
		                                 <th class="text-center w37">비고</th>
		                              </tr>
		                           </thead>
		                           <tbody class="scrollBody">
		                              <tr id="headTr">
		                                 <td class="w3">
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" id="notDeleteChk">
		                                       <span></span>
		                                    </label>
		                                 </td>
		                                 <td class="w10"><input type="text" class="form-control w_80" value="휴가" ></td>
		                                 <td class="w10"><input type="text" class="form-control w_80" value="00" ></td>
		                                 <td class="w20"><input type="text" value="휴가(년차)" class="form-control" ></td>
		                                 <td class="w10">
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 <td class="w10">
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 
		                                 <td class="w37"><input type="text" class="form-control w_300" ></td>
		                              </tr>
		                              <tr>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" id="notDeleteChk">
		                                       <span></span>
		                                    </label>
		                                 </td>
		                                 <td class="w10"><input type="text" class="form-control w_80" value="휴가" ></td>
		                                 <td><input type="text" class="form-control w_80" value="01" ></td>
		                                 <td><input type="text" value="생리휴가" class="form-control" ></td>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 
		                                 <td><input type="text" class="form-control w_300" ></td>
		                              </tr>
		                              <tr>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" id="notDeleteChk">
		                                       <span></span>
		                                    </label>
		                                 </td>
		                                 <td><input type="text" class="form-control w_80" value="휴가" ></td>
		                                 <td><input type="text" class="form-control w_80" value="02" ></td>
		                                 <td><input type="text" value="병가" class="form-control" ></td>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 <td><input type="text" class="form-control w_300" ></td>
		                              </tr>
		                              <tr>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" id="notDeleteChk">
		                                       <span></span>
		                                    </label>
		                                 </td>
		                                 <td><input type="text" class="form-control w_80" value="휴가" ></td>
		                                 <td><input type="text" class="form-control w_80" value="03" ></td>
		                                 <td><input type="text" value="경조휴가" class="form-control" ></td>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 
		                                 <td><input type="text" class="form-control w_300" ></td>
		                              </tr>
		                              <tr>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" id="notDeleteChk">
		                                       <span></span>
		                                    </label>
		                                 </td>
		                                 <td><input type="text" class="form-control w_80" value="휴가" ></td>
		                                 <td><input type="text" class="form-control w_80" value="04" ></td>
		                                 <td><input type="text" value="출산휴가" class="form-control" ></td>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                  
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 
		                                 <td><input type="text" class="form-control w_300" ></td>       
		                              </tr>
		                              <tr>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" id="notDeleteChk">
		                                       <span></span>
		                                    </label>
		                                 </td>
		                                 <td><input type="text" class="form-control w_80" value="휴가" ></td>
		                                 <td><input type="text" class="form-control w_80" value="05" ></td>
		                                 <td><input type="text" value="포상휴가" class="form-control" ></td>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 <td>
		                                    <label class="fancy-checkbox-inline">
		                                       <input type="checkbox" >
		                                       <span></span>
		                                    </label>
		                                    <input type="hidden" >
		                                 </td>
		                                 <td><input type="text" class="form-control w_300"></td>
		                              </tr>
		                           </tbody>
		                        </table>
		                 
		                        <button type="button" name="saveButton" class="btn btn-primary ftr" onClick="insertDB('insertForm')">저장</button>
							</form>
						</div>
					</div>	
				</div>
			</div>
		</div>
</body>
</html>
