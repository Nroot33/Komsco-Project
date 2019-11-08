<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Show information</title>
</head>
<%

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPass = "1234";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
	pstmt = conn.prepareStatement("select * from file ");
	rs = pstmt.executeQuery();
	%>
<table border=1 style="text-align: center">
	<thead>
		<tr>
			<th>Filename</th>
			<th>Path</th>
			<th>Date</th>
		</tr>
		<%while (rs.next()) { %>
		<tr>
			<td><%=rs.getString("filename")%></td>
			<td><%=rs.getString("path")%></td>
			<td><%=rs.getString("reg_date")%></td>
		</tr>
		<%
			}
		%>
	
</table>
<div style="width: 115px; height: 10px; float: left;">
	<form method="post" action="showTestForm.jsp">
		<input type="submit" value="Return Page">
	</form>

	</body>
</html>