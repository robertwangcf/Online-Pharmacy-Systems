<%-- 
    Document   : view_prescription
    Created on : 2016-4-18, 16:23:50
    Author     : Sony
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>View Prescription</title>
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
    //define the strings which will be output in the screen
String CustomerID;
String CustomerLastname;
String CustomerFirstname;
String CustomerDob;
String CustomerStreet;
String CustomerCity;
String CustomerState;
String CustomerZip;
//String name=request.getParameter("name");
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:" + "thin:@128.227.205.217:1521:orcl";
String user = "chaofeng";
String dbpsw = "Haohaoxuex1";

String sql = "select * from tblprescriptions where CUSTID =?";

String name = request.getParameter("cid");
//out.println(name);
//String password = request.getParameter("password");
//String usertype = request.getParameter("usertype");
//String select_string = request.getParameter("select_string");
if(!(name.equals(null))) {
    try{
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1, name);
rs = ps.executeQuery();

if(rs.next()) {
    if(!(name.equals(rs.getString("CUSTID")))) {
    response.sendRedirect("error.jsp");
}
    /*
CustomerID = rs.getString("CUSTID");
CustomerLastname = rs.getString("CLANME");
CustomerFirstname = rs.getString("CFNAME");
CustomerDob = rs.getString("CDOB");
CustomerStreet = rs.getString("CSTREET");
CustomerCity = rs.getString("CCITY");
CustomerState = rs.getString("CSTATE");
CustomerZip = rs.getString("CZIP");
    */
    %>
    <center>
        <form class="firstDiv"  name="back Form" action="welcome2.jsp?name="<%=name%>>
           <fieldset><legend> <h2 style="color:red">Prescription for customer<%= rs.getString("CUSTID") %></h2></legend><br/><br/>

<br>
<%out.println("PrescriptionID: "+ rs.getString("PRSCID") + "\n" ); %>
<br>
<%out.println("Date: "+ rs.getString("PRSCDATE") + "\n" ); %>
<br>
<%out.println("Refills: "+ rs.getString("REFILLSALLOWED")+ "\n"  ); %>
<br>
<%out.println("The doctor ID in response for this prescription: "+ rs.getString("DRID") + "\n" ); %>
<br>
    </center>
    <br>
    <br>
    <br>
<%
}
else
response.sendRedirect("error.jsp");
rs.close();
ps.close();
}
catch(SQLException sqe)
{
out.println(sqe);
} 
}




/* String userid=request.getParameter("userid"); 
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
String sql="select * from tblusers where username=";
//try
//{"insert into tblusers (accountid,username,password,accttpye) values ('"+userid+"','"+user+"','"+pwd+"','"+roles+"')"
int i=st.executeUpdate(sql); 

out.println("Congratulations,"+user+", you are all set!"); 



//}catch(Exception ex){
   //ex.printStackTrace();//打印错误信息看看是什么
//}
*/


%>
   
<center>
            <input type="submit" value="Back to your personal page" >
</center>
    </form>
            </center>
    </body>
</html>
