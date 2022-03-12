
<%@page import="java.sql.ResultSet"%>
<%@page import="VMM.DBLoader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- Basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- Site Metas -->
        <title>Life Care - Responsive HTML5 Multi Page Template</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/fevicon.ico.png" type="image/x-icon" />
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
                <!-- Colors CSS -->
        <link rel="stylesheet" href="css/colors.css">
        <!-- ALL VERSION CSS -->
        <link rel="stylesheet" href="css/versions.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">
        <!-- Modernizer for Portfolio -->
        <script src="js/modernizer.js"></script>
        <!-- [if lt IE 9] -->
        <script>
            function manageStaffLogic(vcid)
            {
                location.href="manageStaff.jsp?vcid="+vcid;
            }
            function manageVaccineDataLogic(vcid)
            {
                location.href="manageVaccineData.jsp?vcid="+vcid;
            }
        </script>
        
    </head>
    <body>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12" style="background-color: papayawhip;text-align: center">
                    <%
                        int vcid=Integer.parseInt(request.getParameter("id"));
                        ResultSet rs=DBLoader.executeSQl("select * from vaccinecenters where vcid=\'" + vcid+"\'");
                        if(rs.next())
                        {
                         String center_name=rs.getString("name");
                    %>
                    <h1 style="color:green">Welcome <%=center_name%></h1>
                    
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
                <div style="height:40px"></div>
                <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    
                   
                  
                    <button type="button" class="btn btn-info" style="margin:auto;display:block;" onclick="manageVaccineDataLogic(<%=vcid%>)">Manage Vaccine Data</button><br>
                    <button type="button" class="btn btn-info" style="margin:auto;display:block;" onclick="manageStaffLogic(<%=vcid%>)">Manage Staff</button>
                </div>
        </div>
        </div>
        
        
        
         <!-- end copyrights -->
      <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- all js files -->
      <script src="js/all.js"></script>
      <!-- all plugins -->
      <script src="js/custom.js"></script>
      <!-- map -->
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNUPWkb4Cjd7Wxo-T4uoUldFjoiUA1fJc&callback=myMap"></script>

    </body>
</html>
