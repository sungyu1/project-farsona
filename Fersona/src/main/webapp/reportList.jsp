<%@page import="com.smhrd.model.Report"%>
<%@page import="com.smhrd.model.ReportDAO"%>
<%@page import="java.util.List"%>
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

<!-- reportList.css -->
<link href="css/reportList.css" rel="stylesheet">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->
	
	<%
		ReportDAO dao = new ReportDAO();
		List<Report> list = dao.selectAllReport();
		System.out.println(list.size());
	%>


	<div class="contain">
		<form action="reportPagingCon" method="post">
			<p id="tit">제보/신고 조회</p>

			<table>
				<tr>
					<td class="text">발생지역</td>
					<td><select name="adrress">
							<option value="">선택</option>
							<option value="">광주광역시 동구</option>
							<option value="">광주광역시 서구</option>
							<option value="">광주광역시 남구</option>
							<option value="">광주광역시 북구</option>
							<option value="">광주광역시 광산구</option>
					</select></td>
					<td class="text">신고유형</td>
					<td><select name="cate">
							<option value="">선택</option>
							<option value="">뺑소니</option>
							<option value="">강도</option>
							<option value="">절도</option>
							<option value="">살인</option>
							<option value="">사기</option>
							<option value="">폭력</option>
							<option value="">성범죄</option>
							<option value="">기타</option>
					</select></td>
					<td class="text">진행현황</td>
					<td><select name="progress">
							<option value="">선택</option>
							<option value="">접수대기</option>
							<option value="">접수중</option>
							<option value="">진행중</option>
							<option value="">진행완료</option>
					</select></td>
				</tr>
			</table>
			<div class="search_line">
				<p class="search_text">신고내용</p>
				<input class="search" type="text" placeholder="검색어를 입력해주세요"
					name="rep_con">
				<button class="search_btn" type="submit" value="Searching">
					<img class="search_icon" src="./imgs/search.png">
				</button>
			</div>
		</form>


		<!-- 제보/신고 리스트 -->
		<p id="totalLeft">총 <%=list.size()%>건이 검색되었습니다.</p>
		<table class="table">
			<tr id="th" class="tableHt">
				<th>번호</th>
				<th>신고유형</th>
				<th>신고내용</th>
				<th>등록일</th>
				<th>진행현황</th>
			</tr>

			<%for(int i=0; i<list.size(); i++){ %>
			<tr class="tableHt" onClick="location.href='reportContent.jsp'"
				style="cursor: pointer;">
				<td><%=i+1%></td>
				<td><%=list.get(i).getRep_cate()%></td>
				<td><%=list.get(i).getRep_con()%></td>
				<td><%=list.get(i).getRep_date()%></td>
				<td><%=list.get(i).getRep_pro()%></td>
			</tr>
			<%} %>

		</table>

		<!-- 이전 다음 페이지 넘기기 pagination -->
		<ul class="pagination pagination-sm justify-content-center">
			<li id = "link" class="page-item"><a class="page-link" href="#">◀</a></li>
			<li id = "link" class="page-item active"><a class="page-link" href="#">1</a></li>
			<li id = "link" class="page-item"><a class="page-link" href="#">2</a></li>
			<li id = "link" class="page-item"><a class="page-link" href="#">3</a></li>
			<li id = "link" class="page-item"><a class="page-link" href="#">▶</a></li>
		</ul>
	</div>

	<!-- footer -->
	<%@include file="footer.jsp"%>
	<!-- footer 끝 -->


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>