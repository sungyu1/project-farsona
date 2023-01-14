<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>CATCH FACE</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
</head>
<body>
		<!--navbar-->
        <%@include file="nav.jsp"%>
        <!--navbar 끝-->
        <header class="bg-secondary py-5">
        <article class="container px-lg-5 ">
            <div class="wanted">
                <img class="face_image"/>
            </div>
            <div class="wanted_criminal">
                <div class="wanted_criminal_li">
                    <img class="face_image"/>
                    <ul class="information">
                        <li>고유번호: <p>1234</p></li>
                        <li>이름: <p>000</p></li>
                        <li>나이: <p>000</p></li>
                        <li>죄명: <p>000</p></li>
                    </ul>

                </div>
                <div class="wanted_criminal_li">
                    <img class="face_image"/>
                    <ul class="information">
                        <li>고유번호: <p>1234</p></li>
                        <li>이름: <p>000</p></li>
                        <li>나이: <p>000</p></li>
                        <li>죄명: <p>000</p></li>
                    </ul>
                    
                </div>
                <div class="wanted_criminal_li">
                    <img class="face_image"/>
                    <ul class="information">
                        <li>고유번호: <p>1234</p></li>
                        <li>이름: <p>000</p></li>
                        <li>나이: <p>000</p></li>
                        <li>죄명: <p>000</p></li>
                    </ul>

                </div>
                <div class="wanted_criminal_li">
                    <img class="face_image"/> 
                    <ul class="information">
                        <li>고유번호: <p>1234</p></li>
                        <li>이름: <p>000</p></li>
                        <li>나이: <p>000</p></li>
                        <li>죄명: <p>000</p></li>
                    </ul>     
                    
                </div>
            </div>
        </article>
    </header>
    <!-- 페이지마지막-->        
        <%@include file="footer.jsp"%>
        <!-- Bootstrap core JS-->

</body>
</html>