<%@ page contentType="text/html;charset=euc-kr" language="java" import="java.lang.String" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jiwoo.reviewBoard.reviewBoard" %>

<!DOCTYPE HTML>
<!--
Editorial by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>Elements - Editorial by HTML5 UP</title>
    <meta charset="euc-kr"/>
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

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">

            <!-- Header -->
            <header id="header">
                <a href="index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
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
                    <h1>review �Խ��� ��ȸ</h1>
                </header>

				<!-- Table -->
				<h3>�� ���</h3>
				<%
					ArrayList<String> list = new ArrayList<String>();
					reviewBoard rb = new reviewBoard();

					list=rb.selectReview();
				%>
				<div class="table-wrapper">
					<table>
						<thead>
						<tr>
							<th>id</th>
							<th>title</th>
							<th>date</th>
                            <th>time</th>
                            <th>views</th>
                        </tr>
						</thead>
						<tbody>
						<%for(int i=0;i<list.size()-6;i+=7){%>
						<tr>
							<td><%=list.get(i)%></td>
							<td><a href="reviewRead.jsp?id=<%=list.get(i)%>"><%=list.get(i+1)%></a></td>
							<td><%=list.get(i+3)%></td>
                            <td><%=list.get(i+4)%></td>
                            <td><%=list.get(i+5)%></td>
                        </tr>
						<%}%>
						</tbody>
					</table>
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
                    <input type="text" name="query" id="query" placeholder="Search"/>
                </form>
            </section>

            <!-- Menu -->
            <nav id="menu">
                <header class="major">
                    <h2>Menu</h2>
                </header>
                <ul>
                    <li><a href="index.html">Homepage</a></li>
                    <li><a href="generic.html">Generic</a></li>
                    <li><a href="elements.html">Elements</a></li>
                    <li>
                        <span class="opener">Submenu</span>
                        <ul>
                            <li><a href="#">Lorem Dolor</a></li>
                            <li><a href="#">Ipsum Adipiscing</a></li>
                            <li><a href="#">Tempus Magna</a></li>
                            <li><a href="#">Feugiat Veroeros</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Etiam Dolore</a></li>
                    <li><a href="#">Adipiscing</a></li>
                    <li>
                        <span class="opener">Another Submenu</span>
                        <ul>
                            <li><a href="#">Lorem Dolor</a></li>
                            <li><a href="#">Ipsum Adipiscing</a></li>
                            <li><a href="#">Tempus Magna</a></li>
                            <li><a href="#">Feugiat Veroeros</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Maximus Erat</a></li>
                    <li><a href="#">Sapien Mauris</a></li>
                    <li><a href="#">Amet Lacinia</a></li>
                </ul>
            </nav>

            <!-- Section -->
            <section>
                <header class="major">
                    <h2>Ante interdum</h2>
                </header>
                <div class="mini-posts">
                    <article>
                        <a href="#" class="image"><img src="images/pic07.jpg" alt=""/></a>
                        <p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
                    </article>
                    <article>
                        <a href="#" class="image"><img src="images/pic08.jpg" alt=""/></a>
                        <p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
                    </article>
                    <article>
                        <a href="#" class="image"><img src="images/pic09.jpg" alt=""/></a>
                        <p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
                    </article>
                </div>
                <ul class="actions">
                    <li><a href="#" class="button">More</a></li>
                </ul>
            </section>

            <!-- Section -->
            <section>
                <header class="major">
                    <h2>Get in touch</h2>
                </header>
                <p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem
                    ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus
                    aliquam.</p>
                <ul class="contact">
                    <li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
                    <li class="fa-phone">(000) 000-0000</li>
                    <li class="fa-home">1234 Somewhere Road #8254<br/>
                        Nashville, TN 00000-0000
                    </li>
                </ul>
            </section>

            <!-- Footer -->
            <footer id="footer">
                <p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>.
                    Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
            </footer>

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