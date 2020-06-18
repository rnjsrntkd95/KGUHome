<%@ page contentType="text/html;charset=euc-kr" language="java" import="java.lang.String" %>
<%@ page import="jiwoo.database.DBcon" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jiwoo.database.reviewBoard.reviewBoard" %>
<%@ page import="jiwoo.database.infoBoard.infoBoard" %>
<%@ page import="jiwoo.database.roommateBoard.roommateBoard" %>
<!--
Editorial by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<head>
    <title>�� �ۼ� ������</title>
    <meta charset="utf-8"/>
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
<% request.setCharacterEncoding("utf-8"); 		String user_id = null;

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
                <!-- Elements -->
                <h2 id="elements">�����Ʈ �Խ���</h2>
                <div class="row 200%">
                    <div class="6u 12u$(medium)">

                        <h3>�� ����</h3>
                        <%
                            roommateBoard rb = new roommateBoard();

                            request.setCharacterEncoding("utf-8");
                            String id = request.getParameter("id");
                            if (id != null) {
                                rb.deleteRoommate(id);
                            }

                        %>

                        �����Ǿ����ϴ�.

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
								class="label">ȸ�� ����</span></a></li>
						<li style="border: 0;"><a href="login.jsp"
							class="icon fa-user"><span class="label">�α���</span></a></li>
						<%
							} else {
						%>
						<li><a href="myPage.jsp" class="icon fa-cog"><span
								class="label">���� ������</span></a></li>
						<li style="border: 0;"><a href="userLogout.jsp"
							class="icon fa-times"><span class="label">�α׾ƿ�</span></a></li>
						<%
							}
						%>
					</ul>

					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul class="side-menu">
						<li><a href="roomList.jsp">�ŷ� �Խ���</a></li>
						<li><a href="reviewList.jsp">���� �Խ���</a></li>
						<li><a href="infoList.jsp">���� �Խ���</a></li>
						<li><a href="roommateList.jsp">�����Ʈ ���� �Խ���</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>������ �� (5��)</h2>
					</header>
					<p>�����б� �п���� �ǰ��� ���� ��Ȱ�� ���� �� Ŀ�´�Ƽ�Դϴ�.</p>
					<ul class="contact">
						<li class="fa-envelope-o"><a href="#">KGUHome@gmail.com</a></li>
						<li class="fa-home">�����б� ��ǻ�Ͱ��к�<br />��⵵ ������ ���뱸 ������� 143-42</li>
						
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