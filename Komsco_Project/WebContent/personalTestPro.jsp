<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="pack.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String Id = request.getParameter("id");
	String Passwd = request.getParameter("passwd");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	try {
		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";

		Security_SHA security = new Security_SHA();
		String encodepasswd = Security_SHA.encryptSHA256(Passwd);

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		String sql = "select id, passwd from client where id= ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, Id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if (Id.equals(rId) && encodepasswd.equals(rPasswd)) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Your Web Drive</title>
<style>
.divListGroup {
	width: 100%;
	text-align: center;
	overflow: hidden;
}

.divChild {
	height: 100px;
	display: inline-block;
	vertical-align: middle;
}
</style>
</head>
<body>
	<h1 align="center"><%=Id%>'s WebDrive</h1>

	<h2 align="center">Start to store your files!</h2>

	<div align="center">
		<form method="post" action="showTestForm.jsp">
			<input type="image"
				src="https://blogpfthumb-phinf.pstatic.net/MjAxOTA0MDFfMTY5/MDAxNTU0MTA0NTc2NzE3.QmccL7IxkEFWbv-FD-Vz__KA3UcCuIHyG0PiePYvGkYg.sbYFdc1fQS0w2toFI6YUQcDP3LE4Z49TYO0WkaWX_wIg.PNG.gyrms96/Sub.png"
				width="200" height="200"
				style="margin-left: auto; margin-right: auto; display: block;" />
		</form>
	</div>

	<div class="divListGroup">
		<div class="divChild">
			<form method="post" enctype="multipart/form-data" action="upload.jsp?user=<%=Id%>">
				<input type="submit" value="Upload file">
			</form>
		</div>
		<div class="divChild">
			<form method="post" enctype="multipart/form-data"
				action="infoPro.jsp?user=<%=Id%>">
				<input type="submit" value="Show list">
			</form>
		</div>
	</div>
</body>
</html>
<%
	} else {
				out.print("Password is wrong");
			}
		} else {
			out.print("ID is wrong");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException sqle) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}
%>