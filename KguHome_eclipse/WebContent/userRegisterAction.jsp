
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDTO"%>

<%@ page import="user.UserDAO"%>

<%@ page import="util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%

   String user_id = null;

   if(session.getAttribute("user_id") != null) {

      user_id = (String) session.getAttribute("user_id");

   }
    
   

   
   
%>   



<%

   request.setCharacterEncoding("UTF-8");
   int uid;
   

   String pwd = null;

   String userEmail = null;
   String grade = null;
   String nickname = null;
   
   if(request.getParameter("user_id") != null) {

      user_id = (String) request.getParameter("user_id");

   }

   if(request.getParameter("pwd") != null) {

      pwd = (String) request.getParameter("pwd");

   }

   if(request.getParameter("userEmail") != null) {

      userEmail = (String) request.getParameter("userEmail");

   }
   
   if(request.getParameter("nickname") != null) {

      nickname = (String) request.getParameter("nickname");

   }
   
   if(request.getParameter("grade") != null) {

      grade = (String) request.getParameter("grade");

   }

   String email = userEmail.substring(userEmail.lastIndexOf("@")+1);;
   String kyonggi = "kyonggi.ac.kr";
   
   
   if (user_id == null || pwd == null || userEmail == null || nickname == null || grade == null) {

      PrintWriter script = response.getWriter();

      script.println("<script>");

      script.println("alert('입력이 안 된 사항이 있습니다.');");

      script.println("history.back();");

      script.println("</script>");

      script.close();

   }
   else if (!email.equals(kyonggi)){
      PrintWriter script = response.getWriter();

      script.println("<script>");

      script.println("alert('경기대 이메일을 입력하세요.');");

      script.println("history.back();");

      script.println("</script>");

      script.close();
   }else {

      UserDAO userDAO = new UserDAO();

      int result = userDAO.join(new UserDTO(0 , user_id, pwd, grade, false, nickname, userEmail, SHA256.getSHA256(userEmail)));

      if (result == -1) {

         PrintWriter script = response.getWriter();

         script.println("<script>");

         script.println("alert('이미 존재하는 아이디입니다.');");

         script.println("history.back();");

         script.println("</script>");

         script.close();

      } 
      
         else {

         session.setAttribute("user_id", user_id);

         PrintWriter script = response.getWriter();

         script.println("<script>");

         script.println("location.href = 'emailSendAction.jsp';");

         script.println("</script>");

         script.close();

      }

   }


%>