<%@ page contentType = "text/html;charset=utf-8" import="java.sql.*"%>
<%@ page import="database.DBcon" %>

<html>
<head>
    <title>쪽지함</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <!--[if lte IE 8]>
    <script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="assets/css/main.css"/>
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ie9.css"/><![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ie8.css"/><![endif]-->
</head>
<body>
<%
String user_id = null;

if (session.getAttribute("user_id") != null) {

user_id = (String) session.getAttribute("user_id");

}
%>
<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">

            <!-- Header -->
            <header id="header">
					<a href="index" class="logo"><strong>KGU Home</strong></a>
                <ul class="icons">
                    <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                    <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                    <li><a href="#" class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
                    <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                    <li><a href="messageView.jsp" class="icon fa-medium"><span class="label">Medium</span></a></li>
                </ul>
            </header>

            <!-- Content -->
            <section>
                <!-- Elements -->
                <h3>쪽지함</h3>

                <div class="table-wrapper">
                    <table>
                        <thead>
                        <tr>
                            <th>닉네임</th>
                            <th>내용</th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr>
                            <td>닉네임~~</td>
                            <td>내용~~</td>
                            <td> </td>
                        </tr>
                        </tbody>

                        <tfoot>
                        <tr>
                            <td colspan="2"></td>
                            <td> </td> <!-- 테이블 맨 밑에 글 추가 가능-->
                        </tr>
                        </tfoot>
                    </table>
                </div>


                <ul class="pagination">
                    <li><span class="button disabled">Prev</span></li>
                    <li><a href="#" class="page active">1</a></li>
                    <li><a href="#" class="page">2</a></li>
                    <li><a href="#" class="page">3</a></li>
                    <li><a href="#" class="page">4</a></li>
                    <li><a href="#" class="page">5</a></li>
                    <li><a href="#" class="button">Next</a></li>
                </ul>

            </section>

        </div>
    </div>

   						<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<ul class="icons login">
						<%
							if (user_id == null) {
						%>
						<li><a href="join.jsp" class="icon fa-users"><span
								class="label">회원 가입</span></a></li>
						<li style="border: 0;"><a href="login.jsp"
							class="icon fa-user"><span class="label">로그인</span></a></li>
						<%
							} else {
						%>
						<li><a href="myPage.jsp" class="icon fa-cog"><span
								class="label">마이 페이지</span></a></li>
						<li style="border: 0;"><a href="userLogout.jsp"
							class="icon fa-times"><span class="label">로그아웃</span></a></li>
						<%
							}
						%>
					</ul>

					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul class="side-menu">
						<li><a href="roomList.jsp">거래 게시판</a></li>
						<li><a href="reviewList.jsp">리뷰 게시판</a></li>
						<li><a href="infoList.jsp">정보 게시판</a></li>
						<li><a href="roommateList.jsp">룸메이트 구인 게시판</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>맛동산 팀 (5조)</h2>
					</header>
					<p>경기대학교 학우들의 건강한 자취 생활을 위한 웹 커뮤니티입니다.</p>
					<ul class="contact">
						<li class="fa-envelope-o"><a href="#">KGUHome@gmail.com</a></li>
						<li class="fa-home">경기대학교 컴퓨터공학부<br />경기도 수원시 영통구 광교산로 143-42</li>
						
					</ul>
				</section>
			</div>
		</div>


</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]>
<script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>

</body>
</html>