
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;
public class deleteVaccineDataResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try
        {
            int vid=Integer.parseInt(request.getParameter("vid"));
            ResultSet rs=DBLoader.executeSQl("select * from vaccines where vid=\'"+vid+"\'");
            if(rs.next())
            {
                rs.deleteRow();
                out.println("success");
            }
            else
            {
                out.println("fail");
            }
            
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        
        }
    }

