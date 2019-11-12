<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="pack.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str ="";
	
	try{
		String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		Security_SHA security = new Security_SHA();
		String encodepasswd = Security_SHA.encryptSHA256(passwd);
			
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbUrl, dbId, dbPass);
		String sql = "select id, passwd from client where id= ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			
			if(id.equals(rId) && encodepasswd.equals(rPasswd)){
				sql = "delete from client where id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				sql = "delete from files where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				str = "Delete Record to client & files in table.";
				
				java.io.File file = new File("D:\\DB\\"+id);
				if (file.exists()){
					File[] deleteFolderList = file.listFiles();
					for (int j = 0; j < deleteFolderList.length; j++) {
						deleteFolderList[j].delete();
					}
					
					file.delete();
				}
			}else{
				str = ("Password is wrong");
			}		
		}else{
			str = ("ID is wrong");
		}		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs !=null)try{rs.close();}catch(SQLException sqle){}
		if(pstmt !=null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn !=null)try{conn.close();}catch(SQLException sqle){}
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content = "text/html; charset=EUC-KR">
<title> Delete Record</title>
</head>
<body>
	<h1 align="center">Root's WebDrive</h1>
	<h2 align="center"><%=str%>
	</h2>
	<br />
	<div align="center">
		<form method="post" action="startTestForm.jsp">
			<input type="image"
				src="C:/Users/komsco/Desktop/workspace/Komsco_Project/WebContent/image/Sub.png"
				width="200" height="200"
				style="margin-left: auto; margin-right: auto; display: block;" />
		</form>
	</div>
</body>
</html>
<%

%>