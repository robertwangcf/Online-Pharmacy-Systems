<%-- 
    Document   : registration
    Created on : 2016-3-27, 17:22:29
    Author     : Sony
page for registration
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>

<title>Registration Page</title>
<style type="text/css">
.firstDiv{
width:400px;

height:300px;

margin:1cm 5cm 3cm 5cm <%--up,down,left,right--%>

}
</style>

</head>

    <body background="6809741-simple-wallpaper.jpg" background-size:100>
    
       
           <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String userid=request.getParameter("userid"); 
String user=request.getParameter("username"); 
session.setAttribute("username",user); 
String pwd=request.getParameter("pwd"); 
 String roles=request.getParameter("roles"); 
//String email=request.getParameter("email");
Class.forName("oracle.jdbc.driver.OracleDriver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:" + "thin:@128.227.205.217:1521:orcl",
"chaofeng","Haohaoxuex1"); 
Statement st= con.createStatement(); 
ResultSet rs; 
String sql="insert into tblusers values ('"+userid+"','"+user+"','"+pwd+"','"+roles+"')";
//try
//{"insert into tblusers (accountid,username,password,accttpye) values ('"+userid+"','"+user+"','"+pwd+"','"+roles+"')"
int i=st.executeUpdate(sql); 

out.println("Congratulations,"+user+", you are all set!"); 



//}catch(Exception ex){
   //ex.printStackTrace();//打印错误信息看看是什么
//}



%>
    <center>
<form name="back Form" action="index.jsp">
            <input type="submit" value="Back to login" >
            </center>
    </body>
</html>
