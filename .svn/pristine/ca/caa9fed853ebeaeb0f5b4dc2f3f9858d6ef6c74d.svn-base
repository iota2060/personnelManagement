<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="fullscreen-bg">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="/spring/resources/common/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/spring/resources/common/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/spring/resources/common/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="/spring/resources/common/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/spring/resources/common/css/main.css">
<link rel="stylesheet" href="/spring/resources/common/css/vacation.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->

<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">

<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/spring/resources/common/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/spring/resources/common/img/favicon.png">	
	
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center"><img src="/spring/resources/common/img/logo-dark.png" alt="Klorofil Logo"></div>
								<p class="lead">Login to your account</p>
							</div>
							<form class="form-auth-small" id="loginForm">
								<div class="form-group">
									<label for="signin-id" class="control-label sr-only">id</label>
									<input type="text" class="form-control" id="signin-id" placeholder="id" name="empId" required>
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">Password</label>
									<input type="password" class="form-control" id="signin-password" placeholder="Password" name="empPswd" required>
								</div>
								<button type="button" id="loginBtn" class="btn btn-primary btn-lg btn-block">LOGIN</button>
							</form>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">Personnel management system</h1>
							<p>by The Increpas</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="/spring/resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="/spring/resources/common/js/jquery.form.js"></script>
	<script src="/spring/resources/common/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/spring/resources/common/js/paging.js"></script>
	<script>
	
	$(document).ready(function(e){
		
		$("#loginBtn").on("click",function(){//login 버튼 클릭했을 때
			loginAjax();
		});//onClick	
	 
		$("#signin-password").on("keydown", function(e){//keydown 중 Enter를 눌렀을 때
			if(e.keyCode == 13){
				loginAjax();
			}//if
		});
	
	});//document
	

	
	function loginAjax(){
		if(document.getElementById("loginForm").checkValidity()){		
			paging.ajaxFormSubmit("loginProcess","loginForm",function(result){
				if(result==null){
					alert("아이디와 비밀번호가 틀립니다. 다시 입력해주세요");
				}else{
					alert("로그인 되었습니다.");
					location.href="/spring/main.do";
				}//if eles
			});//paging.ajaxFormSubmit
		}else{
			alert("입력하지 않은 값이 있습니다.");
		}	
	}//loginAjax
	
	</script>
</body>
</html>