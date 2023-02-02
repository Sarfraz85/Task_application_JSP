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
@WebServlet(urlPatterns = {"/search_client"})
public class search_client extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String search=request.getParameter("search");
            String client_type=request.getParameter("client_type");
            String search_type=request.getParameter("search_type");
            out.print(search);
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            out.print("pahuch gai");
            out.print(client_type);
            out.print(search_type);
            if(client_type.equals("t")&&search_type.equals("file"))
            {
                rs=st.executeQuery("select * from temp_client where id = '"+search+"' ");
                out.print("T File");
            }
            else if(client_type.equals("p")&&search_type.equals("file"))
            {
                rs=st.executeQuery("select * from client where id = '"+search+"' ");
                out.print("P File");
            }
            else if(client_type.equals("p")&& search_type.equals("name"))
            {
                rs=st.executeQuery("select * from client where name like '%"+search+"%' ");
                out.print("P Name");
            }
            else if(client_type.equals("t")&& search_type.equals("name"))
            {
                rs=st.executeQuery("select * from temp_client where name like '%"+search+"%' ");
                out.print("T Name");
            }
            else if(client_type.equals("p")&& search_type.equals("pan"))
            {
                rs=st.executeQuery("select * from client where pan like '%"+search+"%' ");
                out.print("P PAN");
            }
            else if(client_type.equals("t")&& search_type.equals("pan"))
            {
                rs=st.executeQuery("select * from temp_client where pan like '%"+search+"%' ");
                out.print("T PAN");
            }
            out.print("<table>");
            out.print("<thead>");
            out.print("<td style=\"font-weight: bold; width: 180px; font-family: Arial black;\">ID</td>");
            out.print("<td style=\"font-weight: bold; width: 180px; font-family: Arial black;\">Name</td>");
            out.print("<td style=\"font-weight: bold; width: 180px; font-family: Arial black;\">Contact</td>");
            out.print("<td style=\"font-weight: bold; width: 180px; font-family: Arial black;\">Address</td>");
            out.print("<td style=\"font-weight: bold; width: 180px; font-family: Arial black;\">Status</td>");
            out.print("<td style=\"font-weight: bold; width: 180px; font-family: Arial black;\">PAN</td>");
            out.print("</thead>");
            String name,id,address,pan,status,contact;
            while(rs.next())
            {
                id=rs.getString("id");
                name=rs.getString("name");
                contact=rs.getString("contact");
                address=rs.getString("address");
                status=rs.getString("status");
                pan=rs.getString("pan");
                out.print("<tr>");
                out.print("<td >"+id+"</td>");
                out.print("<td >"+name+"</td>");
                out.print("<td >"+contact+"</td>");
                out.print("<td >"+address+"</td>");
                out.print("<td >"+status+"</td>");
                out.print("<td >"+pan+"</td>");
                out.print("</tr>");
            }
            out.print("</table>");
            
            
        }   catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(delete_client.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
