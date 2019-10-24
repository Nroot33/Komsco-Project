<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert an Image into MySQL Database</title>
    </head>
    <body>
         <%
String filename=request.getParameter("filename");
Timestamp register = new Timestamp(System.currentTimeMillis());
String myloc=request.getParameter("myimg");

Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs=null;
FileInputStream fis=null;

try{
Class.forName("com.mysql.jdbc.Driver").newInstance();

String jdbUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
String dbId = "root";
String dbPass = "1234";

conn = DriverManager.getConnection(jdbUrl,dbId,dbPass);

File image= new File(myloc);
pstmt = conn.prepareStatement("insert into real_image(filename, image, reg_date) " + "values(?,?,?)");
pstmt.setString(1, filename);
pstmt.setBinaryStream(2, (InputStream) fis, (int) (image.length()));
pstmt.setTimestamp(3, register);

fis=new FileInputStream(image);

int count = pstmt.executeUpdate();
if(count>0)
{
out.println("insert successfully");
}
else
{
out.println("not successfully");
}
}
catch(Exception ex)
{
ex.printStackTrace();
}
finally{
try{
if(rs!=null){
rs.close();
rs= null;
}
if(pstmt !=null)
{
pstmt.close();
pstmt=null;
}
if(conn!=null)
{
conn.close();
conn=null;
}
}
catch(Exception e)
{
e.printStackTrace();
}
}
%>
    </body>
</html>