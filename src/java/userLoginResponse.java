
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class userLoginResponse extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String phoneno=request.getParameter("phoneno");
            String password=request.getParameter("password");
            ResultSet rs= DBLoader.executeSQl("select * from users where phoneno="+phoneno);
            
            if(rs.next())
            {
                String dpassword=rs.getString("password");
                String status=rs.getString("status");
                String name=rs.getString("name");
                if(status.equals("verified"))
                {
                    if(password.equals(dpassword))
                    {
                        request.getSession().setAttribute("phoneno", phoneno);
                        request.getSession().setAttribute("name", name);
                        out.println("success");
                    }
                    else
                    {
                         out.println("fail");
                    }
                }
                else
                {
                    out.println("not verified");
                }
            }
            else
            {
                out.println("invalid phoneno");
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        }
    }

