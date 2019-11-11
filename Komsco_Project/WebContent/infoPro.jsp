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
	pstmt = conn.prepareStatement("select * from files ");
	rs = pstmt.executeQuery();
%>
<body>
	<h1 align="center">Root's WebDrive</h1>
	<h2 align="center">Show your files!</h2>

	<div align="center">
		<form method="post" action="showTestForm.jsp">
			<input type="image"
				src="C:/Users/komsco/Desktop/workspace/Komsco_Project/WebContent/image/Sub.png"
				width="200" height="200"
				style="margin-left: auto; margin-right: auto; display: block;" />
		</form>
	</div>


	<table border=1 style="text-align: center">
		<thead>
			<tr>
				<th>ID</th>
				<th>Filename</th>
				<th>Path</th>
				<th>Date</th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("id")%></td>
				<td><%=rs.getString("filename")%></td>
				<td><%=rs.getString("path")%></td>
				<td><%=rs.getString("reg_date")%></td>
			</tr>
			<%
				}
			%>
		
	</table>

</body>
</html>