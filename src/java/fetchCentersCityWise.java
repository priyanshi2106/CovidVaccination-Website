import VMM.RDBMS_TO_JSON;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
public class fetchCentersCityWise extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try
        {
            String city=request.getParameter("city");
            String jsondata=new RDBMS_TO_JSON().generateJSON("select * from vaccinecenters where city=\'"+city+"\'");
            out.println(jsondata);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
    }
}
