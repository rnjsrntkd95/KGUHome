<%@ page contentType="text/html;charset=utf-8" language="java"
	import="java.lang.String" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<%
	String uid2 = null;
String content = null;
request.setCharacterEncoding("utf-8");


if (request.getParameter("uid2") != null && request.getParameter("content") != null) {
	uid2 = request.getParameter("uid2");
	content = request.getParameter("content");
	if (content.length() == 0) {
%>
<script language="javascript">
	alert("내용이 없습니다");
</script>
<%
	} else {
	String DB_URL = "jdbc:mysql://58.121.58.139:3306/KGUHOME?serverTimezone=UTC";
	String DB_USER = "tester1";
	String DB_PASSWORD = "qwer1234";
	String sql1 = "select uid from user where nickname = ?";
	String sql2 = "Insert into message (uid1,uid2,content) values (?,?,?)";

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	//받는이 닉네임으로 uid 조회
	stmt = conn.prepareStatement(sql1);
	stmt.setString(1, uid2);
	rs = stmt.executeQuery();

	int receiver = 0;
	//ResultSet에 저장된 데이터 얻기 
	if (rs.next()) {
		receiver = rs.getInt("uid");
		//전송자 uid 여기에 저장
		String uid = null;

		if (session.getAttribute("uid") != null) {

	uid = (String) session.getAttribute("uid");

		}
		String sender = uid;
		//쪽지 메시지 테이블에 insert
		stmt = conn.prepareStatement(sql2);
		//stmt.setInt(1, recuid); 
		stmt.setInt(1, receiver);
		stmt.setString(2, sender);
		stmt.setString(3, content);
		stmt.execute();
		//pstmt.close();
%>
<script language="javascript">
	alert("전송 완료");
	location.href = 'index';
</script>

<%
	} else {
%>
<script language="javascript">
	alert("없는 사용자 입니다!");
</script>
<%
	}

//rs.close();
stmt.close();
conn.close();
}
}
%>