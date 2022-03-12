
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class deleteCenterResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            int vcid=Integer.parseInt(request.getParameter("vcid"));
            ResultSet rs=DBLoader.executeSQl("select * from vaccinecenters where vcid=\'"+vcid+"\'");
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

    