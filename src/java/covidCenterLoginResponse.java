
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class covidCenterLoginResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         try
        {
            String id=request.getParameter("id");
            String password=request.getParameter("password");
            System.out.println(id);
            System.out.println(password);
            
            ResultSet rs=DBLoader.executeSQl("select * from vaccinecenters where vcid=\'" + id + "\'and password=\'"+password+"\'");
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
