<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String i = request.getParameter("user");
	String p = request.getParameter("path");
	String fn = request.getParameter("filename");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {

		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);

		pstmt = conn.prepareStatement("delete from " + i + " where filename = '" + fn + "'");
		pstmt.executeUpdate();

		java.io.File file = new File(p);
		if (file.exists()) {
			file.delete();
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<title>Delete File</title>
</head>
<body>
	<h1 align="center">Root's WebDrive Services</h1>
	<h2 align="center">delete your files in list & DB!</h2>

	<div align="center"> 
		<form method="post" action="showTestForm.jsp">
			<input type="image"
				src="https://blogpfthumb-phinf.pstatic.net/MjAxOTA0MDFfMTY5/MDAxNTU0MTA0NTc2NzE3.QmccL7IxkEFWbv-FD-Vz__KA3UcCuIHyG0PiePYvGkYg.sbYFdc1fQS0w2toFI6YUQcDP3LE4Z49TYO0WkaWX_wIg.PNG.gyrms96/Sub.png"
				width="250" height="200"
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
