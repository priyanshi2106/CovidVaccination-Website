
import VMM.DBLoader;
import VMM.FileUploader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class addMemberLogic extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try
        {
            String name=request.getParameter("name");
            String prooftype=request.getParameter("prooftype");
            String proofno=request.getParameter("proofno");
            int age =Integer.parseInt( request.getParameter("age"));
            String gender=request.getParameter("gender");
        
           Part p1=request.getPart("f1");
           String relpath = "myuploads";
           String abspath = getServletContext().getRealPath("/"+relpath);
           String new_file_name = System.currentTimeMillis()+"-"+p1.getSubmittedFileName();
        
           String ans1=FileUploader.savefileonserver(p1, abspath, new_file_name);
        
           ResultSet rs= DBLoader.executeSQl("select * from members where proofno=\'"+proofno+"\'");
           if(rs.next())
           {
               out.println("failed");
           }
           else
           {
               rs.moveToInsertRow();
                
                rs.updateString("name", name);
                rs.updateString("prooftype", prooftype);
                rs.updateString("proofno",proofno);
                rs.updateString("gender", gender);
                rs.updateInt("age",age);
                String phoneno=request.getSession().getAttribute("phoneno").toString();
                rs.updateString("phoneno",phoneno);
                rs.updateString("photo",relpath+"/"+new_file_name);
                
                rs.insertRow();
            
               out.println("success");
           }
        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
