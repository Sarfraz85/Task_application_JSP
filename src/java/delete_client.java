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
@WebServlet(urlPatterns = {"/delete_client"})
public class delete_client extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
                session.setAttribute("user",session.getAttribute("user"));
            String client=request.getParameter("client_id");
            String type=request.getParameter("type");
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            int flag=0;
            if(type.equals("t"))
            {
                flag=st.executeUpdate("update temp_client set activation_status = \"inactive\" where id='"+client+"'");
            }
            else if(type.equals("p"))
            {
                flag=st.executeUpdate("update client set activation_status = \"inactive\" where id='"+client+"'");
            }
            if(flag==0)
            {
            request.setAttribute("message", "Client NOT found");
                RequestDispatcher dispatcher = request.getRequestDispatcher("del_client.jsp");
                dispatcher.forward(request, response);
            }
            else
            {
                st.executeUpdate("update tasks set status =\"hold\" where client_id = '"+client+"' and client_type='"+type+"' ");
            request.setAttribute("message", "Client "+client+" Successfuly Deactivated");
                RequestDispatcher dispatcher = request.getRequestDispatcher("task_master.jsp");
                dispatcher.forward(request, response);
            }
        }   catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(delete_client.class.getName()).log(Level.SEVERE, null, ex);
            }}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
