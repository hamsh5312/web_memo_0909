<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



</head>

<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="content d-flex justify-content-center align-items-center">
		
			<div class="login-box">
				<h2 class="text-center mb-3">회원가입</h2>
				<form id="signupForm">
					<input type="text" id="loginIdInput" name="loginId" class="form-control" placeholder="아이디를 입력하세요.">
					<input type="password" id="passwordInput" name="password" class="form-control mt-3" placeholder="비밀번호를 입력하세요.">
					<input type="password" id="passwordConfirmInput" class="form-control mt-3" placeholder="비밀번호를 다시입력하세요.">
					<input type="text" id="nameInput" name="name" class="form-control mt-3" placeholder="이름">
					<input type="text" id="emailInput" name="email" class="form-control mt-3" placeholder="이메일 주소">
					<button type="submit" id="signUpBtn" class="btn btn-info btn-block mt-3">회원가입</button>
				</form>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>


	<script>
		
	$(document).ready(function(){
		
		$("#signupForm").on("submit", function(e){
			
			// 이 아래꺼가 뭘 없앤다는거죠? submit 기능을 없애는건가요?
			e.preventDefault();
			
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var passwordConfirm = $("#passwordConfirmInput").val();
			var name = $("#nameInput").val();
			var email = $("#emailInput").val();
			
			
			if(loginId == null || loginId == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			
			if(password == null || password == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			if(passwordConfirm == null || passwordConfirm == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			if(password != passwordConfirm){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if(name == null || name == ""){
				alert("이름을 입력하세요.");
				return;
			}
			
			if(email == null || email == ""){
				alert("이메일을 입력하세요.");
				return;
			}
				
			$.ajax({
				type:"post",
				url:"/user/sign_up",
				data:{"loginId":loginId, "password":password, "name":name, "email":email},
				success:function(data){
					if(data.result == "success"){
						location.href="/user/signin_view";
					}else{
						alert("회원가입 실패");
					}
				},
				error:function(e){
					alert("error");
				}
				
			});
			
			
		});
		
		
		
	});	
	
	</script>


</body>
</html>