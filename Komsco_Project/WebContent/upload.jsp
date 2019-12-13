<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String i = request.getParameter("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Upload Your File</title>
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
	<h1 align="center">Root's WebDrive Service</h1>
	<h2 align="center">Start to Upload Your File!</h2>
	<div align="center">
		<form method="post" action="showTestForm.jsp">
			<input type="image"
				src="https://blogpfthumb-phinf.pstatic.net/MjAxOTA0MDFfMTY5/MDAxNTU0MTA0NTc2NzE3.QmccL7IxkEFWbv-FD-Vz__KA3UcCuIHyG0PiePYvGkYg.sbYFdc1fQS0w2toFI6YUQcDP3LE4Z49TYO0WkaWX_wIg.PNG.gyrms96/Sub.png"
				width="200" height="200"
				style="margin-left: auto; margin-right: auto; display: block;" />
		</form>
	</div>

	<div class="divListGroup">
		<form method="post" enctype="multipart/form-data"
			action="imgup.jsp?user=<%=i%>">
			<input type="file" name="filename1" size=40><br /> <br /> <input
				type="submit" value="Upload file"><br /> <br />
		</form>
	</div>
</body>
</html>