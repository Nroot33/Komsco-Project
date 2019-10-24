<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Timestamp register = new Timestamp(System.currentTimeMillis());
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl,dbId,dbPass);
		
		String sql = "insert into client values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setTimestamp(4, register);
		pstmt.executeUpdate();
		
		str = "Success to Add new Record to client in table ";
	}catch(Exception e){
		e.printStackTrace();
		str = "Fail to Add new Record to client in table "; 
	}finally{
		if(pstmt !=null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn !=null)try{conn.close();}catch(SQLException sqle){}
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content = "text/html; charset=EUC-KR">
<title>Add Record</title>
</head>
<body>
<%=str %>
	<form method = "post" action ="insertTestForm.jsp">
	<input type= "submit" value = "Return Page">
	</form>
</body>
</html>