<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="myPageBoard.myPageBoard"%>

<%
	request.setCharacterEncoding("utf-8");
String user_id = null;
String uid = null;

if (session.getAttribute("user_id") != null) {

	user_id = (String) session.getAttribute("user_id");

}
if (session.getAttribute("uid") != null) {

	uid = (String) session.getAttribute("uid");

}
myPageBoard mp = new myPageBoard();
%>

<!DOCTYPE HTML>
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="./resources/assets/css/main.css" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="http://code.jquery.com/jquery.js"></script>
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<style>
	a {
	color: #f56a6a;}
	</style>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index" class="logo"><strong>KGU Home</strong></a>
					<ul class="icons">
						<li><a href="join.jsp" class="icon fa-users"><span
								class="label">Sign Up</span></a></li>
						<li><a href="login.jsp" class="icon fa-user"><span
								class="label">Sign In</span></a></li>
						<li><a href="MyPage.jsp" class="icon fa-cog"><span
								class="label">Sign In</span></a></li>
					</ul>
				</header>

				<!-- Banner -->
				<section id="banner">

					<div class="content">

						<form method="get" action="./userEditAction.jsp">

							<div class="form-group">

								<label>아이디</label> <input type="text" name="user_id"
									class="form-control" value="<%=mp.getID(uid)%>" readonly>

							</div>

							<div class="form-group">

								<label>비밀번호</label> <input type="password" name="pwd"
									value=<%=mp.getPWD(uid)%> class="form-control">

							</div>

							<div class="form-group">

								<label>닉네임</label> <input type="text" name="nickname"
									value=<%=mp.getNickName(uid)%> class="form-control">

							</div>


							<div class="form-group">

								<label>이메일</label> <input type="email" name="userEmail"
									class="form-control" value="<%=mp.getEmail(uid)%>" readonly>

							</div>
							<div class="form-group">

								<label>등급</label> <input type="text" name="grade"
									value=<%=mp.getGrade(uid)%> class="form-control" readonly>

							</div>

							<button type="submit" class="botton big"
								style="border-radius: 0.375em;">정보 수정</button>

						</form>

					</div>







				</section>

				<!-- Section -->



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
	<script src="./resources/assets/js/jquery.min.js"></script>
	<script src="./resources/assets/js/skel.min.js"></script>
	<script src="./resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="./resources/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="./resources/assets/js/main.js"></script>

</body>
</html>