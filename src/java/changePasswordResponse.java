
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;


public class changePasswordResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         try
         {
             String oldpassword=request.getParameter("oldpassword");
             String newpassword=request.getParameter("newpassword");
             
             String phoneno=request.getSession().getAttribute("phoneno").toString();
             
             ResultSet rs=DBLoader.executeSQl("select * from users where phoneno='"+phoneno+"' and password='"+oldpassword+"'");
             if(rs.next())
             {
                 rs.updateString("password", newpassword);
                     rs.updateRow();
                     request.getSession().removeAttribute("phoneno");
                     request.getSession().removeAttribute("name");
                     out.println("success");
             }
             
         }
         catch(Exception ex)
         {
             ex.printStackTrace();
         }
        }
    }
