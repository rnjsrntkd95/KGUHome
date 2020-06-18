
<%@page import="javax.mail.Transport"%>

<%@page import="javax.mail.Message"%>

<%@page import="javax.mail.Address"%>

<%@page import="javax.mail.internet.InternetAddress"%>

<%@page import="javax.mail.internet.MimeMessage"%>

<%@page import="javax.mail.Session"%>

<%@page import="javax.mail.Authenticator"%>

<%@page import="java.util.Properties"%>

<%@page import="java.io.PrintWriter"%>

<%@page import="user.UserDAO"%>

<%@page import="util.SHA256"%>

<%@page import="util.email"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("utf-8");
UserDAO userDAO = new UserDAO();

String user_id = null;

if(session.getAttribute("user_id") != null) {

	user_id = (String) session.getAttribute("user_id");

}

if(user_id == null) {

	PrintWriter script = response.getWriter();

	script.println("<script>");

	script.println("alert('로그인을 해주세요.');");

	script.println("location.href = 'userLogin.jsp'");

	script.println("</script>");

	script.close();

	return;

}

boolean certified = userDAO.getUserEmailChecked(user_id);



	if(certified == true) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('이미 인증 된 회원입니다.');"); 

		script.println("location.href = 'index'");

		script.println("</script>");

		script.close();		

		return;

	}

	

	// 사용자에게 보낼 메시지를 기입합니다.

	String host = "http://localhost:8080/KGU";

	String from = "futiled00@gmail.com";

	String to = userDAO.getUserEmail(user_id);

	String subject = "강의평가를 위한 이메일 확인 메일입니다.";

	String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +

		"<a href='" + host + "/emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

	

	// SMTP에 접속하기 위한 정보를 기입합니다.

	Properties p = new Properties();

	p.put("mail.smtp.user", from);

	p.put("mail.smtp.host", "smtp.gmail.com");

	p.put("mail.smtp.port", "465");

	p.put("mail.smtp.starttls.enable", "true");

	p.put("mail.smtp.auth", "true");

	p.put("mail.smtp.debug", "true");

	p.put("mail.smtp.socketFactory.port", "465");

	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	p.put("mail.smtp.socketFactory.fallback", "false");

	 

	try{

	    Authenticator auth = new email();

	    Session ses = Session.getInstance(p, auth);

	    ses.setDebug(true);

	    MimeMessage msg = new MimeMessage(ses); 

	    msg.setSubject(subject);

	    Address fromAddr = new InternetAddress(from);

	    msg.setFrom(fromAddr);

	    Address toAddr = new InternetAddress(to);

	    msg.addRecipient(Message.RecipientType.TO, toAddr);

	    msg.setContent(content, "text/html;charset=UTF-8");

	    Transport.send(msg);

	} catch(Exception e){

	    e.printStackTrace();

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('오류가 발생했습니다..');");

		script.println("history.back();");

		script.println("</script>");

		script.close();		

	    return;

	}

%>

<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="./resources/assets/css/main.css" />
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
									
										<li><a href="join.jsp" class="icon fa-users"><span class="label">Sign Up</span></a></li>
										<li><a href="login.jsp" class="icon fa-user"><span class="label">Sign In</span></a></li>
										<li><a href="MyPage.jsp" class="icon fa-cog"><span class="label">Sign In</span></a></li>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										
									
								</section>

							

							<div class="container">

	    <div class="alert alert-success mt-4" role="alert">

		  이메일 주소 인증 메일이 전송되었습니다. 이메일에 들어가셔서 인증해주세요.

		</div>

    </div>

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