<%-- 
    Document   : admin
    Created on : 2016-4-08, 23:35:02
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
    </head>
    <body background="6809741-simple-wallpaper.jpg" background-size:100>
    <center>
        <div>
<%
    
String name=request.getParameter("name");
%>
<div style="float:left"><h1>Welcome Administrator!</h1><HR WIDTH=100% SIZE=1 noshade> 
    <br>
    <br>
    <form action="query1.jsp">
    <h2>Please check the status of entire systems:</h2>
    <br>
    <h3>Selling status:</h3>
    <select name="querytype">
<option value="query1">Best seller in Spring</option>
<option value="query2">Best seller in Summer</option>
<option value="query3">Best seller in Fall</option>
<option value="query4">Available critical medications in storage</option>
    <input type="submit" value="Make the query">
    </form>
    <br>
    <form action="query2.jsp">
    <h3>Company benefitial:</h3>
    <select name="querybenefit">
<option value="query4">Most amount of product sold at one season</option>
<option value="query5">Average sales</option>
<option value="query6">Average sales in terms of PRICE/COST</option>
    <input type="submit" value="Make the query">
    </form>
     <br>
     <form action="query3.jsp">
    <h3>Employee status:</h3>
    <select name="querystatus">
<option value="query7">Gold medal: Most popular profession</option>
<option value="query8">Need improvement: Least popular profession</option>
<option value="query9">Most popular geographic location dermatology/skin disorders issues</option>
<!--option value="query9">Which drugs were sold the most in Fall?</option-->
    <input type="submit" value="Make the query">
    </form>
    <!--</form><br></br>
    <!--<button type="button">Personal info</button>
    <form action="view_prescription.jsp">
    <input type="text" name="cid" value="Customer ID">
    <input type="submit" value="View prescription">
    </form><br></br>
    <form action="pay_prescription.jsp">
        <input type="text" name="paycid" value="Customer ID">
    <input type="submit" value="Pay prescription">-->
    </form><br></br>
</div>

<div style="float:right"><A HREF="logout.jsp" ><button type="button">Logout</button></A></div>

</div>
        <center>
    </body>
</html>
