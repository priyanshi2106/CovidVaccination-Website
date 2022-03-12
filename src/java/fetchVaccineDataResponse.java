
import VMM.RDBMS_TO_JSON;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class fetchVaccineDataResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try 
        {
            String jsondata=new RDBMS_TO_JSON().generateJSON("select * from vaccines");
            out.println(jsondata);
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        
        
        }
    }

   