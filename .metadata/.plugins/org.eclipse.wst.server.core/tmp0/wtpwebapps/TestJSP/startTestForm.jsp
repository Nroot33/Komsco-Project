<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Start Page</title>
</head>
<body>
	<h2>Hello World</h2>
	<form method="post" action="insertTestForm.jsp">
		<div style="width: 115px; height: 10px; float: left;">
			<input type="submit" value="Add Account">
		</div>
	</form>
	<div style="width: 130px; height: 10px; float: left;">
		<form method="post" action="updateTestForm.jsp">
			<input type="submit" value="Rectify Account">
	</div>
	</form>
	<div style="width: 130px; height: 10px; float: left;">
		<form method="post" action="deleteTestForm.jsp">
			<input type="submit" value="Delete Account">
	</div>
	</form>
	<div style="width: 130px; height: 10px; float: left;">
		<form method="post" action="showTestForm.jsp">
			<input type="submit" value="Login">
	</div>
	</form>
</body>
</html>