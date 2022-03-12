
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class addStaffResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try
        {
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            int vcid=Integer.parseInt(request.getParameter("vcid"));
            ResultSet rs=DBLoader.executeSQl("select * from staff");
           if(rs.next())
           {
               rs.moveToInsertRow();
               rs.updateString("name", name);
               rs.updateString("password", password);
               rs.updateInt("vcid", vcid);
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

