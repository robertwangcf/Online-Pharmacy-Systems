<%-- 
    Document   : confirm_payment
    Created on : 2016-3-27, 17:22:29
    Author     : Sony
page for registration
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>

<title>payment confirmation Page</title>
</head>
    <body background="6809741-simple-wallpaper.jpg" background-size:100>
           <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String prscid=request.getParameter("PrescriptionID"); 
String cusid=request.getParameter("CustomerID"); 
//session.setAttribute("username",user); 
String refillid=request.getParameter("RefillID"); 
String payid=request.getParameter("PayID"); 
String amount=request.getParameter("amount"); 
String paytype=request.getParameter("type"); 
//String email=request.getParameter("email");
Class.forName("oracle.jdbc.driver.OracleDriver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:" + "thin:@128.227.205.217:1521:orcl",
"chaofeng","Haohaoxuex1"); 
Statement st= con.createStatement(); 

String sql="insert into TBLPAYMENTS values ('"+prscid+"','"+refillid+"','"+payid+"','','','"+cusid+"')";
//try
//{"insert into tblusers (accountid,username,password,accttpye) values ('"+userid+"','"+user+"','"+pwd+"','"+roles+"')"
int i=st.executeUpdate(sql); 

out.println("Thank you for your payment, you are all set! Please allow shipment for 3-5 business days"); 



//}catch(Exception ex){
   //ex.printStackTrace();//打印错误信息看看是什么
//}

st.close();

%>
    <center>
        <br>
<form name="back Form" action="welcome2.jsp">
            <input type="submit" value="Back to personal page" >
            </center>
    </body>
</html>