<%-- 
    Document   : task_slave
    Created on : 30 Nov, 2019, 12:53:12 PM
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
        </div>
        <div>
            <br><br><br>
        </div>
        <div align='left'>
            <form name="frm2" action="task_slave.jsp" method="post">
            <h2>Filter client id</h2>
            <input type="text" name="client_fil"/>
            <input type="submit" value="Filter"/>
            </form>
        <form name="frm" action="review_task_slave" method="post">
        <table>
            <thead>
            <td style="font-weight: bold; width: 260px;">Creation date</td>
            <td style="font-weight: bold; width: 260px;">Assigned by</td>
            <td style="font-weight: bold; width: 260px;">Task</td>
            <td style="font-weight: bold; width: 260px;">Due Date</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Client Name</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Client Code</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Remark</td>
            </thead>
        <%
            session=request.getSession();
            session.setAttribute("user",session.getAttribute("user"));
            String user=session.getAttribute("user").toString();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            Statement sr=con2.createStatement();
            ResultSet rs=null;
            ResultSet rt=null;
            String client_fil=request.getParameter("client_fil");
            if(client_fil!=null)
            {
                rs=st.executeQuery("select * from tasks where assigned_to = '"+user+"'and status = \"assigned\" and client_id = '"+client_fil+"' ");
            }
            else
            {
                rs=st.executeQuery("select * from tasks where assigned_to = '"+user+"'and status = \"assigned\" ");
            }
            String cre_date,creator,task,due_date,spc="23.5%",client,id1,type,remark;
            int id=0;
            while(rs.next())
            {
                id=id+1;
                cre_date=rs.getString("creation_d");
                creator=rs.getString("creator");
                task=rs.getString("t_name");
                due_date=rs.getString("due_date");
                client=rs.getString("client_id");
                type=rs.getString("client_type");
                remark=rs.getString("review");
                out.print("<tr>");
                out.print("<td width='"+spc+"'>"+cre_date+"</td>");
                out.print("<td width='"+spc+"'>"+creator+"</td>");
                out.print("<td width='"+spc+"'>"+task+"</td>");
                out.print("<td width='"+spc+"'>"+due_date+"</td>");
                if(type.equals("t"))
                {
                    rt=sr.executeQuery("select name from temp_client where id = '"+client+"' ");
                }
                else
                {
                    rt=sr.executeQuery("select name from client where id = '"+client+"' ");
                }
                while(rt.next())
                {
                    id1=rt.getString("name");
                    out.print("<td width='"+180+"'>"+id1+"</td>");   
                }
                out.print("<td width='"+spc+"'>"+client+"</td>");
                out.print("<td width='"+spc+"'>"+remark+"</td>");
                out.print("<td width='"+spc+"'><input type=\"submit\" value=\"Review\" name=\"id'"+id+"'\"</td>");
                out.print("</tr>");
            }
            %>
            </table>
            </form>
            </div>
    </body>
</html>
