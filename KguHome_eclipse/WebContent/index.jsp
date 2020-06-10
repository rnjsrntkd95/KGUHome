<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>

<%@ page import="user.UserDAO"%>

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html lang="ko">
<head>
<title>Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src=./resources/"assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="./resources/assets/css/main.css" />
<link rel="stylesheet" href="./assets/css/all_sale_map.css" />

<!--[if lte IE 9]><link rel="stylesheet" href="./resources/assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="./resources/assets/css/ie8.css" /><![endif]-->
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
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index.jsp" class="logo"><strong>Editorial</strong> by
						HTML5 UP</a>
					<ul class="icons">
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
								class="label">마이페이지</span></a></li>
						<li><a href="userLogout.jsp" class="icon fa-times"><span
								class="label">로그아웃</span></a></li>
						<%
							}
						%>
					</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h1>
								Hi, I’m Editorial<br /> by HTML5 UP
							</h1>
							<p>A free and fully responsive site template</p>
						</header>
						<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu.
							Proin aliquam facilisis ante interdum congue. Integer mollis,
							nisl amet convallis, porttitor magna ullamcorper, amet egestas
							mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id
							euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor
							sit nullam.</p>
						<ul class="actions">
							<li><a href="#" class="button big">Learn More</a></li>
						</ul>
					</div>
					<div id="map" style="width: 800px; height: 425px;"></div>
					
				</section>

				<!-- Section -->
		

				<!-- Section -->
				<section>
					<header class="major">
						<h2>Ipsum sed dolor</h2>
					</header>
					<div class="posts">
						<article>
							<a href="#" class="image"><img
								src="./resources/images/pic01.jpg" alt="" /></a>
							<h3>Interdum aenean</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img
								src="./resources/images/pic02.jpg" alt="" /></a>
							<h3>Nulla amet dolore</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
							<h3>Tempus ullamcorper</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a>
							<h3>Sed etiam facilis</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
							<h3>Feugiat lorem aenean</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>
							<h3>Amet varius aliquam</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</article>
					</div>
				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><span class="opener">Content View</span>
							<ul>
								<li><a href="reviewList.jsp">Show Review</a></li>
							</ul></li>
						<li><span class="opener">Content CREATE</span>
							<ul>
								<li><a href="reviewCreate.jsp">Create Review</a></li>
								<li><a href="roomCreate.jsp">Create Room info</a></li>
							</ul></li>
						<li><span class="opener">Content EDIT</span>
							<ul>
								<li><a href="reviewCreate.jsp">Edit Review</a></li>
								<li><a href="roomCreate.jsp">Edit Room info</a></li>
							</ul>
						</li>
						<li><span class="opener">Messenger</span>
							<ul>
								<li><a href="messageSend.jsp">쪽지 보내기</a></li>
								<li><a href="receivedMessages.jsp">받은 쪽지</a></li>
								<li><a href="sentMessages.jsp">보낸 쪽지</a></li>
								
							</ul>
						</li>
						
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
			center: new kakao.maps.LatLng(37.3004755, 127.034374),
			level : 5
		};

		var map = new kakao.maps.Map(container, options);

		// 컨트롤 바를 지도 위에 표시합니다.
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TORIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		var openedCustomOverlay = new kakao.maps.CustomOverlay();
		var openedSaleMarker = null;
		
		// 정문 후문 마커 표시
		var positions = [
			{
				title: '정문',
				latlng: new kakao.maps.LatLng(37.3016229, 127.0337445)
			},
			{
				title: '정문 산길',
				latlng: new kakao.maps.LatLng(37.2973027, 127.0328685)
			},
			{
				title: '후문',
				latlng: new kakao.maps.LatLng(37.2975997, 127.0412514)
			},
			{
				title: '후문 샛길',
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
		
		// 등록된 매물들의 마커 표시
		var sales = [
			{	
				latitude: 37.2968324,
				longitude:  127.0311737,
				title: "첫번째 자취방!!!!!!!!!!!!!!!!",
				image: "",
				deposit: 500,
				rent: 30,
				created_at: '2020-06-01'
			},
			{
				latitude: 37.2979503,
				longitude:  127.0288282,
				title: "두번째 자취방!",
				image: "",
				deposit: 300,
				rent: 27,
				created_at: '2020-06-02'
			},
 			{
				latitude: 37.2953918,
				longitude:  127.0267069,
				title: "세번째 자취방!",
				image: "",
				deposit: 500,
				rent: 35,
				created_at: '2020-06-03'
			}, 
		];
		
		
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
			 	content += ' 		<button class="bookmark_btn" type="button" onclick="checkingBookmark(this)"><i class="far fa-star"></i></button>'; 

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
 			var imageSrc = 'image/sale_marker.png',
 			imageSize = new kakao.maps.Size(30, 30)
 			var saleMarkerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			// 마커 생성
			const saleMarker = new kakao.maps.Marker({
				map: map,
				position: new kakao.maps.LatLng(sale.latitude, sale.longitude),
				image: saleMarkerImage
			});
			
			// 인포윈도우를  클릭 이벤트 생성
			kakao.maps.event.addListener(saleMarker, "click", makeOverListener(map, sale, saleMarker))
 		}

		
		


	</script>


	<script>
		var registerMarker = new kakao.maps.Marker();
		var myInfoWindow = new kakao.maps.InfoWindow();
		
		// 즐겨찾기 마크
		function checkingBookmark(target) {
			if (target.childNodes[0].getAttribute('data-prefix') == 'far')
				target.childNodes[0].setAttribute('data-prefix', 'fas')
			else
				target.childNodes[0].setAttribute('data-prefix', 'far')
				
			// 즐겨찾기 request 송신
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

		// 클릭한 지점 마커 표시 위도 경도 표시
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
			registerMarker.setMap(null);
			myInfoWindow.close();
			
			// 마커 생성
			registerMarker = new kakao.maps.Marker({
				position: latlng,
			});
			registerMarker.setMap(map);
			
			// 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:5px;">My Home!!</div>', 
		    iwPosition = new kakao.maps.LatLng(latlng); 
			myInfoWindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
				removable: true
			});
			myInfoWindow.open(map, registerMarker); 
				    
			
			////
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
		
		// 좌표 클릭 시 좌표값 표시 이벤트
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
		
		</script>

</body>
</html>