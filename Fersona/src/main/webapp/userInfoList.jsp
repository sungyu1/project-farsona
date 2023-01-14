<%@page import="com.smhrd.model.UserDAO"%>
<%@page import="com.smhrd.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<link href="css/userinfoList.css" rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<!--navbar-->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->
	
	<%
		UserDAO dao = new UserDAO();
		List<User> list = dao.selectAllMember();
		System.out.println(list.size());
	%>

	<!-- 대상구분  -->
	<div class="contain">
		<div class="contain_main">
			<p id="tit">회원 정보</p>
		</div>
		<form action="reportContentCon" method="post">
			<table class="table">
				<caption></caption>
				<tr>
					<td class="text">ID</td>
					<td><input class="numcss" type="text"
						placeholder="검색할 ID를 입력해주세요"></td>
					<td class="text">이름</td>
					<td><input class="numcss" type="text"
						placeholder="검색할 이름을 입력해주세요"></td>
				</tr>
				<tr>
					<td class="text">핸드폰번호</td>
					<td><input class="numcss" type="text"
						placeholder="'-'를 빼고 숫자만 입력해주세요"></td>
					<td class="text">거주지</td>
					<td><select id="s1" onchange="optionChange();">
							<option value="city">전체(시/구)</option>
							<option value="a">광주광역시 동구</option>
							<option value="b">광주광역시 서구</option>
							<option value="c">광주광역시 남구</option>
							<option value="d">광주광역시 북구</option>
							<option value="e">광주광역시 광산구</option>
					</select> <select id="s2">
							<option>전체(동)</option>
					</select></td>
				</tr>
			</table>

			<div id="search_margin">
				<input type="reset" class="resetbar_btn" value="초기화"> <input
					type="submit" class="facecreate_btn" value="검색">
			</div>
		</form>

		<!-- 리스트 -->
		<p id="totalLeft">총 <%=list.size()%>건이 검색되었습니다.</p>
		<table class="table">
			<tr id="th" class="tableHt">
				<th>NO</th>
				<th>ID</th>
				<th>이름</th>
				<th>핸드폰 번호</th>
				<th>생년월일</th>
				<th>거주지</th>							
				<th>기타</th>						
				<!-- <th><input type='checkbox' name='deletes' id="check-all" /></th> -->
			</tr>
			
			<%for(int i=0; i<list.size(); i++){ %>
			<tr class="tableHt">
				<%-- <td class = "table01"><input type='checkbox' name='deletes' id="check<%=i%>" /></td> --%>
				<td class = "table00"><%=i+1 %></td>
				<td class = "table01"><%=list.get(i).getMem_id() %></td>
				<td class = "table02"><%=list.get(i).getMem_name()%></td>
				<td class = "table03"><%=list.get(i).getMem_tel() %></td>
				<td class = "table04"><%=list.get(i).getMem_join() %></td>
				<td class = "table05"><%=list.get(i).getMem_adr1() + " " + list.get(i).getMem_adr2() %></td>
				<td class = "table06"><a href="DeleteCon?mem_id=<%=list.get(i).getMem_id()%>">삭제</a></td>
			</tr>
			<%} %>
		</table>
		
		<!-- <div id="dele">
			<input class="wantedlist" type="submit" value="삭제하기">
		</div> -->

		<!-- 이전 다음 페이지 넘기기 pagination -->
		<ul class="pagination pagination-sm justify-content-center" style="margin-top : 50px;">
			<li id="link" class="page-item"><a class="page-link" href="#">◀</a></li>
			<li id="link" class="page-item active"><a class="page-link" href="#">1</a></li>
			<!-- 페이지 늘리기 버튼 -->
			<!-- <li id="link" class="page-item"><a class="page-link" href="#">2</a></li>
			<li id="link" class="page-item"><a class="page-link" href="#">3</a></li> -->
			<li id="link" class="page-item"><a class="page-link" href="#">▶</a></li>
		</ul>

	</div>


	<!-- 페이지마지막-->
	<%@include file="footer.jsp"%>

	<script src="js/userInfoList.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="./js/jquery.min.js"></script>


</body>
</html>