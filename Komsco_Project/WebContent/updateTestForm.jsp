<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Rectify Record</title>
</head>
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
<body>
	<h1 align="center">Root's WebDrive</h1>
	<h2 align="center">Rectify Record to client in table</h2>

	<div align="center">
		<form method="post" action="startTestForm.jsp">
			<input type="image"
				src="https://blogpfthumb-phinf.pstatic.net/MjAxOTA0MDFfMTY5/MDAxNTU0MTA0NTc2NzE3.QmccL7IxkEFWbv-FD-Vz__KA3UcCuIHyG0PiePYvGkYg.sbYFdc1fQS0w2toFI6YUQcDP3LE4Z49TYO0WkaWX_wIg.PNG.gyrms96/Sub.png"
				width="200" height="200"
				style="margin-left: auto; margin-right: auto; display: block;" />
		</form>
	</div>

	<div class="divListGroup">
		<form method="post" action="updateTestPro.jsp">
			I D : <input type="text" name="id" maxlength="12"><br /> <br />
			Pass : <input type="password" name="passwd" maxlength="12"><br />
			<br /> Name : <input type="name" name="name" maxlength="12"><br />
			<br /> <input type="submit" value="Rectify Account">
		</form>
	</div>
</body>
</html>