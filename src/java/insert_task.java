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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(urlPatterns = {"/insert_task"})
public class insert_task extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try
            {
            HttpSession session = request.getSession();
            String task_name=request.getParameter("tname");
            String due_date=request.getParameter("duedate");
            String id=request.getParameter("client_id");
            String asign=request.getParameter("item");
            String client_type=request.getParameter("client_type");
            String remark=request.getParameter("remark");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kalp","root","");
            Statement st=con.createStatement();
            ResultSet rs=null;
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = df.format(new Date());
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date da=formatter.parse(due_date);
            String formattedDate2= df.format(da);
            Date str=formatter.parse(formattedDate2);
            Date str2=formatter.parse(formattedDate);
            if(str.after(str2)||str.equals(str2)) 
            {    
            String red=null;
            out.print(asign);
            out.print(" "+client_type);
            String status;
            if(asign.isEmpty())
            {
                status="";
                red="task_unassigned.jsp";
            }
            else
            {
                status="assigned";
                red="task_master.jsp";
            }
            out.print(status);
            String creator=session.getAttribute("username").toString();
            out.print(creator);
            
            
            if(client_type.equals("t"))
            {
                rs=st.executeQuery("select * from temp_client");
            }
            else
            {
                rs=st.executeQuery("select * from client");
            }
            
            String client_id,check;
            out.print(id);
            int flag=0;
            while(rs.next())
            {
                client_id=rs.getString("id");
                if(id.equals(client_id))
                {
                    flag=1;
                    check=rs.getString("activation_status");
                    if(check.equals("active"))
                    {
            st.execute("insert into tasks values(curdate(),'"+creator+"','"+task_name+"','"+due_date+"','"+asign+"','"+status+"','"+id+"','"+client_type+"','',NULL,'"+remark+"')");
            out.print("done");
            flag=2;
            response.sendRedirect(red);
            break;
                }
                }
            }
            if(flag==0)
            {
                out.print("<h2>Client ID not found</h2>");
            }
            else if(flag==1)
            {
                out.print("<h2>Client Deactive<h2>");
            }
            }
            else 
            {
                out.print("<h1>Due Date Cannot come before current date</h1>");
            }
            
                
                
            } catch (ClassNotFoundException | SQLException | ParseException ex) {
                Logger.getLogger(insert_task.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
