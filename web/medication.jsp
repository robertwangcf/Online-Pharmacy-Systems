<%-- 
   
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query result</title>
</head>
<body background="6809741-simple-wallpaper.jpg" background-size:100>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs1 = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
ResultSet rs4 = null;
ResultSet rs8 = null;

String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:" + "thin:@128.227.205.217:1521:orcl";
String user = "chaofeng";
String password = "Haohaoxuex1";

//String sql = "select usertype from testuser";
//correct here sql command
String sql1 = "select * from TBLMEDICATIONS where medid=?";
String sql2 ="select count(TBLPRESCRIPTIONS.PRSCDATE) as SUMMER from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) > 4 and to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) < 8";
String sql3 ="select count(TBLPRESCRIPTIONS.PRSCDATE) as FALL from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) >= 8";
String sql4 ="select distinct MEDNAME, AEDESC from (TBLMEDICATIONS natural join TBLADVERSEEVENTS)where CLASSIFICATION = 4";
//String sql4 ="select distinct MEDNAME, CASE WHEN CLASSIFICATION = 1 THEN 'Low Severity' WHEN CLASSIFICATION = 2 THEN 'Medium Severity' WHEN CLASSIFICATION = 3 THEN 'High Severity' WHEN CLASSIFICATION = 4 THEN 'Critical Severity' ELSE 'No Severity' END AS "Severity" from (TBLMEDICATIONS natural join TBLADVERSEEVENTS) where CLASSIFICATION = 4";
//get parameter from server
String querytype = request.getParameter("medicationid");

//String querytype1 = request.getParameter("querystatus");
try {
Class.forName(driverName);
con = DriverManager.getConnection(url, user, password);
ps = con.prepareStatement(sql1);
ps.setString(1, querytype);
rs4 = ps.executeQuery();
%>
<form method="post" action="welcome1.jsp">
<center><h2 style="color:green">Medication list</h2>

<!--<option value="doctor">doctor</option>
-->
</center>

<%
  //key part: execute query and return value
  //query 1, for spring
    while(rs4.next()){
     
        String str4 = rs4.getString("medid");
        String str5 = rs4.getString("medname");
        %>
        <table>
        <tr><td>
       <%out.println("The medication name: "+str5+" with ID: "+str4+"is available in system storage" );%>
        <br>
        </tr></td>
        <table>
       <%
    }
        rs4.close();
    
     
     // //query8, for most popular query
    //if (usertype == 2)
    /*if (usertype.equals("2"))
    select_string="doctor";
    
    //if (usertype == 4)
    if (usertype.equals("4"))
    select_string="admin";
    
    //if (usertype == 3)
    if (usertype.equals("3"))
    select_string="customer";
    
    */
      
  // System.out.println("successfully get string");
     //break;
 
 //} 

ps.close();
}

catch(SQLException sqe)
{
out.println("response"+sqe);
}
%>

</td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="back to personal page"/></td>
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
