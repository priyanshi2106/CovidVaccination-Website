
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
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
        <link rel="stylesheet" href="style.css">
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
        <style>
            #d1
            {
                border-radius: 25px;
                border: 2px solid green;
                padding: 20px;
            }
        </style>

        <script>
            function staffLogoutLogic()
            {
                location.href = "./stafflogout";
            }
            function vaccinatedLogic(aid)
            {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {

                        var res = this.responseText;
                        res = res.trim();
                        alert(res);
                        if (res == "success")
                        {

                            location.href = "verifyOTP.jsp?aid=" + aid;

                        }

                    }
                };
                xhttp.open("GET", "./vaccinatedVerify?aid=" + aid, true);
                xhttp.send();
            }
        </script>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">

                <div class="col-sm-12" style="background-color:papayawhip">
                    <div class="row">
                        <div class="col-sm-6">

                            <%
                                try {

                                    int vcid = Integer.parseInt(request.getSession().getAttribute("vcid").toString());

                                    ResultSet rs = DBLoader.executeSQl("select * from vaccinecenters where vcid=\'" + vcid + "\'");

                                    if (rs.next()) {
                                        String center_name = rs.getString("name");
                                        System.out.println(center_name);
                            %>
                            <h3 style="fluid:left">Center Name: <%=center_name%></h3>

                            <%
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                        </div>

                        <div class="col-sm-6">

                            <%   try {
                                    int sfid = Integer.parseInt(request.getSession().getAttribute("sfid").toString());
                                    ResultSet rs = DBLoader.executeSQl("select * from staff where sfid=\'" + sfid + "\'");
                                    if (rs.next()) {
                                        String staff_name = rs.getString("name");
                            %>


                            <h3 style="text-align: right"> Welcome <%=staff_name%></h3>



                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }

                            %>

                        </div>
                    </div>
                </div>
            </div></div>

        <div class="container-fluid">
            <div class="row">

                <div class="col-sm-12" style="background-color:pink">
                    <div class="row">
                        <div class="col-sm-6">


                        </div>

                        <div class="col-sm-6">

                            <button type="button" class="btn btn-info" style="position: absolute;
                                    right: 10px;
                                    top: 5px"  onclick="staffLogoutLogic()">Logout</button>
                        </div>
                    </div>
                </div>
            </div></div>
        <div style="height:50px "></div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h3 style='color:green;text-align: center'>Today's Appointments</h3>
                </div>
            </div>
        </div>
        <div style="height:50px "></div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-1">

                        </div>
                        <div class="col-sm-10" style="background-color:papayawhip" id="d1">
                            <%                                                    try {
                                    int vcid = Integer.parseInt(request.getSession().getAttribute("vcid").toString());
                                    int sfid = Integer.parseInt(request.getSession().getAttribute("sfid").toString());
                                    LocalDate today = LocalDate.now();
                                    String date1 = today.toString();
                                    ResultSet rs = DBLoader.executeSQl("select * from appointments where vcid=\'" + vcid + "\' and date =\'" + date1 + "\'");
                                    while (rs.next()) {
                                        int aid = rs.getInt("aid");
                                        int vid = rs.getInt("vid");
                                        String status = rs.getString("status");
                                        String time = rs.getString("time");
                                        int mid = rs.getInt("mid");
                            %>
                            <div class="row">
                                <div class="col-sm-5">
                                    <h4 style="text-align: left">Appointment No: <%= aid%></h4>
                                </div>
                                <div class="col-sm-5">
                                    <h4 style="text-align: right">Time: <%= time%></h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-10" style="background-color:whitesmoke">
                                    <%
                                        ResultSet rs1 = DBLoader.executeSQl("select * from vaccines where vid=\'" + vid + "\'");
                                        if (rs1.next()) {
                                            String name1 = rs1.getString("vacname");
                                            int doses = rs1.getInt("doses");
                                            System.out.println(name1);
                                    %>
                                    <div class="row">

                                        <div class="col-sm-5">


                                            <h4 style="text-align: left">Vaccine Name: <%=name1%></h4>



                                        </div>
                                        <div class="col-sm-5">

                                            <h4  style="text-align: right">Doses: <%=doses%></h4>

                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-10" style="background-color: papayawhip">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <%
                                                System.out.println(mid);
                                                System.out.println("Priyanshi");
                                                ResultSet rs3 = DBLoader.executeSQl("select * from members where mid=\'" + mid + "\'");
                                                if (rs3.next()) {
                                                    String member_name = rs3.getString("name");
                                                    int year = rs3.getInt("age");
                                                    Date d = new Date();
                                                    int year1 = d.getYear();
                                                    int currentYear = year1 + 1900;

                                                    int age1 = currentYear - year;
                                                    System.out.println(age1);
                                            %>
                                            <h4 style="text-align:left">Member's Name: <%=member_name%></h4>
                                            <h4 style="text-align:left">Age: <%=age1%></h4>
                                            <%
                                                }
                                            %>
                                        </div>
                                        <div class="col-sm-4">
                                            <%
                                                System.out.println(mid);
                                                System.out.println("sharma");
                                                ResultSet rs4 = DBLoader.executeSQl("select * from members where mid=\'" + mid + "\'");
                                                if (rs4.next()) {
                                                    String prooftype = rs4.getString("prooftype");
                                                    String proofno = rs4.getString("proofno");


                                            %>
                                            <h4 style="text-align:left">Proof Type: <%=prooftype%></h4>
                                            <h4 style="text-align:left">Proof No: <%=proofno%></h4>
                                            <%
                                                }
                                            %>

                                        </div>
                                        <div class="col-sm-2">

                                            <div class="row">

                                                <div class="col-sm-1">

                                                </div>
                                                <div class="col-sm-1">
                                                    <%
                                                        if (status.equals("completed")) {
                                                    %>
                                                    <button type="button" class="btn btn-info" style="position: absolute;
                                                            left: 165px;
                                                            top: 5px" disabled="true">Vaccinated</button>
                                                    <%
                                                    } else if (status.equals("Cancelled")) 
                                                     {
                                                    %>
                                                    <button type="button" class="btn btn-info" style="position: absolute;
                                                            left: 165px;
                                                            top: 5px" disabled="true">Cancelled</button>
                                                    
                                                    <%
                                                    }
                                                    else {

                                                    %>
                                                    <button type="button" class="btn btn-info" style="position: absolute;
                                                            left: 165px;
                                                            top: 5px" onclick="vaccinatedLogic(<%=aid%>)">Vaccinated</button>
                                                    <%
                                                        }
                                                    %>

                                                </div>
                                            </div>
                                        </div>  
                                    </div>

                                </div>

                                <%
                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>
                            </div>
                            <div class="col-sm-1">

                            </div>
                        </div>
                    </div>
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
