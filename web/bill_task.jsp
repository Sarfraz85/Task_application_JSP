<%-- 
    Document   : bill_task
    Created on : 11 Dec, 2019, 1:09:11 PM
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
        <div align="top-left">
            <img src="logo.png" width="default" height="default"/>
            <br><br>
        </div>
        <div align='left' style="">
            <br><br>
            <form action="for_realization" method="post">
                <table>
                    <thead>
           <td style="font-weight: bold; width: 180px; font-family: Arial black;">Client Code</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Client Name</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Task</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Creation Date</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Due Date</td>
            </thead>
                <%
                session=request.getSession();
            session.setAttribute("user",session.getAttribute("user"));
            session.setAttribute("filter",session.getAttribute("filter"));
            String filter=session.getAttribute("filter").toString();
            String user=session.getAttribute("user").toString();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            Statement sr=con2.createStatement();
            ResultSet rs=null;
            ResultSet rt=null;
            if(filter.equals("null"))
            {
               rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"pending bill\" ");
            }
            else
            {
                rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"pending bill\" and client_id = '"+filter+"' ");
            }
            int i=0,j=0;
            String creation,task,completion,client_id,client_type,client,uid;
            while(rs.next())
            {
            i=i+1;
            if(request.getParameter("id"+i+"")!=null)
            {
                creation=rs.getString("creation_d");
                task=rs.getString("t_name");
                completion=rs.getString("due_date");
                client_id=rs.getString("client_id");
                client_type=rs.getString("client_type");
                uid=rs.getString("id");
                if(client_type.equals("t"))
                {
                    rt=sr.executeQuery("select name from temp_client where id = '"+client_id+"' ");
                }
                else
                {
                    rt=sr.executeQuery("select name from client where id = '"+client_id+"' ");
                }
                out.print("<tr>");
                out.print("<td width='"+180+"'>"+client_id+"</td>");
                while(rt.next())
                {
                    client=rt.getString("name");
                    out.print("<td width='"+180+"'>"+client+"</td>");   
                }
                out.print("<td width='"+180+"'>"+task+"</td>");
                out.print("<td width='"+180+"'>"+creation+"</td>");
                out.print("<td width='"+180+"'>"+completion+"</td>");
                out.print("<td width='"+180+"'> <input type=\"hidden\" name=\"id"+j+"\" value='"+uid+"'/></td>");
                out.print("</tr>");
                j=j+1;
            }
            
            }
            session.setAttribute("index",j);
            
            
                %>
                <input type="text" name="amount" placeholder="Amount"/> <br><br>
                <input type="text" name="invoice" placeholder="Invoice Number"/><br><br>
                <select name="company">
                <option value="KALP and associates">KALP and Associates</option>
                <option value="Komplete Financing Soln.">Komplete Financing Soln.</option>
                </select>
                <input type="submit" value="Bill" />
            </table>
            </form>
            </div>
    </body>
</html>