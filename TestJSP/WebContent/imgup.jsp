<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
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

		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		String sql = "insert into file values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, filename);
		pstmt.setString(2, afterpath);
		pstmt.setTimestamp(3, register);
		pstmt.executeUpdate();
		
		out.print("Success to Upload File");
		

	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<title>Success to Upload File</title>
</head>
<body>

</body>
</html>
