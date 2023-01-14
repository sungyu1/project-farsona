<%@page import="com.smhrd.model.Want"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="css/faceUpdate.css" rel="stylesheet" />
</head>


<body class="facebady">

	<%
	//session 값 가지고 오기
	Want selectWant = (Want) session.getAttribute("wantMember");
	%>

	<!--navbar-->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->

	<header class="contain">
		<div class="facemain">
			<form action="faceUpdate2Con" method="post">
				<%
				if (selectWant != null) {
				%>
				<div class="facespace1">
					<div>
						<img class="imgspace"
							src="./imgs/face/<%=selectWant.getWant_img()%>.jpg" alt="첨부파일">
					</div>
					<div>
						<table>
							<tr>
								<td class="text" style="width: 130px;">고유번호</td>
								<td>
								<input type="text" name = "want_id" class="noupdate" value="<%=selectWant.getWant_id()%>" readonly>
<%-- 								<span class="noupdate"><%=selectWant.getWant_id()%></span> --%>
								</td>
							</tr>
							<tr>
								<td class="text">이름</td>
								<td><input type="text" name="want_name" class="textcss"
									placeholder="이름을 입력해주세요."
									value="<%=selectWant.getWant_name()%>"></td>
							</tr>
							<tr>
								<td class="text">나이</td>
								<td><input class="textcss" type="number" name="want_age"
									placeholder="나이를 숫자만 입력해주세요." min="1" max="100"
									value="<%=selectWant.getWant_age()%>"></td>
							</tr>
							<tr>
								<td class="text">성별</td>
								<td><select name="want_gen" class="textcss">
										<%
										if (selectWant.getWant_gen().equals("여")) {
										%>
										<option value="남">남자</option>
										<option value="여" selected="selected">여자</option>
										<%
										} else {
										%>
										<option value="남" selected="selected">남자</option>
										<option value="여">여자</option>
										<%
										}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="text">죄명</td>
								<td><select name="rep_cate" class="textcss">
										<%
										switch (selectWant.getRep_cate()) {
											case "뺑소니" :
										%>
										<option value="미선택">선택</option>
										<option value="뺑소니" selected="selected">뺑소니</option>
										<option value="강도">강도</option>
										<option value="절도">절도</option>
										<option value="살인">살인</option>
										<option value="사기">사기</option>
										<option value="폭력">폭력</option>
										<option value="성범죄">성범죄</option>
										<option value="기타">기타</option>
										<%
										break;
										case "강도" :
										%>
										<option value="미선택">선택</option>
										<option value="뺑소니">뺑소니</option>
										<option value="강도" selected="selected">강도</option>
										<option value="절도">절도</option>
										<option value="살인">살인</option>
										<option value="사기">사기</option>
										<option value="폭력">폭력</option>
										<option value="성범죄">성범죄</option>
										<option value="기타">기타</option>
										<%
										break;
										case "절도" :
										%>
										<option value="미선택">선택</option>
										<option value="뺑소니">뺑소니</option>
										<option value="강도">강도</option>
										<option value="절도" selected="selected">절도</option>
										<option value="살인">살인</option>
										<option value="사기">사기</option>
										<option value="폭력">폭력</option>
										<option value="성범죄">성범죄</option>
										<option value="기타">기타</option>
										<%
										break;
										case "살인" :
										%>
										<option value="미선택">선택</option>
										<option value="뺑소니">뺑소니</option>
										<option value="강도">강도</option>
										<option value="절도">절도</option>
										<option value="살인" selected="selected">살인</option>
										<option value="사기">사기</option>
										<option value="폭력">폭력</option>
										<option value="성범죄">성범죄</option>
										<option value="기타">기타</option>
										<%
										break;
										case "사기" :
										%>
										<option value="미선택">선택</option>
										<option value="뺑소니">뺑소니</option>
										<option value="강도">강도</option>
										<option value="절도">절도</option>
										<option value="살인">살인</option>
										<option value="사기" selected="selected">사기</option>
										<option value="폭력">폭력</option>
										<option value="성범죄">성범죄</option>
										<option value="기타">기타</option>
										<%
										break;
										case "폭력" :
										%>
										<option value="미선택">선택</option>
										<option value="뺑소니">뺑소니</option>
										<option value="강도">강도</option>
										<option value="절도">절도</option>
										<option value="살인">살인</option>
										<option value="사기">사기</option>
										<option value="폭력" selected="selected">폭력</option>
										<option value="성범죄">성범죄</option>
										<option value="기타">기타</option>
										<%
										break;
										case "성범죄" :
										%>
										<option value="미선택">선택</option>
										<option value="뺑소니">뺑소니</option>
										<option value="강도">강도</option>
										<option value="절도">절도</option>
										<option value="살인">살인</option>
										<option value="사기">사기</option>
										<option value="폭력">폭력</option>
										<option value="성범죄" selected="selected">성범죄</option>
										<option value="기타">기타</option>
										<%
										break;
										case "기타" :
										%>
										<option value="미선택">선택</option>
										<option value="뺑소니">뺑소니</option>
										<option value="강도">강도</option>
										<option value="절도">절도</option>
										<option value="살인">살인</option>
										<option value="사기">사기</option>
										<option value="폭력">폭력</option>
										<option value="성범죄">성범죄</option>
										<option value="기타" selected="selected">기타</option>
										<%
										break;
										}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="text">특징</td>
								<td><textarea class="textcss1" placeholder="특징을 입력해주세요." name = "want_char"
										onkeydown="resize(this)" onkeyup="resize(this)"><%=selectWant.getWant_char()%></textarea></td>
							<tr>
								<td class="text">관할지</td>
								<td><select name="admin_adr1" class="textcss">
										<option value="미선택">선택</option>
										<option value="광주광역시 경찰청" selected>광주광역시 경찰청</option>
										<option value="광주동부 경찰서">광주동부 경찰서</option>
										<option value="광주서부 경찰서">광주서부 경찰서</option>
										<option value="광주남부 경찰서">광주남부 경찰서</option>
										<option value="광주북구 경찰서">광주북구 경찰서</option>
										<option value="광주광산 경찰서">광주광산 경찰서</option>
								</select></td>
							</tr>
							<tr>
								<td class="text">공개수배 여부</td>
								<td><select name="want_open" class="textcss">
										<%
										if (selectWant.getWant_open().equals("공개")) {
										%>
										<option value="비공개">비공개</option>
										<option value="공개" selected="selected">공개</option>
										<%
										} else {
										%>
										<option value="비공개" selected="selected">비공개</option>
										<option value="공개">공개</option>
										<%
										}
										%>
								</select></td>

							</tr>
						</table>

					</div>
				</div>
				<div>
					<input id="saves" type="submit" value="저장하기" class="save_btn">
					<input id="cancel" type="submit" value="삭제하기" class="save_btn" formaction="wantDeleteCon">
				</div>
				<%
				}
				%>
			</form>
		</div>

		<!-- 페이지마지막-->

	</header>
	<%@include file="footer.jsp"%>

	<script>
		function resize(obj) {
			obj.style.height = '1px';
			obj.style.height = (12 + obj.scrollHeight) + 'px';
		}
	</script>
</body>
</html>