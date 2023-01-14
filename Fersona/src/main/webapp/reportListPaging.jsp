<%@page import="com.smhrd.model.Report"%>
<%@page import="com.smhrd.model.ReportDAO"%>
<%@page import="java.util.List"%>
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

	<%
	ReportDAO dao = new ReportDAO();
	List<Report> list = dao.selectAllReport();
	%>
	<!-- navbar -->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->

	<div class="contain">
		<form action="#" method="post">
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
		<p id="totalLeft">
			총
			<%=list.size()%>건이 검색되었습니다.
		</p>
		<table class="table">
			<tr id="th" class="tableHt">
				<th>번호</th>
				<th>신고유형</th>
				<th>신고내용</th>
				<th>등록일</th>
				<th>진행현황</th>
			</tr>

			<c:forEach begin="0" end="9" step="1" varStatus="status">
				<!-- <tr class="tableHt" onClick="location.href='reportContent.jsp'" -->
				<tr class="tableHt" style="cursor: pointer;"
					id="list${status.index}">
					<%-- 					<td id="num_${status.index}"></td>
					<td id="rep_cate_${status.index}"></td>
					<td id="rep_con_${status.index}"></td>
					<td id="rep_date_${status.index}"></td>
					<td id="rep_wri_${status.index}"></td> --%>
				</tr>
			</c:forEach>

		</table>

		<!-- 이전 다음 페이지 넘기기 pagination -->
		<ul class="pagination pagination-sm justify-content-center"
			style="margin-top: 30px;">
			<li id="link" class="page-item"><a class="page-link" href="#">◀</a></li>
			<li id="link" class="page-item active"><a class="page-link"
				href="#">1</a></li>
			<!-- <li id = "link" class="page-item"><a class="page-link" href="#">2</a></li>
			<li id = "link" class="page-item"><a class="page-link" href="#">3</a></li>
			 -->
			<li id="link" class="page-item"><a class="page-link" href="#">▶</a></li>
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

	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		// 게시물요청
		next_list(1, 1);

		var arr = null;
		var pageSize = 3;
		var maxRow = 10;

		function button_create(data_list, startPage) {

			var pageNum = null;

			if (data_list.length % maxRow == 0) {
				pageNum = data_list.length / maxRow;
			}

			else {
				pageNum = Math.floor(data_list.length / maxRow) + 1;
			}

			var currentPage = startPage;

			for (var i = 0; i < pageNum; i++) {
				arr = data_list;
				$('#controller').append(
						'<button onclick="page(' + currentPage + ')" id="'
								+ currentPage + '" class="button">'
								+ currentPage + '</button>');
				currentPage = currentPage + 1;
			}
		}

		//다음 버튼이 눌린다면 그에 맞는 버튼들이 생성, 삭제 와 해당 리스트가 출력되기 위한 메소드 
		function next_list(startRow, startPage) {
			$.ajax({
				/* jsp 시작하면서 바로 border서블릿과 비동기 통신으로 DB 에있는 내용을 가져온다 */
				url : 'reportPagingCon',
				method : 'post',
				dataType : 'json', // 응답데이터 형식 지정
				data : {
					"num" : startRow
				},/* 한 페이지 에서 가져와야하는 양이 정해져 있으므로 어디 페이지에서 요청했는지 알기위해 가져올DB의 시작 num을 같이 넘겨 준다 */
				success : function(data_list) {
					console.log(data_list)
					if (data_list.length < 10) {/* DB를 통해 가져왔는데 가져온 양이 테이블 행의 갯수인 10 보다 적으면 html의 테이블은 이전값을 가지고 있으므로 안보이게 .hide()를 사용해주어야 한다 */
						list_write(data_list);
						button_create(data_list, startPage);
					}

					else {
						print_list(data_list);
						button_create(data_list, startPage);
					}

				},
				error : function(e) {
					alert(e);
				}

			});

		}

		//jsonArray타입의 객체의 갯수가 10개보다 적을경우 객체를 매개변수로 받아 출력하는 함수이다.
		function list_write(data_list) {

			for (var i = 0; i < data_list.length; i++) {//jquery 문을통해 태그안의 내용을 바꾸어준다 --> .text()사용
				console.log(data_list[i].num)
				console.log(data_list[i].rep_cate)
				console.log(data_list[i].rep_con)
				console.log(data_list[i].rep_date)
				console.log(data_list[i].rep_wri)

				$('#list' + i).html(
						"<td>" + (i + 1) + "</td><td>" + data_list[i].rep_cate
								+ "</td><td><a href='reportContentCon?num="
								+ data_list[i].num + "'>"
								+ data_list[i].rep_con + "</td></a><td>"
								+ data_list[i].rep_wri + "</td><td>"
								+ data_list[i].rep_pro + "</td>");

				/* 				$('#list' + i).html(
				 "<a href='reportContentCon.jsp?num=" + data_list[i].num
				 + "'><td>" + (i + 1) + "</td><td>"
				 + data_list[i].rep_cate + "</td><td>"
				 + data_list[i].rep_con + "</td><td>"
				 + data_list[i].rep_wri + "</td><td>"
				 + data_list[i].rep_pro + "</td></a>"); */

			}

			for (var i = data_list.length; i < 10; i++) {//jsonArray타입의 객체의 갯수가 10개보다 적을경우 데이터가 들어가지 않는 행은 안보임 처리를 해준다

				$('#list' + i).hide();
				/* 				$('#num_' + i).hide();
				 $('#rep_cate_' + i).hide();
				 $('#rep_con_' + i).hide();
				 $('#rep_date_' + i).hide();
				 $('#rep_wri_' + i).hide(); */
			}

		}

		//클로저 함수 --> 클릭된 버튼의 값에 맞게 불러온 데이터 를 슬라이싱 해서 보여줌
		//클릭된 버튼의 값을 사용해서 슬라이싱 범위인 startNum,endNum을 지정해 준다.
		//한 페이지 에는 페이지안에 속해있는 페이지 블럭에 맞는 게시물(레코드) 수가 있기 때문이다.
		//--->한 페이지 가 가지고 있는 배열안에서 그때그때 해당페이지 블럭을 클릭 한다면 거기 범위에 맞는 데이터를 가져오기 위해 슬라이싱 해줄 필요가 있다
		function page(currentPage) {

			var startNum = (currentPage - 1) * 10 + 1;
			var endNum = currentPage * 10;

			var start_index = 0;
			var end_index = 0;

			//endNum 이 해당 배열의 마지막 숫자보다 크다면 다시 슬라이싱이 제대로 되지 않으므로 범위를 다시 지정해 주어야 한다
			//구분 하기 위해 check라는 변수를 사용해서 check 값이 변하지 않는다면 endNum의 범위를 다시 지정해준다
			var check = null;

			for (var i = 0; i < arr.length; i++) {
				if (arr[i].num == startNum) {
					start_index = i;
				}
				if (arr[i].num == endNum) {
					end_index = i;
					check = 1;
				}

			}

			var new_arr = new Array();

			if (check != 1) {
				end_index = arr.length - 1; // endNum의 는 배열의 마지막 인덱스 번호이다. 
			}

			new_arr = arr.slice(start_index, end_index + 1);

			if (new_arr.length < maxRow) {//데이터가 maxRow보다 작다면 데이터를 출력하는 데에 있어서 다르게 처리해주어야 함
				list_write(new_arr);
			} else {
				print_list(new_arr);
			}

		}

		//10개 보다 큰 게시물이 출력 될때 이전의 데이터는 10개보다 작을수 있으므로
		//.hide()메소드가 사용되어 가려져 있을 확률 이 있다
		//그래서 전부 .show() 로 보여준다음

		//해당 게시물을 출력한다
		function print_list(data_list) {
			for (var i = 0; i < 10; i++) {
				$('#list' + i).show();

				$('#list' + i)
						.html(
								"<td>"
										+ (i + 1)
										+ "</td><td><a href='reportContentCon?num="
										+ data_list[i].num
										+ "'>"
										+ data_list[i].rep_cate
										+ "</td></a><td><a href='reportContentCon?num="
										+ data_list[i].num
										+ "'>"
										+ data_list[i].rep_con
										+ "</td></a><td><a href='reportContentCon?num="
										+ data_list[i].num
										+ "'>"
										+ data_list[i].rep_wri
										+ "</td></a><td><a href='reportContentCon?num="
										+ data_list[i].num + "'>"
										+ data_list[i].rep_pro + "</td></a>");
			}
		}
	</script>
</body>
</html>