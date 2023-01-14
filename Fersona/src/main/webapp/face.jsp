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
<link href="css/face.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!--navbar-->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->
	<div class="contain">
		<p class="tit">몽타주 생성</p>
		<!--bg-secondary py-5-->
		<form action="#">
			<div class="facespace px-lg-5">
				<div class="textbar">
					<textarea class="textspace" autofocus>글자를 입력해주세요</textarea>
					<label for="input-file" class="upload1"> <span
						class="tooltiptext">음성파일 업로드 클릭</span> <img
						src="./imgs/voice_bk.png" alt="음성파일 업로드"></label> <input type="file"
						class="upload" id="input-file">

					<div class="resetbar">
						<input type="reset" class="resetbar_btn" value="초기화">
						<input type="submit" class="facecreate_btn" value="생성하기">
					</div>
				</div>
				<div>
					<div class="imgspace">
						<!-- 몽타주 생성 준비중 -->

						<div class="imgspace1">
							<img class="imgspace2" src="./imgs/drawing.png" alt="첨부파일">
							<div class="imgspace3">몽타주 생성 준비중</div>
						</div> 

						<!-- 몽타주 출력 -->
						<!-- <table>
							<tr>
								<td><label><input type="radio" value="img01"
										name="img">
										<div class="imgspace01">
											<img class="imgspace02" src="./imgs/drawing.png" alt="첨부파일">
										</div></label></td>
								<td><label><input type="radio" value="img02"
										name="img">
										<div class="imgspace01">
											<img class="imgspace02" src="./imgs/drawing.png" alt="첨부파일">
										</div></label></td>
							</tr>
							<tr>
								<td><label><input type="radio" value="img03"
										name="img">
										<div class="imgspace01">
											<img class="imgspace02" src="./imgs/drawing.png" alt="첨부파일">
										</div></label></td>
								<td><label><input type="radio" value="img04"
										name="img">
										<div class="imgspace01">
											<img class="imgspace02" src="./imgs/drawing.png" alt="첨부파일">
										</div></label></td>
							</tr>
						</table> -->
						<!-- 몽타주 출력 end -->
					</div>

					<div class="image_btn">
						<a href="#middle" class="image_btn1" onclick="nohidden()">유사수배자
							조회</a>
					</div>
				</div>
			</div>
		</form>

		<!-- 유사수배자 조회 -->
		<div id="wantedhid">
			<!-- <div class="wanted" id="middle">
				<img class="face_img" src="./imgs/drawing.png" alt="파일준비중">
			</div>
			<div class="wanted_criminal">
				<div class="wantedborder">
					<div class="face_img_frame">
						<img class="img_frame" src="./imgs/drawing.png" alt="첨부파일">
					</div>
					<table>
						<tr>
							<td colspan="2">고유번호 :
								<p>1</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">이름 :
								<p>홍길동 (51, 남)</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">죄명 :
								<p>살인</p>
							</td>
						</tr>
					</table>
				</div>

				<div class="wantedborder">
					<div class="face_img_frame">
						<img class="img_frame" src="./imgs/drawing.png" alt="첨부파일">
					</div>
					<table>
						<tr>
							<td colspan="2">고유번호 :
								<p>1</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">이름 :
								<p>홍길동 (51, 남)</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">죄명 :
								<p>살인</p>
							</td>
						</tr>
					</table>
				</div>

				<div class="wantedborder">
					<div class="face_img_frame">
						<img class="img_frame" src="./imgs/drawing.png" alt="첨부파일">
					</div>
					<table>
						<tr>
							<td colspan="2">고유번호 :
								<p>1</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">이름 :
								<p>홍길동 (51, 남)</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">죄명 :
								<p>살인</p>
							</td>
						</tr>
					</table>
				</div>

				<div class="wantedborder">
					<div class="face_img_frame">
						<img class="img_frame" src="./imgs/drawing.png" alt="첨부파일">
					</div>
					<table>
						<tr>
							<td colspan="2">고유번호 :
								<p>1</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">이름 :
								<p>홍길동 (51, 남)</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">죄명 :
								<p>살인</p>
							</td>
						</tr>
					</table>
				</div>

			</div> -->
		</div>
	</div>
	<!-- 페이지마지막-->
	<%@include file="footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="js/face.js"></script>
	<script>
		
	</script>

</body>
</html>