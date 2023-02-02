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
@WebServlet(urlPatterns = {"/for_realization"})
public class for_realization extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           HttpSession session = request.getSession();
            session.setAttribute("user",session.getAttribute("user"));
            try{
            String user=session.getAttribute("user").toString();
            String filter=session.getAttribute("filter").toString();
            int j=Integer.parseInt(session.getAttribute("index").toString());
            int amount=Integer.parseInt(request.getParameter("amount"));
            String invoice=request.getParameter("invoice");
            String company=request.getParameter("company");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            Statement sr=con2.createStatement();
            ResultSet rs=null;
            ResultSet rt=sr.executeQuery("select invoice from invoices where invoice='"+invoice+"' ");
            if(rt.next()==false)
            {
            if(filter.equals("null"))
            {
               rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"pending bill\" ");
            }
            else
            {
                rs=st.executeQuery("select * from tasks where creator = '"+user+"' and status = \"pending bill\" and client_id = '"+filter+"' ");
            }
            String task;
            int i=0;
            sr.executeUpdate("insert into invoices values('"+invoice+"',curdate(),'','"+amount+"','','"+company+"')");
            while(rs.next())
            {
                if(i<=j)
                {
                    task=rs.getString("id");
                    out.print("<br>"+task);
                    if(task.equals(request.getParameter("id"+i+"")))
                    {
                        //st.executeUpdate("update tasks set status = \"for_realization\", invoice = '"+invoice+"' where id = '"+task+"' ");
                        st.addBatch("update tasks set status = \"for_realization\", invoice = '"+invoice+"' where id = '"+task+"'");
                        i=i+1;
                        
                    }
                }
            }
            st.executeBatch();
            }
            else
            {
                request.setAttribute("message", "Invoice Number Exists");
                RequestDispatcher dispatcher = request.getRequestDispatcher("task_bill.jsp");
                dispatcher.forward(request, response);
            }
            response.sendRedirect("billing_history.jsp");
            
        }   catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(for_realization.class.getName()).log(Level.SEVERE, null, ex);
            }  }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
