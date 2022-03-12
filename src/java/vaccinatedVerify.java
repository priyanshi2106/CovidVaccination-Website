
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;
import VMM.smssender;

public class vaccinatedVerify extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            int aid = Integer.parseInt(request.getParameter("aid"));
            
            
                    ResultSet rs = DBLoader.executeSQl("select * from appointments where aid=\'" + aid + "\'");
                    if (rs.next())
                    {
                        int mid = rs.getInt("mid");
                        
                        

                        ResultSet rs1 = DBLoader.executeSQl("select * from members where mid=\'" + mid + "\'");
                        if (rs1.next()) {
                            String phoneno = request.getParameter("phoneno");
                            int otp = ((int) (Math.random() * 9000) + 1000);
                            smssender.sendSMS("9878672400", "Your OTP is " + otp);
                            
                            request.getSession().setAttribute("otp", otp);

                            System.out.println(otp);

                            out.println("success");

                        }
                        

                    }
                
            }
         
           catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
