<%@ page contentType="text/html;charset=utf-8" language="java" import="java.lang.String" %>
<%@ page import="jiwoo.database.DBcon" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jiwoo.database.reviewBoard.reviewBoard" %>
<%@ page import="jiwoo.database.infoBoard.infoBoard" %>
<!--
Editorial by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<head>
    <title>글 작성 페이지</title>
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
                <!-- Elements -->
                <h2 id="elements">정보 공유 게시판</h2>
                <div class="row 200%">
                    <div class="6u 12u$(medium)">

                        <h3>글 수정</h3>
                        <%
                            String title = null;
                            String body = null;
                            infoBoard rb = new infoBoard();

                            request.setCharacterEncoding("utf-8");
                            String id = request.getParameter("id");
                            int number=-1;
                            ArrayList<String> result = new ArrayList<String>();
                            if(id!=null) {
                                result = rb.selectOneInfo(id);

                                title = result.get(1);
                                body = result.get(2);
                            }

                        %>

                        <form method="get" action="">
                            <div class="row uniform">
                                <div class="6u 12u$(xsmall)">
                                    <input type="text" name="title" id="title" value="<%=title%>" placeholder="<%=title%>"/>
                                </div>

                                <!-- Break -->
                                <div class="12u$">
                                    <textarea name="content" id="content" placeholder="<%=body%>"
                                              rows="6"><%=body%></textarea>
                                </div>
                                <input type="hidden" id="id" name="id" value="<%=id%>">
                                <!-- Break -->
                                <div class="12u$">
                                    <ul class="actions">
                                        <li><input type="submit" value="작성완료" class="special"/></li>
                                        <li><input type="reset" value="초기화"/></li>
                                    </ul>
                                </div>
                            </div>
                        </form>

                        <%
                            String inputTitle;
                            String inputContent;
                            if (request.getParameter("title") != null && request.getParameter("content") != null) {
                                inputTitle = request.getParameter("title");
                                inputContent = request.getParameter("content");
                                id=request.getParameter("id");
                                if (inputContent.length() == 0) {
                        %>
                        <script language="javascript">
                            alert("내용이 없습니다");
                        </script>
                        <%
                        } else {
                            rb.updateInfo(inputTitle, inputContent, id);
                        %>
                        <script language="javascript">
                            alert("수정 완료");
                            window.location.href = 'http://localhost:8080';
                        </script>
                        <%
                                }
                            }
                        %>


                    </div>
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