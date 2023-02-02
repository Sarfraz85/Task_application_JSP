<%-- 
    Document   : index
    Created on : 23 Nov, 2019, 3:31:48 AM
    Author     : Sarfraz Ahmad
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     <link href="Style.css" rel="stylesheet" type="text/css"/>
     <script type="text/javascript">
var Msg ='<%=request.getAttribute("message")%>';
    if (Msg != "null") {
 function alertName(){
 alert(Msg);
 } 
 }
 </script> 
 <script type="text/javascript"> window.onload = alertName; </script>
    </head>
    <body>
        <div align="center">
            <img src="logo.png" width="default" height="default"/>
        </div>
        <br><br><br><br><br><br>
        <div align="center">
        <form name="frm" action="login" method="get">
            <h2> Username</h2>
            <input type="text" name="user"><br><br>
            <h2> Password </h2>
            <input type="password" name="pass"><br><br>
            <input type="submit" name="submit" value="Login">
         </form>
            </div>
        
    </body>
</html>
