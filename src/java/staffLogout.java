
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class staffLogout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        request.getSession().removeAttribute("sfid");
        request.getSession().removeAttribute("vcid");
        
        response.sendRedirect("index.jsp");   
        
        }
    }

