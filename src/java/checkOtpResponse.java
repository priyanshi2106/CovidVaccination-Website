
import VMM.FileUploader;
import VMM.DBLoader;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class checkOtpResponse extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       try
       {
        int otp=Integer.parseInt(request.getParameter("otp"));
        String phoneno=request.getParameter("phoneno");
        if(request.getSession().getAttribute("otp").toString()!="")
        {
            int sotp=Integer.parseInt(request.getSession().getAttribute("otp").toString());
            System.out.println(sotp);
            if(sotp==otp)
            {
                 ResultSet rs= DBLoader.executeSQl("select * from users where phoneno=\'"+phoneno+"\'");
                 if(rs.next())
                 {
                     rs.updateString("status", "verified");
                     rs.updateRow();
                     out.println("success");
                 }
                 else
                 {
                     out.println("failed");
                 }
            }
            else
            {
                out.println("not in session");
            }
        }

       }
        
       
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
    }
}
