
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class deleteStaffResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       try
        {
            int sfid=Integer.parseInt(request.getParameter("sfid"));
            System.out.println(sfid);
            ResultSet rs=DBLoader.executeSQl("select * from staff where sfid=\'"+sfid+"\'");
            if(rs.next())
            {
                rs.deleteRow();
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

    