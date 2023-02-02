<%-- 
    Document   : billed_view
    Created on : 20 Dec, 2019, 7:19:34 PM
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
        <br><br>
        
        <%
          session=request.getSession();
           session.setAttribute("user",session.getAttribute("user"));
           String invoice=request.getParameter("invoice_no");
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
           Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
           Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            Statement sr=con2.createStatement();
            Statement sx=con2.createStatement();
            ResultSet rs=st.executeQuery("select * from invoices where invoice = '"+invoice+"' ");
            ResultSet rt=sr.executeQuery("select * from tasks where invoice = '"+invoice+"' ");
            ResultSet rx=null;
            rs.next();
            String amount=rs.getString("amount");
            String inv_date=rs.getString("invoice_date");
            String rel_date=rs.getString("rel_date");
            String method=rs.getString("method");
            String company=rs.getString("company");
            if(null!=method)
            {  
            out.print("<table>");
            out.print("<tr>");
            out.print("<td style=\"font-weight: bold; width: 1000px; font-family: Arial black;\" >Invoice no: "+invoice+" <br><br></td> ");
            out.print("<td style=\"font-weight: bold; width: 300px; font-family: Arial black;\" >Invoice Amount: "+amount+"<br><br></td> ");
            out.print("</tr>");
            out.print("<br><tr>");
            out.print("<td style=\"font-weight: bold; width: 1000px; font-family: Arial black;\" >Client no: "+company+" <br><br></td> ");
            out.print("<td style=\"font-weight: bold; width: 300px; font-family: Arial black;\" >Invoice Date: "+inv_date+" <br><br></td> ");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<td style=\"font-weight: bold; width: 1000px; font-family: Arial black;\" >Realization Date: "+rel_date+" <br><br></td> ");
            out.print("<td style=\"font-weight: bold; width: 300px; font-family: Arial black;\" >Method: "+method+"<br><br></td> ");
            out.print("</tr>");
            out.print("</table>");
            out.print("<br><br><table>");
            out.print("<thead>");
            out.print("<td style=\"font-weight: bold; width: 183px; font-family: Arial black;\">Client ID</td>");
            out.print("<td style=\"font-weight: bold; width: 183px; font-family: Arial black;\">Client Name</td>");
            out.print("<td style=\"font-weight: bold; width: 183px; font-family: Arial black;\">Creation date</td>");
            out.print("<td style=\"font-weight: bold; width: 183px; font-family: Arial black;\">Task</td>");
            out.print("<td style=\"font-weight: bold; width: 183px; font-family: Arial black;\">Completion Date</td>");
            out.print("</thead>");
            String task,due_date,cre_date,client,name,type;
            while(rt.next())
            {
                task=rt.getString("t_name");
                due_date=rt.getString("due_date");
                client=rt.getString("client_id");
                cre_date=rt.getString("creation_d");
                type=rt.getString("client_type");
                if(type.equals("t"))
                {
                    rx=sx.executeQuery("select name from temp_client where id='"+client+"'");
                }
                else
                {
                    rx=sx.executeQuery("select name from client where id='"+client+"'");
                }
                rx.next();
                name=rx.getString("name");
                out.print("<tr>");
                out.print("<td width='"+180+"'>"+client+"</td>");
                out.print("<td width='"+180+"'>"+name+"</td>");
                out.print("<td width='"+180+"'>"+cre_date+"</td>");
                out.print("<td width='"+180+"'>"+task+"</td>");
                out.print("<td width='"+180+"'>"+due_date+"</td>");
                out.print("</tr>");
            }
            out.print("</table>");  
            }
            else
            {
                out.print("<h2>Bill Yet To Complete</h2>");
            }
            
        %>
        
        
    </body>
</html>
