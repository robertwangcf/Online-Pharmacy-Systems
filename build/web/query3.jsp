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
ResultSet rs7 = null;
ResultSet rs8 = null;
ResultSet rs9 = null;

String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:" + "thin:@128.227.205.217:1521:orcl";
String user = "chaofeng";
String password = "Haohaoxuex1";

//String sql = "select usertype from testuser";
//correct here sql command

String sql7 ="select * from(select DOCTYPE, count(DOCTYPE) from(TBLPRESCRIPTIONS natural join TBLDOCTORS) group by DOCTYPE order by count(DOCTYPE) desc) where rownum=1";
String sql8 ="select * from(select DOCTYPE, count(DOCTYPE) from(TBLPRESCRIPTIONS natural join TBLDOCTORS) group by DOCTYPE order by count(DOCTYPE) asc) where rownum=1";
String sql9 ="select * from(select DRSTATE, count(*) from((select * from TBLDOCTORS)natural join(select DRID from(TBLCUSTOMERS natural join TBLPRESCRIPTIONS)))where DOCTYPE = 'Dermatology' group by DRSTATE order by count(DRSTATE) desc)where rownum=1";
//get parameter from server
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
   
    //query7, for the most popular profession
     if (querytype1.equals("query7")) {
       rs7 = ps.executeQuery(sql7);
        while(rs7.next()) {
        String str7 = rs7.getString("doctype");
       out.println("The most popular profession is: "+str7);
        
    }
        rs7.close();
    }
      if (querytype1.equals("query8")) {
       rs8 = ps.executeQuery(sql8);
        while(rs8.next()) {
        String str8 = rs8.getString("doctype");
       out.println("The least popular profession is: "+str8);
        
    }
        rs8.close();
    }
         if (querytype1.equals("query9")) {
       rs9 = ps.executeQuery(sql9);
        while(rs9.next()) {
        String str9 = rs9.getString("drstate");
       out.println("The most popular location is: "+str9);
        
    }
        rs9.close();
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
