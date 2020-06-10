<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="myPageBoard.myPageBoard"%>

<%
   String user_id = null;

   if(session.getAttribute("user_id") != null) {
   
      user_id = (String) session.getAttribute("user_id");
   
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
      <meta charset="utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      
      <link rel="stylesheet" href="./resources/assets/css/main.css" />
       <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
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
                              <li><a href="join.jsp" class="icon fa-users"><span class="label">Sign Up</span></a></li>
                              <li><a href="login.jsp" class="icon fa-user"><span class="label">Sign In</span></a></li>
                              <li><a href="MyPage.jsp" class="icon fa-cog"><span class="label">Sign In</span></a></li>
                           </ul>
                        </header>

                     <!-- Banner -->
                        <section id="banner">
                     
                           <div class="content">
                           
   <form method="post" action="./userEditAction.jsp">

        <div class="form-group">

          <label>아이디</label>

          <input type="text" name="user_id" class="form-control" readonly>

        </div>

        <div class="form-group">

          <label>비밀번호</label>

          <input type="password" name="pwd" value=<%=mp.getPWD(user_id)%> class="form-control">

        </div>

      <div class="form-group">

          <label>닉네임</label>

          <input type="text" name="nickname" value=<%=mp.getNickName(user_id)%> class="form-control">

        </div>
        
        
        <div class="form-group">

          <label>이메일</label>

          <input type="email" name="userEmail" class="form-control" readonly>

        </div>
        <div class="form-group">

             <label>등급</label>
          <input type="text" name="grade" value=<%=mp.getGrade(user_id)%> class="form-control" readonly>

        </div>

        <button type="submit" class="btn btn-primary">정보 수정</button>

      </form>

    </div>





                        
                           
                        </section>

                     <!-- Section -->
                        

                     
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
                                 <a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
                                 <p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
                              </article>
                              <article>
                                 <a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
                                 <p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
                              </article>
                              <article>
                                 <a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
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
                           <p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
                           <ul class="contact">
                              <li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
                              <li class="fa-phone">(000) 000-0000</li>
                              <li class="fa-home">1234 Somewhere Road #8254<br />
                              Nashville, TN 00000-0000</li>
                           </ul>
                        </section>

                     <!-- Footer -->
                        <footer id="footer">
                           <p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
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

   </body>
</html>