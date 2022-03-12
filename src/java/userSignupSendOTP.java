
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import VMM.smssender;
public class userSignupSendOTP extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         try
         {
             String phoneno=request.getParameter("phoneno");
              int otp =((int)(Math.random()*9000)+1000);
              smssender.sendSMS("9878672400", "Your OTP is "+otp);
                request.getSession().setAttribute("otp", otp);
                System.out.println(otp);
                
                out.println("success");

         }
         catch(Exception ex)
         {
             ex.printStackTrace();
         }
        
        }
    }

