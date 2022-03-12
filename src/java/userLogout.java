
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class userLogout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        request.getSession().removeAttribute("phoneno");
        request.getSession().removeAttribute("name");
        
        response.sendRedirect("index.jsp");   
        
        }
    }

