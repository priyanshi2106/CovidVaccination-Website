
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class adminLoginResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try
        {
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            System.out.println(username);
            System.out.println(password);
            
            ResultSet rs=DBLoader.executeSQl("select * from admin where username=\'" + username + "\'and password=\'"+password+"\'");
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

  
