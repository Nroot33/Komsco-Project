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
	String p = request.getParameter("path");
	try {

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<title>Show File</title>
</head>
<body>
	<h1 align="center">Root's WebDrive Services</h1>
	<h2 align="center">Show your files</h2>
	<div align="center">
		<form method="post" action="showTestForm.jsp">
			<input type="image"
				src=<%=p%>
				width="200" height="200"
				style="margin-left: auto; margin-right: auto; display: block;" />
		</form>
	</div>
 
</body>
</html>
<%
	} catch (Exception e) {

		e.printStackTrace();

	}
%>
