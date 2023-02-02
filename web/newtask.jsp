<%-- 
    Document   : newtask
    Created on : 30 Nov, 2019, 4:26:56 PM
    Author     : Sarfraz Ahmad
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
       <link href="Style.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
       <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
 
  $(function() {
 
    $( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
 
  });
  </script>
    </head>
    <body>
    <center>
        <div align="left">
            <img src="logo.png" width="300" height="100"/>
        </div><br><br><br><br>
        <div align="left">
        <form name="newtask" action="insert_task" method="post">
            
            <h2>Job Description &nbsp;&nbsp;&nbsp;<input type="text" name="tname" style="width: 350px;"/> </h2><br>
            
            <h2>Remarks &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="remark" style="width: 350px;"/></h2><br>
            
            <h2>Client ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="client_id" style="width: 350px;"/></h2><br>
            <br><br>
            <h2>Client Type <input type="radio" name="client_type" value="p" checked="checked"/>Permanent
            <input type="radio" name="client_type" value="t"/>Temporary</h2><br>
            
            
            <h2>Due Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type= "text" class="datepicker" name = "duedate"/></h2><br>
            
            <h2>Assigned to &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="item">
                <option value="">None</option>
                 <%
                session=request.getSession();
           session.setAttribute("username",session.getAttribute("user"));
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from account");
            String name;
            while(rs.next())
            {
                name=rs.getString("username");
                out.print("<option value=\""+name+"\">"+name+"</option>");
            }
           %>
            </select></h2>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="submit" value="Create" style="width: "/>
        </form>
            </div>
            </center>
    </body>
</html>
