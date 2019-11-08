<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="pack.*" %>

<%
	request.setCharacterEncoding("euc-kr");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Timestamp register = new Timestamp(System.currentTimeMillis());

	String realFolder = "D:\\DB";
	String filename = "";
	int maxSize = 1024 * 1024 * 5;
	String encType = "euc-kr";
	ServletContext scontext = getServletContext();

	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());

		Enumeration<?> files = multi.getFileNames();
		String file = (String) files.nextElement();
		filename = multi.getFilesystemName(file);

		String userFolder = multi.getParameter("id");

		String beforepath = realFolder + "\\" + filename;
		String afterpath = realFolder + "\\" + userFolder + "\\" + filename;

		try {
			File newfile = new File(beforepath);

			newfile.renameTo(new File(afterpath));

		} catch (Exception e) {

			e.printStackTrace();

		}

		String plainpath = afterpath;
		String key = "secret key";
		String encodepath = Security.encryptAES256(afterpath, key);
		String decodepath = Security.decryptAES256(encodepath, key);
	
		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		String sql = "insert into file values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, filename);
		pstmt.setString(2, encodepath);
		pstmt.setTimestamp(3, register);
		pstmt.executeUpdate();
		out.print("Success to Upload file in  "+ decodepath);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<title>Success to Upload file</title>
</head>
<body>
<img src = "C:\Users\komsco\Desktop\workspace\TestJSP\WebContent\image\C.png" width = "500" height ="350">
	<div style="width:115px; height:10px; float:left;"> 
	<form method = "post" action ="showTestForm.jsp">
	<input type= "submit" value = "Return Page">
	</form>
	</div>
</body>
</html>