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
<link href="css/faceAdd.css" rel="stylesheet" />
</head>
<body class="facebady">
	<!--navbar-->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->

	<header class="contain">
		<div class="facemain">
			<form action="faceAddCon" method="post">
				<div class="facespace1">
					<div class="imgspace">
						<label for="faceimags" class="faceimags1" style="cursor: pointer;">
							<img id="preview" class="faceimags2" src="./imgs/photo.png">
							<input type="file" id="faceimags" name="want_img" onchange="readURL(this);">
							<!-- <input type="file" id="faceimags" name="want_img" value="wantedimg1"> -->
						</label>
					</div>
					<div>
						<table>
							<tr>
								<td class="text" style="width: 130px;">고유번호</td>
								<td><input type="number" class="textcss" name="num"
									placeholder="숫자만 입력해주세요." min="1" max="1000"></td>
							</tr>
							<tr>
								<td class="text">이름</td>
								<td><input type="text" name="want_name" class="textcss"
									placeholder="이름을 입력해주세요."></td>
							</tr>
							<tr>
								<td class="text">나이</td>
								<td><input class="textcss" type="number" name="want_age"
									placeholder="나이를 숫자만 입력해주세요." min="1" max="100"></td>
							</tr>
							<tr>
								<td class="text">성별</td>
								<td><select class="textcss" name="want_gen">
										<option value="남자">남자</option>
										<option value="여자">여자</option>
								</select></td>
							</tr>
							<tr>
								<td class="text">죄명</td>
								<td><select class="textcss" name="rep_cate">
										<option value="미선택">선택</option>
										<option value="뺑소니">뺑소니</option>
										<option value="강도">강도</option>
										<option value="절도">절도</option>
										<option value="살인">살인</option>
										<option value="사기">사기</option>
										<option value="폭력">폭력</option>
										<option value="성범죄">성범죄</option>
										<option value="기타">기타</option>
								</select></td>
							</tr>
							<tr>
								<td class="text">특징</td>
								<td>
									<!-- <input name="특징" class="textcss" placeholder="특징을 입력해주세요." value="이마 양 옆으로 앞머리가 가리고 있어 정확한 유형은 알수 없으나 머리의 유형으로 보아 둥글며 귓가를 지나 턱선이 갸름하게 아래로 갈수록 좁아지는 계란형 얼굴이다. 얼굴 볼살은 많지 않으나 콧볼 주변에 조금 있다."></td>
							 --> <textarea class="textcss1" placeholder="특징을 입력해주세요."
										onkeydown="resize(this)" onkeyup="resize(this)"
										name="want_char"></textarea>
							<tr>
								<td class="text">관할지</td>
								<td><select name="admin_adr1" class="textcss">
										<option value="미선택">선택</option>
										<option value="광주광역시 경찰청">광주광역시 경찰청</option>
										<option value="광주동부 경찰서">광주동부 경찰서</option>
										<option value="광주서부 경찰서">광주서부 경찰서</option>
										<option value="광주남부 경찰서">광주남부 경찰서</option>
										<option value="광주북구 경찰서">광주북구 경찰서</option>
										<option value="광주광산 경찰서">광주광산 경찰서</option>
								</select></td>
							</tr>
							<tr>
								<td class="text">공개수배 여부</td>
								<td><select class="textcss" name="want_open">
										<option value="비공개">비공개</option>
										<option value="공개">공개</option>
								</select></td>
								<!-- 								<td class="radio_input"><input type="radio" name="chk"
									class="radiochk" value="비공개">비공개 <input type="radio"
									name="chk" class="radiochk" value="공개"
									style="margin-left: 30px;" checked>공개</td> -->
							</tr>
						</table>

					</div>
				</div>
				<div>
					<input id="saves" type="submit" value="등록하기" class="save_btn">
					<input id="cancel" type="submit" value="취소하기"
						formaction="faceInfoList.jsp" class="save_btn">
				</div>
			</form>
		</div>

		<!-- 페이지마지막-->

	</header>
	<%@include file="footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script>
		function resize(obj) {
			obj.style.height = '1px';
			obj.style.height = (12 + obj.scrollHeight) + 'px';
		}

		// 이미지 업로드
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
		}
	</script>

</body>
</html>