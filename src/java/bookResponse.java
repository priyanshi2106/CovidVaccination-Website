
import VMM.DBLoader;
import java.io.*;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

import javax.servlet.*;
import javax.servlet.http.*;

public class bookResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {

            int mid = Integer.parseInt(request.getParameter("mid"));
            int vcid = Integer.parseInt(request.getParameter("vcid"));
            int vid = Integer.parseInt(request.getParameter("vid"));
            String time = request.getParameter("time");
            String date = request.getParameter("date");
            System.out.println(date);
            System.out.println(time);
            LocalDate today = LocalDate.now();
            String date1 = today.toString();
            System.out.println(date1);
            System.out.println(vcid);
            System.out.println(mid);

            ResultSet rs = DBLoader.executeSQl("select * from appointments where status='pending' and mid=" + mid + " and date>=\'" + date1 + "\'");

            if (rs.next())
            {
                out.println("failed");
            } 
            else
            {
                ResultSet rs1=DBLoader.executeSQl("select * from vaccines where vid=\'"+vid+"\'");
                if(rs1.next())
                {
                    int qty=rs1.getInt("qty");
                    int ans=qty-1;
                    rs1.updateInt("qty",ans);
                    rs1.updateRow();
                }
                rs.moveToInsertRow();
                rs.updateInt("mid", mid);
                rs.updateInt("vcid", vcid);
                rs.updateInt("vid", vid);
                rs.updateString("date", date);
                rs.updateString("time", time);
                rs.updateString("status", "pending");

                rs.insertRow();
                out.println("success");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
