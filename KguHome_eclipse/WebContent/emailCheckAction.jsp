
<%@page import="java.io.PrintWriter"%>

<%@page import="util.SHA256"%>

<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

	String code = request.getParameter("code");

	UserDAO userDAO = new UserDAO();

	String user_id = null;

	if(session.getAttribute("user_id") != null) {

		user_id = (String) session.getAttribute("user_id");

	}

	if(user_id == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("location.href = 'login.jsp'");

		script.println("</script>");

		script.close();

		return;

	}

	String userEmail = userDAO.getUserEmail(user_id);

	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

	if(rightCode == true) {

		userDAO.setUserEmailChecked(user_id);

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('인증에 성공했습니다.');");

		script.println("location.href = 'index.jsp'");

		script.println("</script>");

		script.close();		

		return;

	} else {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('유효하지 않은 코드입니다.');");

		script.println("location.href = 'index.jsp'");

		script.println("</script>");

		script.close();		

		return;

	}

%>