<%@ page import="database.DBcon"%>
<%@ page import="myPageBoard.myPageBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>My Page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]>
    <script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ie9.css"/><![endif]-->
<!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ie8.css"/><![endif]-->

<style>
#banner {
	padding-bottom: 0;
	display: flex;
	margin-left: 100px;
}

section {
	padding-top: 0;
}

section.box_item {
	display: flex;
	justify-content: center;
	padding-right: 0;
	padding-top: 0;
}
</style>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index" class="logo"><strong>KGU Home</strong></a>
					
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-medium"><span
								class="label">Medium</span></a></li>
					</ul>
				</header>

				<!-- Banner -->
				<div>
					<section id="banner">
						<!-- 프로필 사진 변경할 수 있도록 추후 수정 -->
						<span><img class="profile" src="image/default_profile.jpg"
							alt="" style="border: 5px solid #f56a6a" /></span>
						<div class="userinfo" style="margin-left: 50px;">
							<h2><%=mp.getNickName(uid)%></h2>
							<h3><%=mp.getID(uid)%></h3>
							<p>
								<span>등급: <%=mp.getGrade(uid)%></span>
							</p>

							<ul class="actions">
								<li><a href="editUserInfo.jsp" class="button">내 정보 수정</a></li>
							</ul>
						</div>
					</section>
				</div>

				<!-- Content -->
				<section>
					<div class="boxABC">
						<section class="box_item">
							<div>
								<a href="/KguHome_eclipse/receivedMessages.jsp"><img src="image/letter.png" alt="" /></a>
								<h2>쪽지함</h2>
							</div>
						</section>
						<section class="box_item">
							<div>
								<a href="#"><img src="image/star.png" alt="" /></a>
								<h2>즐겨찾기</h2>
							</div>
						</section>
						<section class="box_item">
							<div>
								<a href="#"><img src="image/edit_writing.png" alt="" /></a>
								<h2>내 글 관리</h2>
							</div>
						</section>
					</div>
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
</body>
</html>