<%-- 
    Document   : task_assign
    Created on : 7 Dec, 2019, 7:17:51 PM
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
    </head>
    
    <body>
        <div align="top-left">
            <img src="logo.png" width="default" height="default"/>
            <br><br>
        </div>
       
        <h2> Reassign to</h2>
        <form action="assign_task" method="post">
        <select name="item">
            <%
                session=request.getSession();
            session.setAttribute("user",session.getAttribute("user"));
            String user=session.getAttribute("user").toString();
            String filter=session.getAttribute("filter").toString();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            if(filter.equals("null"))
            {
                rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"\" ");
            }
            else
            {
                rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"\" and client_id = '"+filter+"' ");
            }
            out.print(user);
            int i=0;
            while(rs.next())
            {
            i=i+1;
            out.print(i);
            if(null!=request.getParameter("id'"+i+"'"))
            {
                String temp=rs.getString("id");
                session.setAttribute("task", temp);
                break;
            }
            }
            rs=st.executeQuery("select username from account");
            String name;
            while(rs.next())
            {
               name=rs.getString("username");
               out.print("<option value=\""+name+"\">"+name+"</option>");
            }
                %>
        </select>
        <input type="submit" value="Assign">
        </form>
    </body>
</html>
