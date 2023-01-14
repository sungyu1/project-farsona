<%@page import="com.smhrd.model.WantDAO"%>
<%@page import="com.smhrd.model.Want"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="css/faceinfoList.css" rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<!--navbar-->
	<%@include file="nav.jsp"%>
	<!--navbar 끝-->


	<!-- 대상구분  -->
	<div class="contain">
		<div class="contain_main">
			<p id="tit">수배자 검색</p>
			<a href="faceAdd.jsp" class="contain_btn">등록하기</a>
		</div>
		<form action="reportContentCon" method="post">
			<table class="table">
				<caption></caption>
				<tr>
					<td class="text">대상구분</td>
					<td><select name="want_open">
							<option value='%'>전체</option>
							<option value='공개'>공개수배</option>
					</select></td>
					<td class="text">고유번호</td>
					<td><input class="numcss" name="want_id" type="number" min="1"
						max="10000"></td>
				</tr>
				<tr>
					<td class="text">이름</td>
					<td><input class="numcss" type="text" name="want_name"></td>
					<td class="text">나이</td>
					<td><input class="numcss" type="number" name="want_age"
						min="1" max="100"></td>
				</tr>
				<tr>
					<td class="text">성별</td>
					<td class="radiocss">
						<div>
							<input type="radio" id="select" value="all" name="gender"
								checked="checked"> <label for="select" value='%'>전체</label>
							<input type="radio" id="select1" value="남" name="gender">
							<label for="select1">남자</label> <input type="radio" id="select2"
								value="여" name="gender"> <label for="select2">여자</label>
						</div>

					</td>
					<td class="text">죄명</td>
					<td><select name="rep_cate">
							<option value="%">전체</option>
							<option>뺑소니</option>
							<option>강도</option>
							<option>절도</option>
							<option>살인</option>
							<option>사기</option>
							<option>폭력</option>
							<option>성범죄</option>
					</select></td>
				</tr>
			</table>
			<div id="search_margin">
				<input type="reset" class="resetbar_btn" value="초기화"> <input
					type="submit" class="facecreate_btn" value="검색">
			</div>
		</form>

		<!-- -----수배자 정보----- -->
		<c:forEach begin="0" end="49" step="1" varStatus="status">
			<div class="wantedborder" id="list_add${status.index}">
				<div id="want_img${status.index}" class="face_img_frame">
					<!-- <img class="face_img" src="./imgs/face/wantedimg1.jpg" alt="첨부파일"> -->
				</div>
				<table>
					<tr>
						<td colspan="2">고유번호 :
							<p id="want_id${status.index}"></p>
						</td>
					</tr>
					<tr>
						<td colspan="2">이름 :
							<p id="want_name${status.index}"></p>
						</td>
					</tr>
					<tr>
						<td colspan="2">죄명 :
							<p id="rep_cate${status.index}"></p>
						</td>
					</tr>
					<tr>
						<td>
							<div class="List_btn" id="faceUpdate${status.index}"
								style="cursor: pointer;">수정하기</div>
						<td>
							<button class="wantedlist_btn" type="button"
								id="want_open${status.index}">공개수배</button>
					</tr>
				</table>

				<!-- 이전 다음 페이지 넘기기 pagination -->
			</div>
		</c:forEach>
		<ul class="pagination pagination-sm justify-content-center"
			style="margin-top: 30px;">
			<li id="link" class="page-item"><a class="page-link" href="#">◀</a></li>
			<li id="link" class="page-item active"><a class="page-link"
				href="#">1</a></li>
			<!-- <li id="link" class="page-item"><a class="page-link" href="#">2</a></li>
			<li id="link" class="page-item"><a class="page-link" href="#">3</a></li> -->
			<li id="link" class="page-item"><a class="page-link" href="#">▶</a></li>
		</ul>

		<!-- 반복작성 -->

		<!-- 페이징 -->
		<!-- <div id="controller"></div> -->


		<!-- 수배자 정보 end -->
	</div>


	<!-- 페이지마지막-->
	<%@include file="footer.jsp"%>

	<script src="js/faceInfoList.js"></script>

	<script type="text/javascript">
		/* 리스트 출력 */
		// 메소드 호출 next_list(startRow, StartPage)
		next_list(1, 1);

		var arr = null;
		var pageSize = 3;
		var maxRow = 50;

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
				url : 'faceInfoCon',
				method : 'post',
				dataType : 'json', // 응답데이터 형식 지정
				data : {
					"num" : startRow
				},/* 한 페이지에서 가져와야하는 양이 정해저 있으므로 어디 페이지에서 요청했는지 알기위해 가져올DB의 시작 num을 같이 넘겨 준다 */
				success : function(data_list) {
					console.log("성공")
					console.log(data_list)
					if (data_list.length < 50) {/* DB를 통해 가져왔는데 가져온 양이 테이블 행의 갯수인 10 보다 적으면 html의 테이블은 이전값을 가지고 있으므로 안보이게 .hide()를 사용해주어야 한다 */
						list_write(data_list);
						button_create(data_list, startPage);
					} else {
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
			console.log(data_list.length);
			for (var i = 0; i < data_list.length; i++) {//jquery 문을통해 태그안의 내용을 바꾸어준다 --> .text()사용
				$('#want_img' + i)
						.html(
								'<img class=\"face_img\" src=\"./imgs/face/' + data_list[i].want_img +'.jpg\" alt=\"첨부파일\">');
				$('#want_id' + i).text(data_list[i].want_id);
				$('#want_name' + i).text(
						data_list[i].want_name + ' (' + data_list[i].want_age
								+ ', ' + data_list[i].want_gen + ')');
				$('#rep_cate' + i).text(data_list[i].rep_cate);
				if ((data_list[i].want_open) == '공개') {
					$('#want_open' + i).attr('class', 'nowantedlist_btn');
				}
				$('#faceUpdate' + i).html(
						"<a href='faceUpdateCon?want_id="
								+ data_list[i].want_id
								+ "' class=\"a_btn\"><p>수정하기</p></a>");
			}

			for (var i = data_list.length; i < 50; i++) {//jsonArray타입의 객체의 갯수가 10개보다 적을경우 데이터가 들어가지 않는 행은 안보임 처리를 해준다
				$('#list_add' + i).hide();
				$('#want_img' + i).hide();
				$('#want_id' + i).hide();
				$('#want_name' + i).hide();
				$('#rep_cate' + i).hide();
				$('#want_open' + i).hide();
				$('#faceUpdate' + i).hide();
			}

		}

		//클로저 함수 --> 클릭된 버튼의 값에 맞게 불러온 데이터 를 슬라이싱 해서 보여줌
		//클릭된 버튼의 값을 사용해서 슬라이싱 범위인 startNum,endNum을 지정해 준다.
		//한 페이지 에는 페이지안에 속해있는 페이지 블럭에 맞는 게시물(레코드) 수가 있기 때문이다.
		//--->한 페이지 가 가지고 있는 배열안에서 그때그때 해당페이지 블럭을 클릭 한다면 거기 범위에 맞는 데이터를 가져오기 위해 슬라이싱 해줄 필요가 있다
		function page(currentPage) {

			var startNum = (currentPage - 1) * 50 + 1;
			var endNum = currentPage * 50;

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

		//10개 보다 큰 게시물이 출력 될때 이전의 데이터는 10개보다 작을 수 있으므로
		//.hide()메소드가 사용되어 가려져 있을 확률 이 있다
		//그래서 전부 .show() 로 보여준다음

		//해당 게시물을 출력한다
		function print_list(data_list) {
			for (var i = 0; i < 50; i++) {
				$('#list_add' + i).show();
				$('#want_img' + i).show();
				$('#want_id' + i).show();
				$('#want_name' + i).show();
				$('#rep_cate' + i).show();
				$('#want_open' + i).show();
				$('#faceUpdate' + i).show();

				$('#want_img' + i)
						.html(
								'<img class=\"face_img\" src=\"./imgs/face/' + data_list[i].want_img +'.jpg\" alt=\"첨부파일\">');
				$('#want_id' + i).text(data_list[i].want_id);
				$('#want_name' + i).text(
						data_list[i].want_name + ' (' + data_list[i].want_age
								+ ', ' + data_list[i].want_gen + ')');
				$('#rep_cate' + i).text(data_list[i].rep_cate);
				if ((data_list[i].want_open) == '공개') {
					$('#want_open' + i).attr('class', 'nowantedlist_btn');
				}
				$('#faceUpdate' + i).html(
						"<a href='faceUpdateCon?want_id="
								+ data_list[i].want_id
								+ "' class=\"a_btn\"><p>수정하기</p></a>");
			}
		}

		/* 공개수배 버튼클릭시 색상유지 */
		/* $(document).on('click', '.wantedlist_btn', function() {
		$(this).attr('class', 'nowantedlist_btn')
		})

		$(document).on('click', '.nowantedlist_btn', function() {
		$(this).attr('class', 'wantedlist_btn')
		})  */

		/* 공개수배 버튼클릭시 색상유지 end */
	</script>
	</ body>
</html>