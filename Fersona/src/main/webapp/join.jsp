<%@page import="java.io.PrintWriter"%>
<%@page import="com.smhrd.model.Police"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CATCH FACE</title>
<link href="css/join.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="css/join.css" rel="stylesheet" />
</head>
<body>
	<%
	//포워딩 방식으로 값을 부를 때
	// .getAttribute >> 반환타입 object
	Police checkVO = (Police) request.getAttribute("loginMember");
	String cnt = (String) request.getAttribute("cnt");
	String user_num = (String) request.getAttribute("user_num");
	String key = (String) request.getAttribute("key");
	System.out.print(key);
	String result = (String) request.getAttribute("result");
	if (result != null && result.equals("fail")) {
		out.println("<script>alert('이미 가입된 회원 등의 이유로 회원가입이 실패하였습니다.');</script>");
		out.flush();
	}
	%>

	<div class="container">
		<form action="JoinCon" method="post">
			<h2>회원가입</h2>
			<table>
				<tr id="fontwhite">
					<td class="text"></td>
					<td colspan="2" id="check_txt">
						<%
						if (checkVO != null) {
						%> 사용가능한 사원번호입니다. <%
						} else if (checkVO == null) {
						%> 사원번호가 조회되지 않습니다. <%
						}
						%>
					</td>
				</tr>
				<tr>
					<td class="text">사원번호</td>
					<td><input type="text" name="police_id" id="police_id"
						placeholder="사원번호를 입력해주세요"
						value="<%if (checkVO != null) {%><%=checkVO.getPolice_id()%><%}%>"></td>
					<td><input type="submit" id="id_check" value="사번 조회"
						style="cursor: pointer;" formaction="policeCon"></td>
				</tr>
				<tr>
					<td class="text">이름</td>
					<td colspan="2"><input onclick="ckfunc()" type="text"
						id="police_name" name="police_name" readonly
						placeholder="이름을 입력해주세요"
						value="<%if (checkVO != null) {%><%=checkVO.getPolice_name()%><%}%>"></td>
				</tr>
				<tr id="fontwhite">
					<td class="text"></td>
					<td colspan="2">'-'를 빼고 숫자만 입력해주세요</td>
				</tr>
				<tr>
					<td class="text">핸드폰 번호</td>
					<td><input type="text" name="user_num" id="user_num"
						placeholder="핸드폰 번호를 입력해주세요"
						value="<%if (user_num != null) {%><%=user_num%><%}%>"></td>
					<td><input type="button" name="phone_check" id="phone_check"
						value="인증번호 요청" style="cursor: pointer;" formaction="sendSms"
						method="post" maxlength="11"></td>
				</tr>
				<tr>
					<td class="text"></td>
					<td><input type="text" name="codenum"
						placeholder="인증번호 6자리를 입력해주세요" id="codenum" value=""> <input
						type="hidden" id="codenum2" value="<%=key%>"></td>
					<td><button type="button" name="codenum_check"
							id="codenum_check" style="cursor: pointer;">확인</button></td>
				</tr>

				<tr>
					<td class="text">비밀번호</td>
					<td colspan="2"><input type="password" id="pswd1"
						placeholder="비밀번호를 입력해주세요" name="admin_pw" onchange="check_pw()"></td>
				</tr>
				<tr>
					<td class="text">비밀번호 확인</td>
					<td colspan="2"><input type="password" id="pswd2"
						placeholder="위와 동일한 비밀번호를 입력해주세요" onchange="check_pw()"><img
						id="ck" src="./imgs/check.png"></td>
				</tr>
				<tr>
					<td class="text">관할지역</td>
					<td colspan="2"><input onclick="ckfunc()" type="text"
						name="police_adr1" readonly placeholder="관할지를 지정해주세요"
						value="<%if (checkVO != null) {%><%=checkVO.getPolice_adr1()%><%}%>"></td>
				</tr>
				<tr>
					<td class="text">관할관서</td>
					<td colspan="2"><input onclick="ckfunc()" type="text"
						name="police_adr2" readonly placeholder="근무부서를 지정해주세요"
						value="<%if (checkVO != null) {%><%=checkVO.getPolice_adr2()%><%}%>"></td>
				</tr>
			</table>
			<!-- <button type="submit" value="join">회원가입</button> -->
			<input id=joincss type="submit" value="회원가입" style="cursor: pointer;">
		</form>
	</div>


	<script type="text/javascript">
		function ckfunc() {
			alert("사원번호를 먼저 조회해주세요")
		}

		//according to loftblog tut
		$('.nav li:first').addClass('active');

		var showSection = function showSection(section, isAnimate) {
			var direction = section.replace(/#/, ''), reqSection = $('.section')
					.filter('[data-section="' + direction + '"]'), reqSectionPos = reqSection
					.offset().top - 0;

			if (isAnimate) {
				$('body, html').animate({
					scrollTop : reqSectionPos
				}, 800);
			} else {
				$('body, html').scrollTop(reqSectionPos);
			}
		};

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