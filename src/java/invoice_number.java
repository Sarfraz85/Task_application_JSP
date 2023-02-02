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
@WebServlet(urlPatterns = {"/invoice_number"})
public class invoice_number extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            session.setAttribute("user",session.getAttribute("user"));
            String user=session.getAttribute("user").toString();
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from invoices where rel_date = \"\" ");
            String invoice=null;
            out.print(user);
            int i=0;
            while(rs.next())
            {
            out.print(i);
            if(null!=request.getParameter("id"+i+""))
            {
                invoice=rs.getString("invoice");
            }
            i=i+1;
            }
            session.setAttribute("invoice_num", invoice);
            response.sendRedirect("billing_history_view.jsp");
            
            
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(Hold_task.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
