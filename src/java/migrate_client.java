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

/**
 *
 * @author Sarfraz Ahmad
 */
@WebServlet(urlPatterns = {"/migrate_client"})
public class migrate_client extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String temp_client=request.getParameter("mig_client_id");
           String per_client=request.getParameter("mig_to_client_id");
          try
          {
              Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Connection con4=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            Statement sr=con2.createStatement();
            Statement su=con3.createStatement();
            Statement sv=con4.createStatement();
            out.print("Donebvjksdbv");
            ResultSet rs=sr.executeQuery("select * from temp_client where id = '"+temp_client+"' ");
            out.print("Done 3");
            rs.next();
            out.print("Done 4");
            String name,contact,address,pan,type,status;
            name=rs.getString("name");
            contact=rs.getString("contact");
            address=rs.getString("address");
            status=rs.getString("status");
            pan=rs.getString("pan");
            out.print("Done 5");
            st.executeUpdate("insert into client values('"+per_client+"','"+name+"','"+contact+"','"+address+"','"+status+"','"+pan+"')");
            out.print("Done 6");
            su.executeUpdate("update tasks set client_id = '"+per_client+"', client_type = \"p\" where client_id ='"+temp_client+"' and client_type=\"t\" ");
            out.print("Done 7");
            sv.execute("delete from temp_client where id='"+temp_client+"' ");
            out.print("Done");
            response.sendRedirect("task_master.jsp");
            
            
          } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(migrate_client.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
