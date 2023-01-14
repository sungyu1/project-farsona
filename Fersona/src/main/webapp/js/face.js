// 유사수배자 조회
let div = document.getElementById('wantedhid')
function nohidden() {
// 안보이게했다가 보이게하기
  //div.style.visibility = 'visible';
  //div.style.position = 'static';
  
	div.innerHTML += '<div class="wanted" id="middle"><img class="face_img" src="./imgs/drawing.png" alt="파일준비중"></div>'
	div.innerHTML += '<div class="wanted_criminal"><div class="wantedborder"><div class="face_img_frame"><img class="img_frame" src="./imgs/drawing.png" alt="첨부파일"></div><table><tr><td colspan="2">고유번호 : <p>1</p></td></tr><tr><td colspan="2">이름 : <p>홍길동 (51, 남)</p></td></tr><tr><td colspan="2">죄명 : <p>살인</p></td></tr></table></div>	<div class="wantedborder"><div class="face_img_frame"><img class="img_frame" src="./imgs/drawing.png" alt="첨부파일"></div><table><tr><td colspan="2">고유번호 : <p>1</p></td></tr><tr><td colspan="2">이름 : <p>홍길동 (51, 남)</p></td></tr><tr><td colspan="2">죄명 : <p>살인</p></td></tr></table></div><div class="wantedborder"><div class="face_img_frame"><img class="img_frame" src="./imgs/drawing.png" alt="첨부파일"></div><table><tr><td colspan="2">고유번호 : <p>1</p></td></tr><tr><td colspan="2">이름 : <p>홍길동 (51, 남)</p></td></tr><tr><td colspan="2">죄명 : <p>살인</p></td></tr></table></div><div class="wantedborder"><div class="face_img_frame"><img class="img_frame" src="./imgs/drawing.png" alt="첨부파일"></div><table><tr><td colspan="2">고유번호 : <p>1</p></td></tr><tr><td colspan="2">이름 : <p>홍길동 (51, 남)</p></td></tr><tr><td colspan="2">죄명 : <p>살인</p></td></tr></table></div></div>'
}

// 생성하기 클릭시 4면으로 전환
$(document).on('click', '.facecreate_btn', function () {
	$('.imgspace1').remove()
	$('.imgspace').empty()
	$('.imgspace').append('<table><tr><td><label><input type="radio" value="img01"name="img"><div class="imgspace01"><img class="imgspace02" src="./imgs/drawing.png" alt="첨부파일"></div></label></td><td><label><input type="radio" value="img02"name="img"><div class="imgspace01"><img class="imgspace02" src="./imgs/drawing.png" alt="첨부파일"></div></label></td></tr><tr><td><label><input type="radio" value="img03" name="img"><div class="imgspace01"><img class="imgspace02" src="./imgs/drawing.png" alt="첨부파일"></div></label></td><td><label><input type="radio" value="img04"	name="img"><div class="imgspace01"><img class="imgspace02" src="./imgs/drawing.png" alt="첨부파일"></div></label></td></tr></table>')
})
