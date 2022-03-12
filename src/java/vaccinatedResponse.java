
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class vaccinatedResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try 
        {
            int aid = Integer.parseInt(request.getParameter("aid"));
            int uotp = Integer.parseInt(request.getParameter("uotp"));
            int sfid = Integer.parseInt(request.getSession().getAttribute("sfid").toString());
            if (request.getSession().getAttribute("otp").toString() != "") 
            {
                int otp = Integer.parseInt(request.getSession().getAttribute("otp").toString());
                if (otp == uotp)
                {
                    ResultSet rs3 = DBLoader.executeSQl("select * from staff where sfid=\'" + sfid + "\'");
                    {
                        if (rs3.next())
                        {
                            String name = rs3.getString("name");
                            ResultSet rs = DBLoader.executeSQl("select * from appointments where aid=\'" + aid + "\'");
                            if (rs.next()) 
                            {

                                int mid = rs.getInt("mid");
                                int vid = rs.getInt("vid");
                                rs.updateString("status", "completed");
                                rs.updateString("vaccinatedby", name);
                                rs.updateRow();
                                ResultSet rs2 = DBLoader.executeSQl("select * from vaccines where vid=\'" + vid + "\'");
                                if (rs2.next()) {
                                    int doses = rs2.getInt("doses");
                                    ResultSet rs1 = DBLoader.executeSQl("select * from members where mid=\'" + mid + "\'");
                                    {
                                        if (rs1.next()) {
                                            String status = rs1.getString("status");
                                            if (status.equals("not vaccinated")) {
                                                rs1.updateString("status", "Vaccinated");
                                                rs1.updateString("shots", doses + "");
                                                rs1.updateString("shot1", "Done");
                                                rs1.updateRow();
                                            } else {
                                                rs1.updateString("shot2", "Done");
                                                rs1.updateRow();
                                            }
                                            out.println("success");
                                        } else {
                                            out.println("failed");
                                        }
                                    }
                                }

                            }
                        } 
                    }
                }
            }
            else
            {
                out.println("not in session");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
