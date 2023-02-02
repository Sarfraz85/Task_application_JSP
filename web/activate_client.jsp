<%-- 
    Document   : activate_client
    Created on : 5 Apr, 2020, 10:06:20 PM
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
        
        
        <div align='left' style="">
            <form name="frm2" action="activate_client.jsp" method="post">
            <h2>Filter client id</h2>
            <input type="text" name="client_fil"/>
            <input type="submit" value="Filter"/>
            </form>
        <form action="" method="post">
        <table>
            <thead>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Client Code</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Client Name</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">Contact</td>
            <td style="font-weight: bold; width: 180px; font-family: Arial black;">PAN</td>
            </thead>
        <%
            
           session=request.getSession();
           session.setAttribute("user",session.getAttribute("user"));
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            String client_fil=request.getParameter("client_fil");
            if(client_fil!=null)
            {
                rs=st.executeQuery("select * from client where activation_status = \"inactive\" and id = '"+client_fil+"' ");
                session.setAttribute("filter",client_fil);
            }
            else
            {
                rs=st.executeQuery("select * from client where activation_status = \"inactive\" ");
                session.setAttribute("filter","null");
            }
            int flag=0;
            String id,name,contact,pan;
            while(rs.next())
            {
                flag=flag+1;
                id=rs.getString("id");
                name=rs.getString("name");
                contact=rs.getString("contact");
                pan=rs.getString("pan");
                out.print("<tr>");
                out.print("<td >"+id+"</td>");
                out.print("<td >"+name+"</td>");
                out.print("<td >"+contact+"</td>");
                out.print("<td >"+pan+"</td>");
                out.print("<td ><input type=\"submit\" value=\"Activate\" formaction=\"activate_client_permanenet\" name=\"id'"+flag+"'\"></td>");
                out.print("</tr>");
            }
            
            %>
            </table>
            </form>
            </div>
    </body>
</html>
