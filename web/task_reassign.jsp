<%-- 
    Document   : task_reassign
    Created on : 7 Dec, 2019, 5:07:27 PM
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
         </div>
        
        <h2> Reassign to</h2>
        <form action="reassign_task" method="post">
        <select name="item">
            <%
                session=request.getSession();
            session.setAttribute("user",session.getAttribute("user"));
            session.setAttribute("filter",session.getAttribute("filter"));
            String filter=session.getAttribute("filter").toString();
            String user=session.getAttribute("user").toString();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            if(filter.equals("null"))
            {
               rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"assigned\" ");
            }
            else
            {
                rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"assigned\" and client_id = '"+filter+"' ");
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
        <input type="submit" value="Reassign">
        </form>
    </body>
</html>
