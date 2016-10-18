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
Statement ps = null;
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
String sql1 = "select count(TBLPRESCRIPTIONS.PRSCDATE) as SPRING from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) <= 4";
String sql2 ="select count(TBLPRESCRIPTIONS.PRSCDATE) as SUMMER from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) > 4 and to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) < 8";
String sql3 ="select count(TBLPRESCRIPTIONS.PRSCDATE) as FALL from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) >= 8";
String sql4 ="select distinct MEDNAME, AEDESC from (TBLMEDICATIONS natural join TBLADVERSEEVENTS)where CLASSIFICATION = 4";
//String sql4 ="select distinct MEDNAME, CASE WHEN CLASSIFICATION = 1 THEN 'Low Severity' WHEN CLASSIFICATION = 2 THEN 'Medium Severity' WHEN CLASSIFICATION = 3 THEN 'High Severity' WHEN CLASSIFICATION = 4 THEN 'Critical Severity' ELSE 'No Severity' END AS "Severity" from (TBLMEDICATIONS natural join TBLADVERSEEVENTS) where CLASSIFICATION = 4";
//get parameter from server
String querytype = request.getParameter("querytype");
String querytype1 = request.getParameter("querystatus");
try {
Class.forName(driverName);
con = DriverManager.getConnection(url, user, password);
ps = con.createStatement();

%>
<form method="post" action="admin.jsp">
<center><h2 style="color:green">Query result</h2>

<!--<option value="doctor">doctor</option>
-->
</center>

<%
  //key part: execute query and return value
  //query 1, for spring
    if (querytype.equals("query1")) {
        rs1 = ps.executeQuery(sql1);
        //rs = ps.executeQuery(sql1); 
        while(rs1.next()) {
        String str1 = rs1.getString("spring");
        
        out.println("The total amount of medication sold in spring is: "+str1);
        
        }
        rs1.close();
    }
   //query 2, for summer
      if (querytype.equals("query2")) {
       rs2 = ps.executeQuery(sql2);
        while(rs2.next()) {
        String str2 = rs2.getString("summer");
       out.println("The total amount of medication sold in summer is: "+str2);
        
    }
        rs2.close();
    }
   //query 3, for fall
    if (querytype.equals("query3")) {
       rs3 = ps.executeQuery(sql3);
        while(rs3.next()) {
        String str3 = rs3.getString("fall");
       out.println("The total amount of medication sold in fall is: "+str3);
        
    }
        rs3.close();
    }
     if (querytype.equals("query4")) {
       rs4 = ps.executeQuery(sql4);
        while(rs4.next()) {
        String str4 = rs4.getString("medname");
        %>
        <table>
        <tr><td>
       <%out.println("The critical medications available in storage are: "+str4);%>
        <br>
        </tr></td>
        <table>
       <%
    }
        rs4.close();
    }
     
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
<td><input type="submit" value="back to admin page"/></td>
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
