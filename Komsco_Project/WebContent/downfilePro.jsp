<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>

<%

	try {
		String path = request.getParameter("path");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<title>DownLoad File</title>
</head>
<body>
	<h1 align="center">Root's WebDrive Services</h1>
	<h2 align="center">DownLoad your files</h2>
	<div align="center">
	<a href="<%=path%>" download>File Download</a>
	</div>

</body>
</html>
<%
	} catch (Exception e) {

		e.printStackTrace();

	}
%>
