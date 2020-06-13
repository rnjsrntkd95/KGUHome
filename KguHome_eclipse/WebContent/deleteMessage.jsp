<%@ page contentType="text/html;charset=utf-8" language="java"
	import="java.lang.String"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
//message m  = new message();
//m.deleteMessage(id);
String DB_URL = "jdbc:mysql://58.121.58.139:3306/kguhome";
String DB_USER = "tester1";
String DB_PASSWORD = "qwer1234";
String sql = "delete from message where id = ?";
Connection conn = null;
PreparedStatement stmt = null;

Class.forName("com.mysql.jdbc.Driver");

conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

stmt = conn.prepareStatement(sql);
stmt.setString(1, request.getParameter("mid"));

stmt.executeUpdate();
//pstmt.close();
%>
<script language="javascript">
	alert("삭제 완료");
</script>
<%
	stmt.close();
conn.close();
%>