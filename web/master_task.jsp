<%-- 
    Document   : master_task
    Created on : 8 Apr, 2020, 5:51:12 PM
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
    <script>
            function function1() {
                    window.location.href = "newtask.jsp";
 }
 function function2() {
                    window.location.href = "review_task_master.jsp";
 }
 function function3(){
     window.location.href = "task_master.jsp";
 }
 function function4(){
     window.location.href = "task_unassigned.jsp";
 }
 function function5(){
     window.location.href = "task_on_hold.jsp";
 }
 function function6(){
     window.location.href = "task_bill.jsp";
 }
 function function7(){
     window.location.href = "billing_history.jsp";
 }
 function function8(){
     window.location.href = "add_user.jsp";
 }
 function function9(){
     window.location.href = "del_user.jsp";
 }
 function function10(){
     window.location.href = "client_search.jsp";
 }
 function function11(){
     window.location.href = "add_client.jsp";
 }
 function function12(){
     window.location.href = "del_client.jsp";
 }
 function function13(){
     window.location.href = "activate_client.jsp";
 }
 function function14(){
     window.location.href = "activate_client.jsp";
 }
 function function15(){
     window.location.href = "view_user.jsp";
 }
 function function16(){
     window.location.href = "master_task.jsp";
 }
        </script>
        <script type="text/javascript">
var Msg ='<%=request.getAttribute("message")%>';
    if (Msg != "null") {
 function alertName(){
 alert(Msg);
 } 
 }
 </script> 
 <script type="text/javascript"> window.onload = alertName; </script>
        <link href="Style.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <div align="top-left">
            <img src="logo.png" width="default" height="default"/>
            <br><br>
        </div>
        
        
        <div class="navbar">
        <div class="dropdown1">
            <button class="dropbtn">Task</button>
            <div class="dropdown-content">
                <a href="#" onclick="function16()">My Tasks</a>
                <a href="#" onclick="function1()">New Task</a>
                <a href="#" onclick="function3()">Assigned Tasks</a>
                <a href="#" onclick="function4()">Unassigned Tasks</a>
                <a href="#" onclick="function5()">Task on hold</a>
                <a href="#" onclick="function2()">Pending Review</a>
            </div>
            </div>
            
            <div class="dropdown2">
            <button class="dropbtn">Client</button>
            <div class="dropdown-content">
                <a href="#" onclick="function10()">View</a>
                <a href="#" onclick="function11()">Add Client</a>
                <a href="#" onclick="function12()">Deactivate Client</a>
                <a href="#" onclick="function13()">Activate Permanent Client</a>
                <a href="#" onclick="function14()">Activate Temporary Client</a>
            </div>
            </div>
            <div class="dropdown3">
            <button class="dropbtn">User</button>
            <div class="dropdown-content">
                <a href="#" onclick="function15()">View</a>
                <a href="#" onclick="function8()">Add User</a>
            </div>
            </div>
            <div class="dropdown4">
            <button class="dropbtn">Bill</button>
            <div class="dropdown-content">
                <a href="#" onclick="function6()">Bill</a>
                <a href="#" onclick="function7()">Billing History</a>
            </div>
            </div>
         </div><br>
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
                <td style="font-weight: bold; width: 180px; font-family: Arial black;">Client Code</td>
                <td style="font-weight: bold; width: 180px; font-family: Arial black;">Client Name</td>
            <td style="font-weight: bold; width: 260px;">Creation date</td>
            <td style="font-weight: bold; width: 260px;">Assigned by</td>
            <td style="font-weight: bold; width: 260px;">Task</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Remark</td>
            <td style="font-weight: bold; width: 260px;">Due Date</td>
            </thead>
        <%
            session=request.getSession();
            session.setAttribute("user",session.getAttribute("user"));
            String user=session.getAttribute("user").toString();
            out.print("<input type=\"hidden\" name=\"account\" value=\"master\" /> ");
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
                
                
                
                
                out.print("<td width='"+spc+"'>"+client+"</td>");
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
                out.print("<td width='"+spc+"'>"+cre_date+"</td>");
                out.print("<td width='"+spc+"'>"+creator+"</td>");
                out.print("<td width='"+spc+"'>"+task+"</td>");
                out.print("<td width='"+spc+"'>"+remark+"</td>");
                out.print("<td width='"+spc+"'>"+due_date+"</td>");
                out.print("<td width='"+spc+"'><input type=\"submit\" value=\"Review\" name=\"id'"+id+"'\"</td>");
                out.print("</tr>");
            }
            %>
            </table>
            </form>
            </div>
    </body>
</html>

