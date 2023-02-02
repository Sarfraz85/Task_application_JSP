/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sarfraz Ahmad
 */
@WebServlet(urlPatterns = {"/add_client"})
public class add_client extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id,name,contact,address,pan,type,status;
            id=request.getParameter("fileno");
            name=request.getParameter("clientname");
            contact=request.getParameter("contact");
            address=request.getParameter("address");
            status=request.getParameter("status");
            pan=request.getParameter("pan");
            type=request.getParameter("client_type");
            if(id.equals(""))
            {
                out.print("<h1>File No. is Mandatory</h1>");
            }
            else
            {
                try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            if(type.equals("p"))
            {
                st.execute("insert into client values('"+id+"','"+name+"','"+contact+"','"+address+"','"+status+"','"+pan+"')");
            }
            else if(type.equals("t"))
            {
                st.execute("insert into temp_client values('"+id+"','"+name+"','"+contact+"','"+address+"','"+status+"','"+pan+"')");
            }
            response.sendRedirect("add_user.jsp");
            }
             catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(add_user.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
