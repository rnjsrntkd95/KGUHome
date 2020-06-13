<%@ page contentType="text/html;charset=utf-8" language="java"
	import="java.lang.String"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="jiwoo.database.reviewBoard.reviewBoard"%>
<%@ page import="jiwoo.database.infoBoard.infoBoard"%>
<%@ page import="jiwoo.database.roommateBoard.roommateBoard"%>
<%@ page import="jiwoo.database.roomBoard.roomBoard"%>

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
#map {
	border: solid 2px #f56a6a;
	border-radius: 5px;
}

h5 {
	color: #f56a6a;
}

</style>

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
						HTML5 UP</a>
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

				<!-- Content -->
				<section>
					<!-- Elements -->
					<h2 id="elements">방 게시판</h2>
					<div class="row 200%">
						<div class="6u 12u$(medium)">

							<h3>글 작성</h3>

							<form method="post" action="roomInsert">
								<div class="row uniform">
									<div class="12u 12u$(xsmall)">
										<input type="text" name="title" id="title" value=""
											placeholder="Title" />
									</div>
									<div class="6u 12u$(xsmall)">
										<input type="text" name="deposit" id="deposit" value=""
											placeholder="보증금" />
									</div>
									<div class="6u 12u$(xsmall)">
										<input type="text" name="rent" id="rent" value=""
											placeholder="월세" />
									</div>

									<!-- Break -->
									<div class="12u$">
										<textarea name="content" id="content"
											placeholder="Content area" rows="6"></textarea>
									</div>


									<div class="12u$">
										<h5>등록할 자취방의 위치를 Click!</h5>
										<div id="map" style="width: 100%; height: 300px;"></div>
									</div>
									<input type="file" id="file" name="file">

									<%
										String uid = null;

									if (session.getAttribute("uid") != null) {

										uid = (String) session.getAttribute("uid");

									}
									%>

									<input type="hidden" id="uid" name="uid" value="<%=uid%>" />

									<!-- Break -->
									<div class="12u$">
										<ul class="actions">
											<li><input type="submit" value="작성완료" class="special"
												onclick="location.href='index.html'" /></li>
											<li><input type="reset" value="초기화" /></li>
										</ul>
									</div>
									<input type="hidden" name="latitude" id="latitude" value="" /> 
									<input type="hidden" name="longitude" id="longitude" value="" />


								</div>
							</form>

						</div>
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


	<!-- Map Script -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=291ae91548b72e5c96e2ad42f5772f46"></script>

	<script>
		var registerMarker = new kakao.maps.Marker();
		var myInfoWindow = new kakao.maps.InfoWindow();

		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.297092027, 127.0370499),
			level : 5
		};

		var map = new kakao.maps.Map(container, options);
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TORIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 클릭한 지점 마커 표시 위도 경도 표시
		kakao.maps.event
				.addListener(
						map,
						'click',
						function(mouseEvent) {
							// 클릭한 위도, 경도 정보를 가져옵니다 
							var latlng = mouseEvent.latLng;
							registerMarker.setMap(null);
							myInfoWindow.close();

							// 마커 생성
							registerMarker = new kakao.maps.Marker({
								position : latlng,
							});
							registerMarker.setMap(map);

							// 인포윈도우를 생성합니다
							var iwContent = '<div style="padding:5px;">여기가 맞나요?</div>', iwPosition = new kakao.maps.LatLng(
									latlng);
							myInfoWindow = new kakao.maps.InfoWindow({
								position : iwPosition,
								content : iwContent,
								removable : true
							});
							myInfoWindow.open(map, registerMarker);

							var latDiv = document.getElementById('latitude');
							latDiv.value = latlng.getLat();
							var lonDiv = document.getElementById('longitude');
							lonDiv.value = latlng.getLng();
							
						});
	</script>

</body>
</html>