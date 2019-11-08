<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	try {
		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		String sql = "select id, passwd from client where id= ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if (id.equals(rId) && passwd.equals(rPasswd)) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Upload Your Image</title>
</head>
<form method="post" enctype="multipart/form-data" action="imgup.jsp?user=id">
	I  D : <input type = "text" name ="id" maxlength="12"><br/>
	<input type="file" name="filename1" size=40> <input
		type="submit" value="Upload image"><br> <br>
</form>
<body>
	<div style="width: 115px; height: 50px; float: left;">
		<form method="post" action="showTestForm.jsp">
			<input type="submit" value="Return Page">
		</form>

		<div style="width: 115px; height: 50px; float: left;">
			<form method="post" action="infoPro.jsp">
				<input type="submit" value="Show list">
			</form>
</body>
</html>
<%
	} else {
				out.print("Password is wrong");
			}
		} else {
			out.print("ID is wrong");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException sqle) {
			}
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
