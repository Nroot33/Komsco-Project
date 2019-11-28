<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String realFolder = "D:\\DB";
	String str = "";
	int maxSize = 1024 * 1024 * 5;
	String encType = "euc-kr";
	ServletContext scontext = getServletContext();

	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());
		String user = multi.getParameter("id");
		
		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		pstmt = conn.prepareStatement("select * from "+user);
		rs = pstmt.executeQuery();
		
%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Show table</title>
		</head>
		<body>
			<h1 align="center">Root's WebDrive</h1>
			<h2 align="center">Show your files!</h2>
			<h3 align="center"><%=user%></h3>

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
						<th>Filename</th>
						<th>Path</th>
						<th>Date</th>
					</tr>
					<%
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("filename")%></td>
						<td><%=rs.getString("path")%></td>
						<td><%=rs.getString("reg_date")%></td>
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
