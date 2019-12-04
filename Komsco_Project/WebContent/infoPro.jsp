<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="pack.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String i = request.getParameter("user");
	try {

		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		pstmt = conn.prepareStatement("select * from " + i);
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<title>Show table</title>
</head>
<body>
	<h1 align="center">Root's WebDrive Services</h1>
	<h2 align="center">Show your files list!</h2>

	<div align="center">
		<form method="post" action="showTestForm.jsp">
			<input type="image"
				src="C:/Users/komsco/Desktop/workspace/Komsco_Project/WebContent/image/Sub.png"
				width="200" height="200"
				style="margin-left: auto; margin-right: auto; display: block;" />
		</form>
	</div>

	<table border=1
		style="text-align: center; margin-left: auto; margin-right: auto; width: 500px; height: 300px;">
		<thead>
			<tr>
				<th>Date</th>
				<th>Filename</th>
				<th>Show</th>
				<th>Delete</th>
				<th>DownLoad</th>
			</tr>
			<%
				while (rs.next()) {
						String path = rs.getString("path");
						String key = "secret key";
						String decodepath = Security_AES.decryptAES256(path, key);
						String dp = java.net.URLEncoder.encode(decodepath, "euc-kr");

						String fn = rs.getString("filename");
			%>
			<tr>
				<td><%=rs.getString("reg_date")%></td>
				<td><%=fn%></td>
				<th>
					<form method="post" enctype="multipart/form-data"
						action="showfilePro.jsp?path=<%=dp%>">
						<input type="submit" value="Show">
					</form>
				</th>
				<th>
					<form method="post" enctype="multipart/form-data"
						action="deletefilePro.jsp?user=<%=i%>&path=<%=dp%>&filename=<%=fn%>">
						<input type="submit" value="Delete">
					</form>
				</th>
				<th>
					<form method="post" enctype="multipart/form-data"
						action="downfilePro.jsp?user=<%=i%>&path=<%=dp%>&filename=<%=fn%>">
						<input type="submit" value="DownLoad">
					</form>
				</th>
			</tr>
			<%
				}
			%>
		</thead>
	</table>
</body>
</html>
<%
	} catch (Exception e) {

		e.printStackTrace();

	}
%>
