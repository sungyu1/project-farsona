<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CATCH FACE</title>
<link href="css/login.css" rel="stylesheet">

</head>
<body>
	<%
	String result = (String) request.getAttribute("result");
	System.out.println(result);
	if (result!=null && result.equals("success")) {
		out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
		out.flush();
	}
	%>

	<div class="container">
		<img class="logo1" src="./imgs/face_logo.png">
		<img class="logo" src="./imgs/Logo_00.jpg">
		<!-- Logo 끝 -->

		<form action="LoginCon" method="post">
			<div>

				<div class="form-item">
					<input type="text" name="id" placeholder="사원번호를 입력해주세요">
				</div>

				<div class="form-item">
					<input type="password" name="pw" placeholder="비밀번호를 입력해주세요">
				</div>
				<div>
					<input type="submit" style="cursor: pointer;" value="로그인">
					<p>
						<a href="join.jsp"> 회원가입</a>
					</p>
				</div>

			</div>
		</form>
	</div>


</body>
</html>