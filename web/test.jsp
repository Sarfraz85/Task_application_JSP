<%-- 
    Document   : test
    Created on : 19 Dec, 2019, 11:46:01 AM
    Author     : Sarfraz Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String value;
            int i=0;
            while(i<=5)
            {
                i=i+1;
                String temp=request.getParameter("id"+i+"");
            if(temp!=null)
            {
                out.print("<br>id"+i);
            }
            }
            %>
    </body>
</html>
