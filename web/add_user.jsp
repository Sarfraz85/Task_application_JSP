<%-- 
    Document   : add_user
    Created on : 14 Dec, 2019, 11:38:21 AM
    Author     : Sarfraz Ahmad
--%>

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
        
        <br>
        <h2>Create User</h2>
        <br>
        
        <form action="add_user" method="post">
            <input type="text" name="username" placeholder="Username"/><br><br>
            <input type="password" name="pass" placeholder="Password"/><br><br>
            <select name="item">
                <option value="master">Master</option>
                <option value="slave">Slave</option>
            </select><br><br>
            <input type="submit" value="Create User"/>
        </form>
        
        
        
        
        <%
            //session=request.getSession();
            //session.setAttribute("user",session.getAttribute("user"));
            %>
    </body>
</html>
