<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>CATCH FACE</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style>
.navbar {
	height: 56px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container px-lg-5">
			<a href="main.jsp">
			<img class="logo1" src="./imgs/face_logo.png" width="30px"><span>  </span><img src="./imgs/logo.jpg" width="200px"></a>
			<!-- 줄였을때 햄버거 -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="faceInfoList.jsp">수배자 정보</a></li>
					<li class="nav-item"><a class="nav-link" href="reportListPaging.jsp">제보/신고조회</a></li>
					<li class="nav-item"><a class="nav-link"
						href="userInfoList.jsp">회원정보</a>
					<li>
					<li class="nav-item"><a class="nav-link" href="update.jsp">개인정보수정</a></li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>