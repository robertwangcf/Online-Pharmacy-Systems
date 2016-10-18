<%-- 
    Document   : welcome
    Created on : 2016-3-15, 16:01:30
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor page</title>
    </head>
    <body background="6809741-simple-wallpaper.jpg" background-size:100>
    <center>
        <div>
<%
    
String name=request.getParameter("name");
%>
<div style="float:left"><h1>Welcome Doctor <%=name%>!</h1><HR WIDTH=100% SIZE=1 noshade> 
    <br>
    <br>
    <form action="personal_info.jsp">
    <input type="text" name="id" value="DoctorID">
    <input type="submit" value="View personal information">
    </form><br></br>
    <!--<button type="button">Personal info</button>>
    <form action="view_prescription.jsp">
    <input type="text" name="cid" value="DoctorID">
    <input type="submit" value="View prescription">
    </form><br></br>
    <form action="pay_prescription.jsp">
        <input type="text" name="paycid" value="Customer ID">
    <input type="submit" value="Pay prescription">
    </form><br></br-->
</div>

<div style="float:right"><A HREF="logout.jsp" ><button type="button">Logout</button></A></div>

</div>
        <center>
    </body>
</html>
