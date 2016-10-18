 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<%! String userdbName;
String userdbPsw;
String dbUsertype;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:" + "thin:@128.227.205.217:1521:orcl";
String user = "chaofeng";
String dbpsw = "Haohaoxuex1";

String sql = "select * from tblusers where username=? and password=? and accttype=?";

String name = request.getParameter("name");
String password = request.getParameter("password");
String usertype = request.getParameter("usertype");
String select_string = request.getParameter("select_string");

if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))) && !usertype.equals("select"))
{
try{
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, password);
ps.setString(3, usertype);
rs = ps.executeQuery();
if(rs.next())
{ 
userdbName = rs.getString("username");
userdbPsw = rs.getString("password");
dbUsertype = rs.getString("accttype");
if(name.equals(userdbName) && password.equals(userdbPsw) && usertype.equals(dbUsertype))
{
session.setAttribute("name",userdbName);
session.setAttribute("select_string", dbUsertype); 
//redirect to different roles
/*if(select_string.equals("doctor"))       
response.sendRedirect("welcome.jsp?name="+name); 
if(select_string.equals("customer"))
response.sendRedirect("welcome1.jsp?name="+name); 
if(select_string.equals("pharmacist"))
response.sendRedirect("welcome2.jsp?name="+name); 
*/
 if (usertype.equals("2"))
    response.sendRedirect("welcome.jsp?name="+name);
//to doctor page
    //if (usertype == 2)
    if (usertype.equals("1"))
   response.sendRedirect("welcome1.jsp?name="+name);
    
    //if (usertype == 3)
    if (usertype.equals("3"))
   response.sendRedirect("welcome2.jsp?name="+name); 
    
    //if (usertype == 4)
    if (usertype.equals("4"))
   // select_string="admin";
   response.sendRedirect("admin.jsp?name="+name); 
        }
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
else
{
%>
<center><p style="color:red">Error In Login</p></center>
<% 
getServletContext().getRequestDispatcher("/response.jsp").include(request, response);
}
%>
</body>
</html>