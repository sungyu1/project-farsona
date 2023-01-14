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
<link href="css/main.css" rel="stylesheet" />

<!-- pie chart -->
<script
	src="https://www.koolchart.com/demo/LicenseKey/codepen/KoolChartLicense.js"></script>
<script src="https://www.koolchart.com/demo/KoolChart/JS/KoolChart.js"></script>
<link rel="stylesheet"
	href="https://www.koolchart.com/demo/KoolChart/Assets/Css/KoolChart.css" />

<!-- 신고조회 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- 숫자카운트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
	<!--navbar-->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->

	<%
	int a = 9; // 뺑소니사건
	int b = 14; // 강도
	int c = 38; // 절도
	int d = 3; // 살인
	int e = 13; // 사기
	int f = 19; // 폭력
	int g = 15; // 성범죄
	int h = 21; // 기타
	int sum = a + b + c + d + e + f + g + h; // 총사건수
	
	
	%>
	<!-- Header-->
	<div class="headr">
		<div class="contain">
			<!-- <p id="tit">쉽고 빠르고 간편한 스마트 몽타주 수사</p> -->
			<div class="main_div">
				<div class="main_li">
					<div>
						<span class="headr_span01">총</span> <span class="headr_span02 countArea">
							<%=sum%></span> <span class="headr_span01">건</span>
						<p class="headr_span03">오늘의 신고</p>
					</div>

				</div>

				<div class="main_li2">
					<table class="today">
						<tr>
							<td>
								<div>
									<span class="today_02"><%=a%></span> <span class="today_03">건</span>
								</div>
								<p class="today_01">뺑소니사건</p>
							</td>
							<td><span class="today_02"><%=b%></span> <span
								class="today_03">건</span>
								<p class="today_01">강도</p></td>
							<td><span class="today_02"><%=c%></span> <span
								class="today_03">건</span>
								<p class="today_01">절도</p></td>
							<td><span class="today_02"><%=d%></span> <span
								class="today_03">건</span>
								<p class="today_01">살인</p></td>
						</tr>
						<tr>
							<td><span class="today_02"><%=e%></span> <span
								class="today_03">건</span>
								<p class="today_01">사기</p></td>
							<td><span class="today_02"><%=f%></span> <span
								class="today_03">건</span>
								<p class="today_01">폭력</p></td>
							<td><span class="today_02"><%=g%></span> <span
								class="today_03">건</span>
								<p class="today_01">성범죄</p></td>
							<td><span class="today_02"><%=h%></span> <span
								class="today_03">건</span>
								<p class="today_01">기타</p></td>
						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>

	<div id="headr">
		<!-- 신고처리현황 -->
		<div class="con_div">
			<div class="con_div2">
				<div class="bg02">
					<p class="tit">신고처리현황</p>
					<div class="chart-div">
						<div id="chartHolder" style="height: 450px; width: 450px;"></div>
					</div>
				</div>
			</div>


			<!-- 사건별 신고현황 -->
			<div class="con_div3">
				<div class="bg01">
					<p class="tit">사건별 신고현황</p>
					<div>
						<table>
							<tr>
								<td>
									<p class="tit2">뺑소니사건</p>
									<div class="progress">
										<div class="progress-bar" style="width: 11%">11%</div>
									</div>
								</td>
								<td class="padd"><span class="tit3">110</span><span>건</span></td>
							</tr>
							<tr>
								<td>
									<p class="tit2">강도</p>
									<div class="progress">
										<div class="progress-bar" style="width: 19%">19%</div>
									</div>
								</td>
								<td class="padd"><span class="tit3">190</span><span>건</span></td>
							</tr>
							<tr>
								<td>
									<p class="tit2">절도</p>
									<div class="progress">
										<div class="progress-bar" style="width: 42%">42%</div>
									</div>
								</td>
								<td class="padd"><span class="tit3">420</span><span>건</span></td>
							</tr>
							<tr>
								<td>
									<p class="tit2">살인</p>
									<div class="progress">
										<div class="progress-bar" style="width: 10%">10%</div>
									</div>
								</td>
								<td class="padd"><span class="tit3">100</span><span>건</span></td>
							</tr>
							<tr>
								<td>
									<p class="tit2">사기</p>
									<div class="progress">
										<div class="progress-bar" style="width: 30%">30%</div>
									</div>
								</td>
								<td class="padd"><span class="tit3">300</span><span>건</span></td>
							</tr>
							<tr>
								<td>
									<p class="tit2">폭력</p>
									<div class="progress">
										<div class="progress-bar" style="width: 25%">25%</div>
									</div>
								</td>
								<td class="padd"><span class="tit3">250</span><span>건</span></td>
							</tr>
							<tr>
								<td>
									<p class="tit2">성범죄</p>
									<div class="progress">
										<div class="progress-bar" style="width: 10%">10%</div>
									</div>
								</td>
								<td class="padd"><span class="tit3">100</span><span>건</span></td>
							</tr>
							<tr>
								<td>
									<p class="tit2">기타</p>
									<div class="progress">
										<div class="progress-bar" style="width: 18%">18%</div>
									</div>
								</td>
								<td class="padd"><span class="tit3">180</span><span>건</span></td>
							</tr>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- 페이지마지막-->
	<%@include file="footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<!-- pie chart js -->
	<script src="script.js"></script>

	<script>
		// 파이그래프
		var chartVars = "KoolOnLoadCallFunction=chartReadyHandler";

		KoolChart.create("chart1", "chartHolder", chartVars, "100%", "100%");

		function chartReadyHandler(id) {
			document.getElementById(id).setLayout(layoutStr);
			document.getElementById(id).setData(chartData);
		}

		var layoutStr = '<KoolChart backgroundColor="#FFFFFF"  borderStyle="none">'
				+ '<Options>'
				+ '<Legend useVisibleCheck="false"/>'
				+ '</Options>'
				+ '<Pie2DChart id="chart" innerRadius="0.5" showDataTips="true" selectionMode="single">'
				+ '<series>'
				+ '<Pie2DSeries nameField="Month" field="Profit" startAngle="20" renderDirection="clockwise" fontSize = "18" labelPosition="inside" color="#ffffff">'
				+ '<fills>'
				+ '<SolidColor color="#20cbc2"/>'
				+ '<SolidColor color="#074d81"/>'
				+ '<SolidColor color="#40b2e6"/>'
				+ '<SolidColor color="#293241"/>'
				+ '</fills>'
				+ '<showDataEffect>'
				+ '<SeriesZoom duration="1000"/>'
				+ '</showDataEffect>'
				+ '</Pie2DSeries>'
				+ '</series>'
				+ '<backgroundElements>'
				+ '<CanvasElement>'
				+ '<CanvasLabel text="716" height="40" horizontalCenter="0" verticalCenter="-10" fontSize="24" color="#333333" backgroundAlpha="0"/>'
				+ '<CanvasLabel text="전체건수" height="24" horizontalCenter="0" verticalCenter="10" fontSize="14" color="#666666" backgroundAlpha="0"/>'
				+ '</CanvasElement>'
				+ '</backgroundElements>'
				+ '</Pie2DChart>' + '</KoolChart>';

		var chartData = [ {
			"Month" : "접수대기",
			"Profit" : 241
		}, {
			"Month" : "접수중",
			"Profit" : 122
		}, {
			"Month" : "진행중",
			"Profit" : 180
		}, {
			"Month" : "진행완료",
			"Profit" : 173
		} ];

		
		// 숫자 카운트
		$({
			value : 0
		}).animate({
			value : <%=sum %>
		}, {
			duration : 1000,
			step : function() {
				$(".countArea").text(Math.floor(this.value));
			},
			complete : function() {
				$(".countArea").text(Math.floor(this.value));
			}
		});
		
	</script>
</body>
</html>