<%-- 
   
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Please first login</title>
</head>
<body background="6809741-simple-wallpaper.jpg" background-size:100>
<%
Connection con= null;
Statement ps = null;
ResultSet rs = null;

String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:" + "thin:@128.227.205.217:1521:orcl";
String user = "chaofeng";
String password = "Haohaoxuex1";

//String sql = "select usertype from testuser";
//correct here sql command
String sql = "select distinct accttype from tblusers";
try {
Class.forName(driverName);
con = DriverManager.getConnection(url, user, password);
ps = con.createStatement();
rs = ps.executeQuery(sql); 
%>
<form method="post" action="login.jsp">
<center><h2 style="color:green">Please first login</h2>

<tr>
<H3>Username :</h3>
<input type="text" name="name"/>
</tr>

<tr> 
   <H3>Password :</H3>
<input type="password" name="password"/>
<br>
 <h4 style ="color:red"> Password is case sensitive</h4>
</tr>

<tr>
<H3>Select UserType:</H3>
<select name="usertype">
<option value="select">select</option>
<!--<option value="doctor">doctor</option>
-->
</center>
</form>
<%
    String select_string = new String();
while(rs.next()) //also for later use, pull out all information;
{
//int usertype = Integer.parseInt(rs.getString("accttype"));
String usertype = rs.getString("accttype");
    if (usertype.equals("1"))
    select_string="pharmacist";

    //if (usertype == 2)
    if (usertype.equals("2"))
    select_string="doctor";
    
    //if (usertype == 4)
    if (usertype.equals("4"))
    select_string="admin";
    
    //if (usertype == 3)
    if (usertype.equals("3"))
    select_string="customer";
    
    
      
  // System.out.println("successfully get string");
     //break;
     %>
<option value=<%=usertype%>><%=select_string%></option>
<% 
 } 
rs.close();
ps.close();
}
catch(SQLException sqe)
{
out.println("response"+sqe);
}
%>
</select>
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="submit"/></td>
</table>
</form>
</body>
</html>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="mybean" scope="session" class="org.mypackage.hello.NameHandler" />
        <jsp:setProperty name="mybean" property="name" />
        <h1>Hello, <jsp:getProperty name="mybean" property="name" />!</h1>
    </body>
</html>
--%>
