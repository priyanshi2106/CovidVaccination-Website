
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class staffLoginResponse extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try
        {
           int id=Integer.parseInt(request.getParameter("id"));
           String password=request.getParameter("password");
           System.out.println(id);
           System.out.println(password);
           ResultSet rs=DBLoader.executeSQl("select * from staff where sfid=\'" + id + "\'and password=\'"+password+"\'");
           if (rs.next())
           {
               int vcid=rs.getInt("vcid");
               request.getSession().setAttribute("sfid",id);
               request.getSession().setAttribute("vcid",vcid);
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
