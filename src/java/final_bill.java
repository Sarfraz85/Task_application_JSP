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
@WebServlet(urlPatterns = {"/final_bill"})
public class final_bill extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            session.setAttribute("user",session.getAttribute("user"));
            String user=session.getAttribute("user").toString();
            String invoice=session.getAttribute("invoice_num").toString();
            String method=request.getParameter("type");
            try{
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement sr=con2.createStatement();
            st.executeUpdate("update invoices set method = '"+method+"', rel_date = curdate() where invoice = '"+invoice+"' ");
            sr.executeUpdate("update tasks set status = \"billed\" where invoice = '"+invoice+"' ");
            response.sendRedirect("billing_history.jsp");
            
            } catch (SQLException ex) {
                Logger.getLogger(final_bill.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
