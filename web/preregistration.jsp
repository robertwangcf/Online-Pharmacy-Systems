<%-- 
    Document   : preregistration
    Created on : 2016-3-27, 23:15:26
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
<style type="text/css">
.firstDiv{
width:400px;

height:300px;

margin:1cm 5cm 3cm 5cm <%--up,down,left,right--%>

}
</style>
    </head>
        <body background="6809741-simple-wallpaper.jpg" background-size:100>
    
       <form class="firstDiv" action="registration.jsp" method="post">
           <fieldset><legend> <h2 style="color:red">Registration page</h2></legend><br/><br/>
<h3>User ID :<br/><input type="text" name="userid" /><br/></h3>
<h3>User name :<br/><input type="text" name="username" /><br/></h3>
<h3>Password :<br/><input type="password" name="pwd" /><br/>
    <h3>Confirm password :<br/><input type="password" name="pwd" /><br/>
    <h3 >Email :<br/><input type="text" name="email" /><br/></h3>
    <p>
        <label for="Roles"><h3>Please select your roles:</h3></label><br/>
    <input type="radio" name="roles" value="2"/>doctor
    <input type="radio" name="roles" value="3"/>customer
    <input type="radio" name="roles" value="1"/>pharmacist<br/>
    <h4 style ="color:red"> Tips: if you are not clear with your id, please contact admin</h4>
</p>

<br/><br/>

<input type="submit" value="submit"/>

</form>
     </fieldset>  
    </body>
</html>
