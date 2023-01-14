<%@page import="com.smhrd.model.Report"%>
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
<link href="css/reportContent.css" rel="stylesheet">

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
	<%
	//session 값 가지고 오기
	Report list = (Report) session.getAttribute("list");
	Report updatePro = (Report) session.getAttribute("updatePro");
	%>

	<!-- navbar -->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->


	<div class="contain">
		<form action="reportContentCon" method="post">
			<%
			if (list != null) {
			%>
			<table class="table">
				<caption></caption>
				<tr class="tableHt">
					<td class="thbg">신고유형</td>
					<td><%=list.getRep_cate()%></td>
					<td class="thbg">등록일</td>
					<td><%=list.getRep_wri()%></td>
				</tr>

				<tr class="tableHt">
					<td class="thbg">사건발생일자</td>
					<td><%=list.getRep_date()%></td>
					<td class="thbg">사건발생시간</td>
					<td><%=list.getRep_time()%></td>
				</tr>

				<tr class="tableHt">
					<td class="thbg">신고내용</td>
					<td id="reporttext" colspan="3"><%=list.getRep_con()%></td>
				</tr>
				<tr class="tableHt">
					<td class="thbg">사건발생지역</td>
					<td colspan="3" id="keyword"><%=list.getRep_adr()%>
						<div class="mapapi" id="map"></div></td>
				</tr>
				<tr class="tableHt">
					<td class="thbg">사진 여부</td>
					<td colspan="3"><img class="imgcss" src="./imgs/gallery.png"
						alt="첨부파일">첨부파일이 없습니다.<!-- Kakaotalk01.jpg --></td>
				</tr>
				<tr class="tableHt">
					<td class="thbg">몽타주 여부</td>
					<td colspan="3"><img class="imgcss"
						src="./imgs/face/<%=list.getWant_id()%>.jpg"
						<%if (list.getWant_id() ==null){ %>
						alt="첨부파일이 없습니다."></td>
						<%} else{%>
						alt="<%=list.getWant_id()%>.jpg"> <br><%=list.getMon_char()%></td>
						<%} %>
				</tr>
				<tr class="tableHt">
					<td class="thbg">진행상황</td>
					<td colspan="3" id="reporttext02">
						<!--
						<select name="progress">
							<option value="">선택</option>
							<option value="">접수대기</option>
							<option value="">접수중</option>
							<option value="">진행중</option>
							<option value="">진행완료</option>
					</select>
					-->
						<div class="wrapall">
							<div class="dropdowns">
								<%
								if (updatePro == null) {
									switch (list.getRep_pro()) {
										case "접수대기" :
								%>
								<div class='dropbtn'>접수대기</div>
							</div>
							<div id='myDropdown' class='dropdown-content'>
								<a href='reportProCon?rep_pro=접수대기' class='dropdetails'
									id='pro01' name='rep_pro'>접수대기</a> <a
									href='reportProCon?rep_pro=접수중' class='dropdetails' id='pro02'
									name='rep_pro'>접수중</a> <a href='reportProCon?rep_pro=진행중'
									class='dropdetails' id='pro03' name='rep_pro'>진행중</a> <a
									href='reportProCon?rep_pro=진행완료' class='dropdetails' id='pro04'
									name='rep_pro'>진행완료</a>
								<%
								break;
								case "접수중" :
								%>
								<div class='dropbtn'>접수중</div>
							</div>
							<div id='myDropdown' class='dropdown-content'>
								<a href='reportProCon?rep_pro=접수대기' class='dropdetails'
									id='pro01' name='rep_pro'>접수대기</a> <a
									href='reportProCon?rep_pro=접수중' class='dropdetails' id='pro02'
									name='rep_pro'>접수중</a> <a href='reportProCon?rep_pro=진행중'
									class='dropdetails' id='pro03' name='rep_pro'>진행중</a> <a
									href='reportProCon?rep_pro=진행완료' class='dropdetails' id='pro04'
									name='rep_pro'>진행완료</a>
								<%
								break;
								case "진행중" :
								%>
								<div class='dropbtn'>진행중</div>
							</div>
							<div id='myDropdown' class='dropdown-content'>
								<a href='reportProCon?rep_pro=접수대기' class='dropdetails'
									id='pro01' name='rep_pro'>접수대기</a> <a
									href='reportProCon?rep_pro=접수중' class='dropdetails' id='pro02'
									name='rep_pro'>접수중</a> <a href='reportProCon?rep_pro=진행중'
									class='dropdetails' id='pro03' name='rep_pro'>진행중</a> <a
									href='reportProCon?rep_pro=진행완료' class='dropdetails' id='pro04'
									name='rep_pro'>진행완료</a>
								<%
								break;
								case "진행완료" :
								%>
								<div class='dropbtn'>진행완료</div>
							</div>
							<div id='myDropdown' class='dropdown-content'>
								<a href='reportProCon?rep_pro=접수대기' class='dropdetails'
									id='pro01' name='rep_pro'>접수대기</a> <a
									href='reportProCon?rep_pro=접수중' class='dropdetails' id='pro02'
									name='rep_pro'>접수중</a> <a href='reportProCon?rep_pro=진행중'
									class='dropdetails' id='pro03' name='rep_pro'>진행중</a> <a
									href='reportProCon?rep_pro=진행완료' class='dropdetails' id='pro04'
									name='rep_pro'>진행완료</a>
								<%
								break;
								}
								} else if (updatePro != null) {
								switch (updatePro.getRep_pro()) {
								case "접수대기" :
								%>
								<div class='dropbtn'>접수대기</div>
							</div>
							<div id='myDropdown' class='dropdown-content'>
								<a href='reportProCon?rep_pro=접수대기' class='dropdetails'
									id='pro01' name='rep_pro'>접수대기</a> <a
									href='reportProCon?rep_pro=접수중' class='dropdetails' id='pro02'
									name='rep_pro'>접수중</a> <a href='reportProCon?rep_pro=진행중'
									class='dropdetails' id='pro03' name='rep_pro'>진행중</a> <a
									href='reportProCon?rep_pro=진행완료' class='dropdetails' id='pro04'
									name='rep_pro'>진행완료</a>
								<%
								break;
								case "접수중" :
								%>
								<div class='dropbtn'>접수중</div>
							</div>
							<div id='myDropdown' class='dropdown-content'>
								<a href='reportProCon?rep_pro=접수대기' class='dropdetails'
									id='pro01' name='rep_pro'>접수대기</a> <a
									href='reportProCon?rep_pro=접수중' class='dropdetails' id='pro02'
									name='rep_pro'>접수중</a> <a href='reportProCon?rep_pro=진행중'
									class='dropdetails' id='pro03' name='rep_pro'>진행중</a> <a
									href='reportProCon?rep_pro=진행완료' class='dropdetails' id='pro04'
									name='rep_pro'>진행완료</a>
								<%
								break;
								case "진행중" :
								%>
								<div class='dropbtn'>진행중</div>
							</div>
							<div id='myDropdown' class='dropdown-content'>
								<a href='reportProCon?rep_pro=접수대기' class='dropdetails'
									id='pro01' name='rep_pro'>접수대기</a> <a
									href='reportProCon?rep_pro=접수중' class='dropdetails' id='pro02'
									name='rep_pro'>접수중</a> <a href='reportProCon?rep_pro=진행중'
									class='dropdetails' id='pro03' name='rep_pro'>진행중</a> <a
									href='reportProCon?rep_pro=진행완료' class='dropdetails' id='pro04'
									name='rep_pro'>진행완료</a>
								<%
								break;
								case "진행완료" :
								%>
								<div class='dropbtn'>진행완료</div>
							</div>
							<div id='myDropdown' class='dropdown-content'>
								<a href='reportProCon?rep_pro=접수대기' class='dropdetails'
									id='pro01' name='rep_pro'>접수대기</a> <a
									href='reportProCon?rep_pro=접수중' class='dropdetails' id='pro02'
									name='rep_pro'>접수중</a> <a href='reportProCon?rep_pro=진행중'
									class='dropdetails' id='pro03' name='rep_pro'>진행중</a> <a
									href='reportProCon?rep_pro=진행완료' class='dropdetails' id='pro04'
									name='rep_pro'>진행완료</a>
								<%
								break;
								}
								}
								%>
							</div>
						</div>
						</div> <!-- jsp 작업할때 필요시 버튼사용 --> <!-- <button class="search_btn" type="submit" value="submit">저장</button> -->
					</td>
				</tr>
			</table>
			<%
			}
			%>
		</form>

		<p class="tit">인적사항</p>
		<table class="table">
			<caption></caption>
			<tr class="tableHt">
				<td class="thbg">구분</td>
				<td>개인</td>
				<td class="thbg">작성자 ID</td>
				<td><%=list.getMem_id()%></td>
			</tr>
		</table>
	</div>

	<!-- footer -->
	<%@include file="footer.jsp"%>
	<!-- footer 끝 -->


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- 드롭바 JS -->
	<script src="js/reportContent.js"></script>

	<!-- 지도api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c272e0c1868af9eec51e997a5a0d6365&libraries=services"></script>

	<script>
		// 지도 api
		var keyword = document.getElementById('keyword').innerText;

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(keyword, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				console.log(status);
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
	</script>

</body>
</html>