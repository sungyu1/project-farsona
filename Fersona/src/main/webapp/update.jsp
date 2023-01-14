<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.smhrd.model.Police"%>
<%@page import="com.smhrd.model.Member"%>
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

<link href="css/update.css" rel="stylesheet">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style>
	#table{
	width:500px;
	}
</style>
</head>
<body>
	<!-- navbar -->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->

	<% 
		Member loginMember = (Member)session.getAttribute("loginMember");
		Police vo = new Police(loginMember.getPolice_id());
		MemberDAO dao = new MemberDAO();
		Police checkMember = dao.checkMember(vo);
	%>
	
	
	<div class="contain">
		<form action="UpdateCon" method="post">
			<p id="tit">개인정보수정</p>
			<div class="updateinfo">※ 관할지/근무부서 변경은 관할담당자님께 요청바랍니다.</div>
			<table id="table">
				<tr>
					<td class="text">사원번호</td>
					<td colspan="3"><span class="noupdate" name="police_id" value="<%=checkMember.getPolice_id()%>"><%=checkMember.getPolice_id() %></span></td>
				</tr>
				<tr>
					<td class="text">비밀번호</td>
					<td colspan="3"><input type="password" name="admin_pw" id="pswd1" onchange="check_pw()" placeholder="변경할 비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<td class="text">비밀번호 확인</td>
					<td colspan="3"><input type="password" name="pswd2" id="pswd2" onchange="check_pw()" placeholder="위와 동일한 비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<td class="text">이름</td>
					<td colspan="3"><span class="noupdate"><%=checkMember.getPolice_name() %></span></td>
				</tr>
				<tr id="fontwhite">
					<td class="text"></td>
					<td colspan="3">'-'를 빼고 숫자만 입력해주세요</td>
				</tr>
				<tr>
					<td class="text">핸드폰 번호</td>
					<td colspan="3"><input type="text" name="admin_phone" placeholder="핸드폰 번호를 입력"></td>
				</tr>
			
				<tr>
					<td class="text">관할지역</td>
					<td colspan="3"><span class="noupdate"><%=checkMember.getPolice_adr1() %></span></td>
				</tr>
				<tr>
					<td class="text">관할관서</td>
					<td colspan="3"><span class="noupdate"><%=checkMember.getPolice_adr2() %></span></td>
				</tr>
			</table>
			<!-- <button type="submit" value="join">회원가입</button> -->
			<input id="joincss" type="submit" value="저장">
		</form>
	</div>

	<!-- footer -->
	<%@include file="footer.jsp"%>
	<!-- footer 끝 -->


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	
	<script type="text/javascript">

		/* 비밀번호 확인 */
		function check_pw() {
			var pw = document.getElementById('pswd1').value;

			if (document.getElementById('pswd1').value != ''
					&& document.getElementById('pswd2').value != '') {
				if (document.getElementById('pswd1').value == document
						.getElementById('pswd2').value) {
					document.getElementById('ck').style.visibility = 'visible';
				} else {
					window.alert('비밀번호가 일치하지 않습니다.');
				}
			}
		}
		
		/* 핸드폰 번호 입력 */
		// 인증번호 전송
		$('#phone_check').click(function() {
			document.getElementById('phone_check').type = 'submit';
			window.alert("인증번호가 전송되었습니다.");
		});

		// 인증번호 확인
		$('#codenum_check').click(function() {
			let codenum = Number($('#codenum').val());
			let codenum2 = Number($('#codenum2').val());

			if (codenum == codenum2) {
				window.alert('휴대폰 번호가 인증되었습니다.');
				$('#codenum_check').css('background', '#7f7f7f');
				$('#codenum_check').text('확인 완료');
			} else {
				window.alert('잘못된 인증번호입니다.');
			}
		});
		
	</script>
</body>
</html>