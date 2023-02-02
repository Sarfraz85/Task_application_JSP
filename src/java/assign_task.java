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
@WebServlet(urlPatterns = {"/assign_task"})
public class assign_task extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try
            {
             HttpSession session = request.getSession();
            session.setAttribute("user",session.getAttribute("user"));
            String user=session.getAttribute("user").toString();   
            String task=session.getAttribute("task").toString();
            String filter=session.getAttribute("filter").toString();
            String uname=request.getParameter("item");
            out.print(task);
            out.print(uname);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            if(filter.equals("null"))
            {
                rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"\" ");
            }
            else
            {
                rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"\" and client_id = '"+filter+"' ");
            }
            String name;
            while(rs.next())
                    {
                        name=rs.getString("id");
                        out.print(name);
                        if(name.equals(task))
                        {
                            out.print(name);
                            st.executeUpdate("update tasks set assigned_to = '"+uname+"',status=\"assigned\" where id = '"+task+"'");
                            response.sendRedirect("task_master.jsp");
                        }
                    }
            
            }
            catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(reassign_task.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
