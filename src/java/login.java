/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sarfraz Ahmad
 */
@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           try
           {
            HttpSession session = request.getSession();
            session.setAttribute("user",request.getParameter("user"));
            String user=request.getParameter("user");
            String pass=request.getParameter("pass");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from account");
            int flag=0;
            while(rs.next())
            {
            if(user.equals(rs.getString("username")) && pass.equals(rs.getString("password")) && rs.getString("status").equals("active"))
            {
                flag=1;
                if((rs.getString("desig").equals("master")))
                {
                    response.sendRedirect("task_master.jsp");
                }
                else
                {
                    response.sendRedirect("task_slave.jsp");
                }
            }
            }
            if(flag==0)
            {
                //out.print("<h1> Wrong Username or Password</h1>");
                request.setAttribute("message", "Wrong Username or password");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
                
            }
           } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
