
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

	String realFolder = "";
	String filename1 = "";
	int maxSize = 1024 * 1024 * 5;
	String encType = "euc-kr";
	String savefile = "img";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);

	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());

		Enumeration<?> files = multi.getFileNames();
		String file1 = (String) files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		
		String fullpath = realFolder + "\\" + filename1;
		
		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		
		String sql = "insert into image values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,filename1);
		pstmt.setString(2,fullpath);
		pstmt.setTimestamp(3, register);
		pstmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	String fullpath = realFolder + "\\" + filename1;

%>

<title>Success to Upload image</title>
</head>
<body>
	<img src="<%=fullpath%>" width=512 height=384></img>
</body>
</html>
