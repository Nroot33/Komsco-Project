<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="pack.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Timestamp register = new Timestamp(System.currentTimeMillis());

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";

	try {
		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";

		java.io.File file = new File("D:\\DB\\" + id);
		if (!file.exists())
			file.mkdirs();
			
		Security_SHA security = new Security_SHA();
		String encodepasswd = Security_SHA.encryptSHA256(passwd);
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		String sql = "insert into client values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, encodepasswd);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, register);
		pstmt.executeUpdate();

		str = "Success to Add new Record to client in table ";

	} catch (Exception e) {
		e.printStackTrace();
		str = "Fail to Add new Record to client in table ";
	} finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Add Account</title>
</head>
<body>
	<h1 align="center">Root's WebDrive</h1>
	<h2 align="center"><%=str%>
	</h2>
	<br />
	<div align="center">
		<form method="post" action="startTestForm.jsp">
			<input type="image"
				src="C:/Users/komsco/Desktop/workspace/Komsco_Project/WebContent/image/Sub.png"
				width="200" height="200"
				style="margin-left: auto; margin-right: auto; display: block;" />
		</form>
	</div>
</body>
</html>