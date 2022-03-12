
import VMM.RDBMS_TO_JSON;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class fetchCovidCenterResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        try 
        {
            String jsondata=new RDBMS_TO_JSON().generateJSON("select * from vaccinecenters");
            out.println(jsondata);
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        
        
        }
    }

    
