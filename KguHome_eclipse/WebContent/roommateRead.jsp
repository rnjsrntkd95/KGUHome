<%@ page contentType="text/html;charset=utf-8" language="java" import="java.lang.String" %>
<%@ page import="jiwoo.database.reviewBoard.reviewBoard" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jiwoo.database.infoBoard.infoBoard" %>
<%@ page import="jiwoo.database.roommateBoard.roommateBoard" %>

<!DOCTYPE HTML>
<!--
Editorial by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>Elements - Editorial by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="assets/css/main.css" />
    <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
<% request.setCharacterEncoding("utf-8"); 
		String user_id = null;

	if (session.getAttribute("user_id") != null) {

		user_id = (String) session.getAttribute("user_id");

	}%>

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
                    <li><a href="#" class="icon fa-medium"><span class="label">Medium</span></a></li>
                </ul>
            </header>

            <!-- Content -->
            <section>
                <header class="main">
                    <h1>게시글 조회</h1>
                </header>

                <!-- Content -->
                <div class="row">
                    <div class="6u 12u$(small)">
                        <%
                            roommateBoard rb = new roommateBoard();
                            request.setCharacterEncoding("utf-8");
                            String id = request.getParameter("id");
                            rb.addViewCount(id);

                            ArrayList<String> result = new ArrayList<String>();
                            result=rb.selectOneRoommate(id);
                            String title=result.get(1);
                            String body=result.get(2);
                            String uid = result.get(6);
                        %>
                        <h3><%=title%></h3>
                        <p><%=body%></p>
                    </div>
                </div>
                <%
                    String sessionUid = null;

                    if (session.getAttribute("uid") != null) {

                        sessionUid = (String) session.getAttribute("uid");

                    }

                    if(sessionUid.equals(uid)){
                %>
                <ul class="actions">
                    <li><a href="roommateEdit.jsp?id=<%=id%>" class="button special">수정하기</a></li>
                    <li><a href="roommateDelete.jsp?id=<%=id%>" class="button">삭제하기</a></li>
                </ul>
                <%
                    }
                %>
                <hr class="major" />

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
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>

</body>
</html>