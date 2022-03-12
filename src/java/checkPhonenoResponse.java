
import VMM.*;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class checkPhonenoResponse extends HttpServlet 
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         
        try
        {
            String phoneno=request.getParameter("phoneno");
            ResultSet rs=DBLoader.executeSQl("select * from users where phoneno=\'"+phoneno+"\'");
            if(rs.next())
            {
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


