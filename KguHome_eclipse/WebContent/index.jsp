<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>

<%@ page import="user.UserDAO"%>
<%@ page import="java.util.*"%>
<%@ page import="jiwoo.database.roommateBoard.roommateBoard"%>
<%@ page import="jiwoo.database.infoBoard.infoBoard"%>
<%@ page import="jiwoo.database.roomBoard.roomBoard"%>
<%@ page import="jiwoo.database.reviewBoard.reviewBoard"%>




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
</style>

</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
		String user_id = null;

	if (session.getAttribute("user_id") != null) {

		user_id = (String) session.getAttribute("user_id");

	}
	%>


	<%-- 	<%
	boolean emailChecked = new UserDAO().getUserEmailChecked(user_id);

	if (user_id != null && emailChecked == false) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("location.href = 'emailSendConfirm.jsp'");

		script.println("</script>");

		script.close();

		return;
	}
	%> --%>
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
									<li><a href="roomList.jsp" class="button">More</a></li>
								</ul>
							</div>
							<div>
								<%
                    ArrayList<String> roomList = new ArrayList<String>();
								roomBoard rob = new roomBoard();

								roomList=rob.selectRoom();
                %>
								<div class="table-wrapper">
									<table>
										<thead>
											<tr>
												<th>작성자</th>
												<th>제목</th>

												<th>작성일</th>

												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<%for(int i=0;i<roomList.size();i+=12){
											if (i >36) break;%>
											<tr>
												<td><a
													href="messageSend.jsp?nickname=<%=roomList.get(i+11)%>"><%=roomList.get(i + 11)%></a></td>
												<td><a href="roomRead.jsp?id=<%=roomList.get(i)%>"><%=roomList.get(i+1)%></a></td>
												<td><%=roomList.get(i+3)%></td>
												<td><%=roomList.get(i+5)%></td>
											</tr>
											<%}%>
										</tbody>
									</table>
								</div>
							</div>



						</article>
						<article>
							<div class="famous-title">
								<h3>리뷰 게시판</h3>
								<ul class="actions">
									<li><a href="reviewList.jsp" class="button">More</a></li>
								</ul>
							</div>
							<div>
								<%
                    ArrayList<String> reviewList = new ArrayList<String>();
								reviewBoard reb = new reviewBoard();

								reviewList=reb.selectReview();
                %>
								<div class="table-wrapper">
									<table>
										<thead>
											<tr>
												<th>작성자</th>
												<th>제목</th>

												<th>작성일</th>

												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<%for(int i=0;i<reviewList.size();i+=8){
											if (i >24) break;%>
											<tr>
												<td><a
													href="messageSend.jsp?nickname=<%=reviewList.get(i+7)%>"><%=reviewList.get(i + 7)%></a></td>
												<td><a
													href="reviewRead.jsp?id=<%=reviewList.get(i)%>"><%=reviewList.get(i+1)%></a></td>
												<td><%=reviewList.get(i+3)%></td>
												<td><%=reviewList.get(i+5)%></td>
											</tr>
											<%}%>
										</tbody>
									</table>
								</div>
							</div>


						</article>
						<article>
							<div class="famous-title">
								<h3>정보 게시판</h3>
								<ul class="actions">
									<li><a href="infoList.jsp" class="button">More</a></li>
								</ul>
							</div>
							<div>
								<%
                    ArrayList<String> infoList = new ArrayList<String>();
								infoBoard ib = new infoBoard();

								infoList=ib.selectInfo();
                %>
								<div class="table-wrapper">
									<table>
										<thead>
											<tr>
												<th>작성자</th>
												<th>제목</th>

												<th>작성일</th>

												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<%for(int i=0;i<infoList.size();i+=8){
											if (i >24) break;%>
											<tr>
												<td><a
													href="messageSend.jsp?nickname=<%=infoList.get(i+7)%>"><%=infoList.get(i + 7)%></a></td>
												<td><a href="infoRead.jsp?id=<%=infoList.get(i)%>"><%=infoList.get(i+1)%></a></td>
												<td><%=infoList.get(i+3)%></td>
												<td><%=infoList.get(i+5)%></td>
											</tr>
											<%}%>
										</tbody>
									</table>
								</div>
							</div>

						</article>
						<article>
							<div class="famous-title">
								<h3>룸메이트 구인 게시판</h3>
								<ul class="actions">
									<li><a href="roommateList.jsp" class="button">More</a></li>
								</ul>
							</div>

							<div>
								<%
                    ArrayList<String> roommateList = new ArrayList<String>();
                    roommateBoard rb = new roommateBoard();

                    roommateList=rb.selectRoommate();
                %>
								<div class="table-wrapper">
									<table>
										<thead>
											<tr>
												<th>작성자</th>
												<th>제목</th>

												<th>작성일</th>

												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<%for(int i=0;i<roommateList.size();i+=8){
											if (i > 24) break;%>
											<tr>
												<td><a
													href="messageSend.jsp?nickname=<%=roommateList.get(i+7)%>"><%=roommateList.get(i + 7)%></a></td>
												<td><a
													href="roommateRead.jsp?id=<%=roommateList.get(i)%>"><%=roommateList.get(i+1)%></a></td>
												<td><%=roommateList.get(i+3)%></td>
												<td><%=roommateList.get(i+5)%></td>
											</tr>
											<%}%>
										</tbody>
									</table>
								</div>
							</div>

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
		var size = <%=posts.size()%>
		console.log(size)
		

		for (var i=0; i<<%=posts.size()%>;i++) {
			<% 
				String[] post = posts.get(count);
				count++;
			%>
			var sale = {
					title: "<%=post[0]%>",
					deposit: "<%=post[1]%>",
					rent: "<%=post[2]%>",
					image: "<%=post[3]%>",
					latitude: Number("<%=post[4]%>"),
					longitude: Number("<%=post[5]%>"),
					created_at: "<%=post[6]%>",
					id: "<%=post[7]%>"
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
				content += '    <a href="/KguHome_eclipse/roomRead.jsp?id='+sale.id+'"><i class="fas fa-home"></i>'
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

		
		</script>

</body>
</html>