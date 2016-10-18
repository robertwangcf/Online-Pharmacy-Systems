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
ResultSet rs4 = null;
ResultSet rs5 = null;
ResultSet rs6 = null;

String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:" + "thin:@128.227.205.217:1521:orcl";
String user = "chaofeng";
String password = "Haohaoxuex1";

//String sql = "select usertype from testuser";
//correct here sql command
String sql4 ="select * from(select * from((select count(TBLPRESCRIPTIONS.PRSCDATE) as SeasonW from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) <= 4) union(select count(TBLPRESCRIPTIONS.PRSCDATE) as SeasonW from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) > 4 and to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) < 8)union(select count(TBLPRESCRIPTIONS.PRSCDATE) as SeasonW from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) >= 8))order by SeasonW desc)where rownum=1";
String sql5 ="select avg(TBLPRESCRIPMEDS.COST) as Summer2 from(select * from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) > 4 and to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) < 8 and to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'YYYY')) = 2010) natural join TBLPRESCRIPMEDS";
String sql6 ="select avg(TBLPRESCRIPMEDS.COST) as Summer2010 from(select * from TBLPRESCRIPTIONS where to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) > 4 and to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'MM')) < 8 and to_number(to_char(TBLPRESCRIPTIONS.PRSCDATE, 'YYYY')) = 2010) natural join TBLPRESCRIPMEDS";
//get parameter from server
String querytype1 = request.getParameter("querybenefit");
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
   //query4, for most selling
  if (querytype1.equals("query4")) {
       rs4 = ps.executeQuery(sql4);
        while(rs4.next()) {
        String str4 = rs4.getString("SeasonW");
       out.println("The Most amount sold is: "+str4);
        
    }
        rs4.close();
    }
    //query5 and 6, for the ave
     if (querytype1.equals("query5")) {
       rs5 = ps.executeQuery(sql5);
        while(rs5.next()) {
        String str7 = rs5.getString("Summer2");
       out.println("The average sales is: "+str7);
        
    }
        rs5.close();
    }
      if (querytype1.equals("query6")) {
       rs6 = ps.executeQuery(sql6);
        while(rs6.next()) {
        String str6 = rs6.getString("Summer2010");
       out.println("The average sales in terms of COST/PRICE is: "+str6);
        
    }
        rs6.close();
    }
     // //query, for most popular query
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
