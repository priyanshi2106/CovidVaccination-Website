
import VMM.DBLoader;
import java.io.*;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;
public class addVaccineDataResponse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         try
       {
           String vacname=request.getParameter("vacname");
           String date=request.getParameter("date");
           int agelimit=Integer.parseInt(request.getParameter("agelimit"));
           int qty=Integer.parseInt(request.getParameter("qty"));
           int doses=Integer.parseInt(request.getParameter("doses"));
           int price=Integer.parseInt(request.getParameter("price"));
           int vcid=Integer.parseInt(request.getParameter("vcid"));
           ResultSet rs=DBLoader.executeSQl("select * from vaccines");
           if(rs.next())
           {
               rs.moveToInsertRow();
               rs.updateString("vacname", vacname);
               rs.updateString("date", date);
               rs.updateInt("agelimit", agelimit);
               rs.updateInt("qty", qty);
               rs.updateInt("doses", doses);
               rs.updateInt("price", price);
               rs.updateInt("vcid", vcid);
               rs.insertRow();
               
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

