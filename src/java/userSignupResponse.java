
import VMM.FileUploader;
import VMM.DBLoader;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import VMM.smssender;

@MultipartConfig
public class userSignupResponse extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       try
       {
        String phoneno=request.getParameter("phoneno");
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        
        Part p1=request.getPart("f1");
        String relpath = "myuploads";
        String abspath = getServletContext().getRealPath("/"+relpath);
        String new_file_name = System.currentTimeMillis()+"-"+p1.getSubmittedFileName();
        
        String ans1=FileUploader.savefileonserver(p1, abspath, new_file_name);
        
        ResultSet rs= DBLoader.executeSQl("select * from users where phoneno=\'"+phoneno+"\'");
        
        if(rs.next())
        {
            out.println("failed");
           // response.sendRedirect("signup.jsp?msg=This Phone Number already exists");
        }
        else
        {
            rs.moveToInsertRow();
                
                rs.updateString("phoneno", phoneno);
                rs.updateString("name", name);
                rs.updateString("password",password);
                rs.updateString("photo",relpath+"/"+new_file_name);
                
                rs.insertRow();
                
                int otp =((int)(Math.random()*9000)+1000);
                smssender.sendSMS("9878672400", "Your OTP is "+otp);
                request.getSession().setAttribute("otp", otp);
                System.out.println(otp);
                
                out.println("Success");
              
               

        }
        
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
    }
}
