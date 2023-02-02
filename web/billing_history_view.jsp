<%-- 
    Document   : billing_history_view
    Created on : 16 Dec, 2019, 4:51:36 PM
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
        <div align='left' style="">
            <br><br>
            <h2>Payment Method</h2>
            <form action="final_bill" method="post">
            <select name="type">
                <option value="ICICI">ICICI</option>
                <option value="Andra bank">Andra Bank</option>
                <option value="Cash-Kalam">Cash-Kalam</option>
                <option value="Cash-Kali">Cash-Kali</option>
                <option value="Cash-office">Cash-Office</option>
            </select>
                <input type="submit" value="Realize"/>
                </form>
        <%
           session=request.getSession();
           session.setAttribute("user",session.getAttribute("user"));
           session.setAttribute("invoice_num",session.getAttribute("invoice_num"));
           String invoice=session.getAttribute("invoice_num").toString();
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
           Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
           Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            Statement sr=con2.createStatement();
            Statement sx=con3.createStatement();
            ResultSet rs=st.executeQuery("select * from invoices where invoice = '"+invoice+"' ");
            ResultSet rt=sr.executeQuery("select * from tasks where invoice = '"+invoice+"' ");
            ResultSet rx;
            rs.next();
            String amount=rs.getString("amount");
            String inv_date=rs.getString("invoice_date");
            String company=rs.getString("company");
            out.print("<table>");
            out.print("<tr>");
            out.print("<td style=\"font-weight: bold; width: 1000px; font-family: Arial black;\" >Invoice no: "+invoice+" <br><br></td> ");
            out.print("<td style=\"font-weight: bold; width: 300px; font-family: Arial black;\" >Invoice Amount: "+amount+"<br><br></td> ");
            out.print("</tr>");
            out.print("<br><tr>");
            out.print("<td style=\"font-weight: bold; width: 1000px; font-family: Arial black;\" >Client no: "+company+"</td> ");
            out.print("<td style=\"font-weight: bold; width: 300px; font-family: Arial black;\" >Invoice Date: "+inv_date+"</td> ");
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
            String task,due_date,cre_date,client,type,name;
            while(rt.next())
            {
                task=rt.getString("t_name");
                due_date=rt.getString("due_date");
                client=rt.getString("client_id");
                type=rt.getString("client_type");
                cre_date=rt.getString("creation_d");
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
            %>
            </div>
    </body>
</html>