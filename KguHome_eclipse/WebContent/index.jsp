<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>

<%@ page import="user.UserDAO"%>
<%@ page import="java.util.*" %>

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html lang="ko">
<head>
<title>KGU Home</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src=./resources/"assets/js/ie/html5shiv.js"></script><![endif]-->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<link rel="stylesheet" href="./resources/assets/css/main.css" />
<link rel="stylesheet" href="./assets/css/all_sale_map.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="./resources/assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="./resources/assets/css/ie8.css" /><![endif]-->

<style>
.main-title {
	font-weight: bold;
	display: flex;
}

#banner h1 {
	width: 100%;
	margin-left: 30px;
}

#main>.inner>section {
	padding-top: 2em;
}

.famous-title {
	display: flex;
	justify-content: space-between;
}

.famous-title>h3 {
	line-height: 41px;
}

#menu ul a {
	font-size: 1.0em;
	margin-right: 10px;
}
</style>

</head>
<body>
	<%
		String user_id = null;

	if (session.getAttribute("user_id") != null) {

		user_id = (String) session.getAttribute("user_id");

	}
	%>


	<%
		boolean emailChecked = new UserDAO().getUserEmailChecked(user_id);

	if (user_id != null && emailChecked == false) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("location.href = 'emailSendConfirm.jsp'");

		script.println("</script>");

		script.close();

		return;

	}
	%>
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">


				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h1>KGU Home</h1>
						</header>
					</div>
					<div id="map" style="width: 100%; height: 600px;"></div>
				</section>

				<!-- Section -->


				<!-- Section -->
				<section>
					<header class="major">
						<h2>인기글</h2>
					</header>
					<div class="posts">
						<article>
							<div class="famous-title">
								<h3>거래 게시판</h3>
								<ul class="actions">
									<li><a href="#" class="button">More</a></li>
								</ul>
							</div>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>

						</article>
						<article>
							<h3>리뷰 게시판</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>

						</article>
						<article>
							<h3>정보 게시판</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>

						</article>
						<article>
							<h3>룸메이트 구인</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>

						</article>

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
						<li><a href="login.jsp" class="icon fa-user"><span
								class="label">로그인</span></a></li>
						<%
							} else {
						%>
						<li><a href="MyPage.jsp" class="icon fa-cog"><span
								class="label">마이 페이지</span></a></li>
						<li><a href="userLogout.jsp" class="icon fa-times"><span
								class="label">로그아웃</span></a></li>
						<%
							}
						%>
					</ul>

					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul class="side-menu">
						<li><a href="reviewList.jsp">거래 게시판</a></li>
						<li><a href="">리뷰 게시판</a></li>
						<li><a href="">정보 게시판</a></li>
						<li><a href="">룸메이트 구인 게시판</a></li>

						<!-- 						<li><span class="opener">Content CREATE</span>
							<ul>
								<li><a href="reviewCreate.jsp">Create Review</a></li>
								<li><a href="roomCreate.jsp">Create Room info</a></li>
							</ul></li>
						<li><span class="opener">Content EDIT</span>
							<ul>
								<li><a href="reviewCreate.jsp">Edit Review</a></li>
								<li><a href="roomCreate.jsp">Edit Room info</a></li>
							</ul></li>
						<li><span class="opener">Messenger</span>
							<ul>
								<li><a href="messageSend.jsp">���� ������</a></li>
								<li><a href="receivedMessages.jsp">���� ����</a></li>
								<li><a href="sentMessages.jsp">���� ����</a></li>

							</ul></li> -->

						<!-- 		

						<li><a href="index.jsp">Homepage</a></li>
						<li><a href="generic.html">Generic</a></li>
						<li><a href="elements.html">Elements</a></li>
						<li><span class="opener">Submenu</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">Etiam Dolore</a></li>
						<li><a href="#">Adipiscing</a></li>
						<li><span class="opener">Another Submenu</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">Maximus Erat</a></li>
						<li><a href="#">Sapien Mauris</a></li>
						<li><a href="#">Amet Lacinia</a></li> -->
					</ul>
				</nav>



				<!-- Section -->
				<section>
					<header class="major">
						<h2>Get in touch</h2>
					</header>
					<p>Sed varius enim lorem ullamcorper dolore aliquam aenean
						ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin
						sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat
						tempus aliquam.</p>
					<ul class="contact">
						<li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
						<li class="fa-phone">(000) 000-0000</li>
						<li class="fa-home">1234 Somewhere Road #8254<br />
							Nashville, TN 00000-0000
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>

			</div>
		</div>


	</div>


	<!-- Scripts -->
	<script src="./resources/assets/js/jquery.min.js"></script>
	<script src="./resources/assets/js/skel.min.js"></script>
	<script src="./resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="./resources/assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="./resources/assets/js/main.js"></script>

	<!-- Map Script -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=291ae91548b72e5c96e2ad42f5772f46"></script>

	<script>
	
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.297092027, 127.0370499),
			level : 4
		};

		var map = new kakao.maps.Map(container, options);

		// ��Ʈ�� �ٸ� ���� ���� ǥ���մϴ�.
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TORIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		var openedCustomOverlay = new kakao.maps.CustomOverlay();
		var openedSaleMarker = null;
		
		// ���� �Ĺ� ��Ŀ ǥ��
		var positions = [
			{
				title: '정문 입구',
				latlng: new kakao.maps.LatLng(37.3016229, 127.0337445)
			},
			{
				title: '정문 산길',
				latlng: new kakao.maps.LatLng(37.2973027, 127.0328685)
			},
			{
				title: '후문 입구',
				latlng: new kakao.maps.LatLng(37.2975997, 127.0412514)
			},
			{
				title: '거북 샛길',
				latlng: new kakao.maps.LatLng(37.3005728,  127.0420200)
			}
		]
 		for (position of positions) {
 			var imageSrc = 'image/finish_marker.png',
 			imageSize = new kakao.maps.Size(25, 25);
 			var finishMarkerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			
			var marker = new kakao.maps.Marker({
				map: map,
				position: position.latlng,
				title: position.title,
				image: finishMarkerImage
			});
		} 
		
		
		// ��ϵ� �Ź����� ��Ŀ ǥ��
		var posts = [];
			<%
				ArrayList<String[]> posts = (ArrayList<String[]>) request.getAttribute("posts");
				String test = (String) request.getAttribute("aa");
				int count = 0;
				%>
				
		var sales = []		
 		for (var i=0; i<<%=posts.size()%>;i++) {
			<% 
			String[] post = posts.get(count);
			count++;
			%>
			var sale = {
					title: "<%=post[0]%>",
					deposit: "<%=post[1]%>",
					rent: "<%=post[2]%>",
<%-- 					image: "<%=post[3]%>",
 --%>					latitude: Number("<%=post[4]%>"),
					longitude: Number("<%=post[5]%>"),
					created_at: "<%=post[6]%>"
			};			
			sales.push(sale);
		}
		console.log(sales);
		
	/* 	var sales = [
			{	
				latitude: 37.2968324,
				longitude:  127.0311737,
				title: "ù��° �����!!!!!!!!!!!!!!!!",
				image: "",
				deposit: 500,
				rent: 30,
				created_at: '2020-06-01'
			},
			{
				latitude: 37.2979503,
				longitude:  127.0288282,
				title: "�ι�° �����!",
				image: "",
				deposit: 300,
				rent: 27,
				created_at: '2020-06-02'
			},
 			{
				latitude: 37.2953918,
				longitude:  127.0267069,
				title: "����° �����!",
				image: "",
				deposit: 500,
				rent: 35,
				created_at: '2020-06-03'
			}, 
		]; */
		
		
		function closeSaleInfo(target) {
			openedSaleMarker.setVisible(true);
			openedCustomOverlay.setMap(null);
		}
		
		function makeOverListener(map, sale, saleMarker) {
			return function() {
				if (openedSaleMarker != null) {
					openedSaleMarker.setVisible(true);	
				}
				openedCustomOverlay.setMap(null);
				var content = '<div class="overlay_info">';
				content += '    <a href="" target="_blank"><i class="fas fa-home"></i>'
				content += '		<div class="title">'+sale.title+'</div></a>'
				content += '		<i class="fas fa-times close-btn" onclick="closeSaleInfo(this)"></i>'

				content += '    <div class="desc">';
				content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
				content += '        <div class="sale-info">';
				content += '        <div class="price deposit">보증금: '+sale.deposit+'</div>';
				content += '        <div class="price rent">월세: '+sale.rent+'</div>';
				content += '        <div class="price create_at">'+sale.created_at+'</div>';
				content += '    </div></div>';
				content += '</div>';
	  			var customOverlay = new kakao.maps.CustomOverlay({
					clickable: true,
					content: content,
				    position : saleMarker.getPosition(),
				    yAnchor: 1,
				});
				customOverlay.setMap(map);   
				saleMarker.setVisible(false);
				openedCustomOverlay = customOverlay;
				openedSaleMarker = saleMarker;
			}
		}
		
		
		
 		for (sale of sales){
 			console.log(sale.latitude)
 			 			console.log(sale.longitude)

 			var imageSrc = 'image/sale_marker.png',
 			imageSize = new kakao.maps.Size(30, 30)
 			var saleMarkerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			const saleMarker = new kakao.maps.Marker({
				map: map,
				position: new kakao.maps.LatLng(sale.latitude, sale.longitude),
				image: saleMarkerImage
			});
			
			// ���������츦  Ŭ�� �̺�Ʈ ����
			kakao.maps.event.addListener(saleMarker, "click", makeOverListener(map, sale, saleMarker))
 		}

		
		


	</script>


	<script>
		var registerMarker = new kakao.maps.Marker();
		var myInfoWindow = new kakao.maps.InfoWindow();
		
		// ���ã�� ��ũ
		function checkingBookmark(target) {
			if (target.childNodes[0].getAttribute('data-prefix') == 'far')
				target.childNodes[0].setAttribute('data-prefix', 'fas')
			else
				target.childNodes[0].setAttribute('data-prefix', 'far')
				
			// ���ã�� request �۽�
/*			$.ajax({
                type: "POST",
                url: "",
                data: {},
                dataType: "json",
                async: true,
                success: function (response) {
                    $.each(response, function (key, value) {
        
                    )
                }
            })
*/
		}

		// Ŭ���� ���� ��Ŀ ǥ�� ���� �浵 ǥ��
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
		    var latlng = mouseEvent.latLng;
			registerMarker.setMap(null);
			myInfoWindow.close();
			
			// ��Ŀ ����
			registerMarker = new kakao.maps.Marker({
				position: latlng,
			});
			registerMarker.setMap(map);
			
			// ���������츦 �����մϴ�
			var iwContent = '<div style="padding:5px;">My Home!!</div>', 
		    iwPosition = new kakao.maps.LatLng(latlng); 
			myInfoWindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
				removable: true
			});
			myInfoWindow.open(map, registerMarker); 
				    
			
			////
		    var message = 'Ŭ���� ��ġ�� ������ ' + latlng.getLat() + ' �̰�, ';
		    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
		
		// ��ǥ Ŭ�� �� ��ǥ�� ǥ�� �̺�Ʈ
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
		    var latlng = mouseEvent.latLng;
		    
		    var message = 'Ŭ���� ��ġ�� ������ ' + latlng.getLat() + ' �̰�, ';
		    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
		
		</script>

</body>
</html>