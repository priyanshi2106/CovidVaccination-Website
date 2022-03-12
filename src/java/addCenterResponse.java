
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;


public class addCenterResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       
       try
       {
           String name=request.getParameter("name");
           String email=request.getParameter("email");
           String phoneno=request.getParameter("phoneno");
           String address=request.getParameter("address");
           String city=request.getParameter("city");
           String password=request.getParameter("password");
           ResultSet rs=DBLoader.executeSQl("select * from vaccinecenters");
           if(rs.next())
           {
               rs.moveToInsertRow();
               rs.updateString("name", name);
               rs.updateString("email", email);
               rs.updateString("phoneno", phoneno);
               rs.updateString("address", address);
               rs.updateString("city", city);
               rs.updateString("password", password);
               rs.insertRow();
               
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

