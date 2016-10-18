<%-- 
    Document   : welcome2
    Created on : 2016-3-27, 17:20:41
    Author     : Sony
//page for customer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer page</title>
    </head>
    <body background="6809741-simple-wallpaper.jpg" background-size:100>
    <center>
        <div>
<%
    
String name=request.getParameter("name");
%>
<div style="float:left"><h1>Valued customer <%=name%>!</h1><HR WIDTH=100% SIZE=1 noshade> 
    <br>
    <br>
    <form action="patient_info.jsp">
    <input type="text" name="id" value="Account ID">
    <input type="submit" value="View personal information">
    </form><br></br>
    <!--<button type="button">Personal info</button>-->
    <form action="view_prescription.jsp">
    <input type="text" name="cid" value="Customer ID">
    <input type="submit" value="View prescription">
    </form><br></br>
    <form action="pay_prescription.jsp">
        <input type="text" name="paycid" value="Customer ID">
    <input type="submit" value="Pay prescription">
    </form><br></br>
</div>

<div style="float:right"><A HREF="logout.jsp" ><button type="button">Logout</button></A></div>

</div>
        <center>
    </body>
</html>
