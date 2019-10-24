<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content = "text/html; charset=EUC-KR">
<title>Delete Record</title>
</head>
<body>
	<h2> Delete Record to client in table </h2>
	<form method = "post" action ="deleteTestPro.jsp">
	I  D : <br>
	<input type = "text" name ="id" maxlength="12"><br/>
	P  W : <br>
	<input type = "password" name ="passwd" maxlength="12"><br/>
	<div style="width:130px; height:10px; float:left;"> 
	<input type= "submit" value = "Enter complete">
	</form>
	</div>
	<div style="width:115px; height:10px; float:left;"> 
	<form method = "post" action ="startTestForm.jsp">
	<input type= "submit" value = "Return Page">
	</form>
</body>
</html>