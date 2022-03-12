
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;
public class cancelAppointment extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try
        {
            int aid=Integer.parseInt(request.getParameter("aid"));
            ResultSet rs=DBLoader.executeSQl("select * from appointments where aid=\'" + aid + "\'");
            if(rs.next())
            {
                String status1="Cancelled";
                
               
                rs.updateString("status",status1);
                
                rs.updateRow();
                
                out.println("success");

            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        }
    }
