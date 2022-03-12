
<%@page import="java.time.Year"%>
<%@page import="java.time.temporal.ChronoField"%>
<%@page import="java.time.format.DateTimeFormatterBuilder"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="VMM.DBLoader"%>
<!DOCTYPE html>
<html lang="en">
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
        #d3{
            border-radius: 25px;
            border: 2px solid green;
            padding: 20px;
        }
        #d4
        {
            text-align: right;
            float: right;
        }
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /* Float four columns side by side */
        .column {
            float: left;
            width: 25%;
            padding: 0 10px;
        }

        /* Remove extra left and right margins, due to padding */
        .row {margin: 0 -5px;}

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Responsive columns */
        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
                display: block;
                margin-bottom: 20px;
            }
        }

        /* Style the counter cards */
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 16px;
            text-align: center;
            background-color: #f1f1f1;
        }
        .vl {
            border-left: 6px solid green;
            height: 500px;
            position: absolute;
            left: 50%;
            margin-left: -3px;
            top: 0;
        }

    </style> 
    <script>
        function bookLogic(mid, vcid, vid, date)
        {
            var time = document.getElementById("time").value;
           //alert(mid);
           //alert(vcid+"vcid");
           //alert(date);
            var xhttp = new XMLHttpRequest();
             //alert(date);
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var res = this.responseText;
                    res = res.trim();
                    console.log(res);
                    alert(res);
                    if (res == "success")
                    {
                        document.getElementById("finalresponse").innerHTML = "Appointment Booked Successfuly";
                        location.href = "viewMembers.jsp?vcid="+vcid+"&mid="+mid;
                    } else
                    {
                        document.getElementById("finalresponse").innerHTML = "Appointment already booked";
                    }
                }
            };

            xhttp.open("GET", "./bookResponse?vcid=" + vcid + "&mid=" + mid + "&vid=" + vid + "&time=" + time + "&date=" + date, true);
            xhttp.send();
        }
    </script>


</head>


<body class="clinic_version">
    <!-- LOADER -->
    <div id="preloader">
        <img class="preloader" src="images/loaders/heart-loading2.gif" alt="">
    </div>
    <!-- END LOADER -->
    <header>
        <div class="header-top wow fadeIn">
            <div class="container">
                <a class="navbar-brand" href="index.jsp"><img src="images/covid_logo.PNG" alt="image"></a>
                <div class="right-header">
                    <div class="header-info">
                        <div class="info-inner">
                            <span class="icontop"><img src="images/phone-icon.png" alt="#"></span>
                            <span class="iconcont"><a href="tel:9878672400">9878672400</a></span>	
                        </div>
                        <div class="info-inner">
                            <span class="icontop"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                            <span class="iconcont"><a data-scroll href="mailto:info@yoursite.com">info@Covidcare.com</a></span>	
                        </div>
                        <div class="info-inner">
                            <span class="icontop"><i class="fa fa-clock-o" aria-hidden="true"></i></span>
                            <span class="iconcont"><a data-scroll href="#">Daily: 7:00am - 8:00pm</a></span>	
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="header-bottom wow fadeIn">
            <div class="container">
                <nav class="main-menu">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i class="fa fa-bars" aria-hidden="true"></i></button>
                    </div>

                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a class="active" href="index.jsp">Home</a></li>
                            <li><a data-scroll href="index.jsp">About us</a></li>
                            <li><a data-scroll href="index.jsp">Services</a></li>
                            <li><a data-scroll href="index.jsp">Doctors</a></li>
                            
                            <li><a data-scroll href="#getintouch">Contact</a></li>
                        </ul>
                    </div>
                </nav>
                
            </div>
        </div>
    </header>

    <div style="height:200px"></div>
    <div style="height:500px ">
        <div id="d1" class="container-fluid">
            <%
                String name = request.getSession().getAttribute("name").toString();

            %>
            <h3 style="color: blue;text-align: center" class="jumbotron">Hello <%=name%></h3>
            <br>
            <br>
            <br>


        </div>
        <div class="row">
            <div  class="container-fluid col-lg-1">

            </div>
            <div class="container-fluid col-lg-10" id="d3" style="background-color:powderblue">
                <h2 style="text-align:center;color:green">Center Information</h2>
                <hr>
                <br>
                <div class="row">
                    <div  class="container-fluid col-lg-5">
                        <%
                            try {
                                String vcid = request.getParameter("vcid");
                                ResultSet rs = DBLoader.executeSQl("select * from vaccinecenters where vcid=\'" + vcid + "\'");
                                if (rs.next()) {
                                    String center_name = rs.getString("name");

                                    String phoneno = rs.getString("phoneno");

                        %>
                        <h3>Center Name: <%=center_name%></h3>
                        <h3>Phone no: <%=phoneno%></h3>

                    </div>
                    <div class="container-fluid col-lg-5" id="d4">
                        <%
                            String email = rs.getString("email");
                            String address = rs.getString("address");
                        %>
                        <h3>Email: <%=email%></h3>
                        <h3>Address: <%=address%></h3>
                        <%
                            }

                        %>

                    </div>

                </div>
                <%                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                %>

            </div>
            <div class="container-fluid col-lg-1">

            </div>
        </div>
        <br>
        <br>
        <h2 style="text-align:center;color:green" >Choose Day</h2>

        <div class="row">
            <div class="container-fluid col-lg-1">

            </div>
            <div class="container-fluid col-lg-10">
                <%
                    String nextDate = "";
                    String curDate = "";
                    try {
                        LocalDate date = LocalDate.now();
                        date = date.plusDays(1);
                        String nextDate1 = date.toString();
                        System.out.println("hiii");

                        System.out.println("yooo");
                        int vcid = Integer.parseInt(request.getParameter("vcid"));
                        ResultSet rs2 = DBLoader.executeSQl("select * from vaccines where vcid=\'" + vcid + "\' and date >=\'" + nextDate1 + "\'");

                        while (rs2.next()) {
                            String vdate = rs2.getString("date");
                            int dose = rs2.getInt("doses");
                            int agelimit = rs2.getInt("agelimit");
                            int qty = rs2.getInt("qty");
                            String vacname = rs2.getString("vacname");
                %>
                <div class="column" >
                    <div class="card" style="background-color:papayawhip" >
                        <h3 style="color: green"><%=vacname%></h3>
                        <h4 style="color: black" id="date"><%=vdate%></h4>

                        <div class="row">
                            <div class="col-sm-5">
                                <h5 id="doses" >Doses: <%=dose%></h5>


                            </div>
                            <div class="col-sm-5">
                                <h5>AgeLimit:<%=agelimit%>+</h5>
                            </div>


                        </div>
                        <%
                            String mid = request.getParameter("mid");
                            ResultSet rs3 = DBLoader.executeSQl("select * from members where mid=\'" + mid + "\'");
                            if (rs3.next()) {
                                int age = rs3.getInt("age");
                                Date d = new Date();
                                int year = d.getYear();
                                int currentYear = year + 1900;

                                int age1 = currentYear - age;
                                System.out.println(age1);
                             
                                
                                if (age1 >= agelimit)
                                {
                        %>
                                    <button type="button" class="btn btn-primary" style="width: 200px" data-toggle="modal" data-target="#myModal">+ View</button>
                        <%
                         }
                          else if(qty==0)
                          {
                        %>
                        <h5 style="color:blue">No more Vaccines Available.</h5>
                        <%
                           }
                          else
                        {
                        %>
                                   <h5 style="color:blue">This is only available for<%=agelimit%></h5>
                        <%
                                }

                            }

                        %>



                    </div>
                </div>
                <%                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                %>

            </div>
            <div class="container-fluid col-lg-1">

            </div>

        </div>

    </div>

    <div id="finalresponse" style="text-align:center; color: blue">

    </div>




    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">Book Appointment</h3>


                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <%
                        
                        String vcid = request.getParameter("vcid");
                        try {
                            ResultSet rs = DBLoader.executeSQl("select * from vaccinecenters where vcid=\'" + vcid + "\'");
                            if (rs.next()) {
                                String center_name = rs.getString("name");
                    %>
                    <h5>Center Name: <%=center_name%></h5>
                    <%

                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }


                    %>
                    <%  
                         String vdate="";
                        try {
                         LocalDate date = LocalDate.now();
                        date = date.plusDays(1);
                        String nextDate1 = date.toString();
                        System.out.println("hiii");

                        System.out.println("yooo");
                    
                        ResultSet rs2 = DBLoader.executeSQl("select * from vaccines where vcid=\'" + vcid + "\' and date >=\'" + nextDate1 + "\'");

                            
                            if (rs2.next()) {
                                vdate = rs2.getString("date");
                                System.out.println("priya");
                                System.out.println(date);
                    %>
                    <h5 id="date2">Date: <%=vdate%></h5>
                    <%
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>

                    <%
                        try {
                            int mid = Integer.parseInt(request.getParameter("mid"));
                            ResultSet rs = DBLoader.executeSQl("select * from members where mid=\'" + mid + "\'");
                            System.out.println("World");
                            if (rs.next()) {
                                String mname = rs.getString("name");
                    %>
                    <h5>Name: <%=mname%></h5>
                    <%
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>


                    <select name="Select time" id="time" class="center-block">
                        <option>Choose preffered time</option>
                        <option>10:30 </option>
                        <option>11:00 </option>
                        <option>11:30</option>
                        <option>12:30 </option>
                        <option>2:30 </option>
                        <option>3:00 </option>
                    </select>


                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <%
                        try {
                            int mid = Integer.parseInt(request.getParameter("mid"));
                            ResultSet rs = DBLoader.executeSQl("select * from vaccines where vcid=\'" + vcid + "\'");

                            if (rs.next()) {
                                int vid = rs.getInt("vid");
                    %>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="bookLogic('<%=mid%>','<%=vcid%>','<%=vid%>','<%=vdate%>')">Book</button>

                    <%
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>


                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>


    <footer id="footer" class="footer-area wow fadeIn">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="logo padding">
                        <a href=""><img src="images/logo.png" alt=""></a>
                        <p>Locavore pork belly scen ester pine est chill wave microdosing pop uple itarian cliche artisan.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="footer-info padding">
                        <h3>CONTACT US</h3>
                        <p><i class="fa fa-map-marker" aria-hidden="true"></i> PO Box 16122 Collins Street West Victoria 8007 Australia</p>
                        <p><i class="fa fa-paper-plane" aria-hidden="true"></i> info@gmail.com</p>
                        <p><i class="fa fa-phone" aria-hidden="true"></i> (+1) 800 123 456</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="subcriber-info">
                        <h3>SUBSCRIBE</h3>
                        <p>Get healthy news, tip and solutions to your problems from our experts.</p>
                        <div class="subcriber-box">
                            <form id="mc-form" class="mc-form">
                                <div class="newsletter-form">
                                    <input type="email" autocomplete="off" id="mc-email" placeholder="Email address" class="form-control" name="EMAIL">
                                    <button class="mc-submit" type="submit"><i class="fa fa-paper-plane"></i></button> 
                                    <div class="clearfix"></div>
                                    <!-- mailchimp-alerts Start -->
                                    <div class="mailchimp-alerts">
                                        <div class="mailchimp-submitting"></div>
                                        <!-- mailchimp-submitting end -->
                                        <div class="mailchimp-success"></div>
                                        <!-- mailchimp-success end -->
                                        <div class="mailchimp-error"></div>
                                        <!-- mailchimp-error end -->
                                    </div>
                                    <!-- mailchimp-alerts end -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <div class="copyright-area wow fadeIn">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="footer-text">
                        <p>© 2018 Lifecare. All Rights Reserved.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="social">
                        <ul class="social-links">
                            <li><a href=""><i class="fa fa-rss"></i></a></li>
                            <li><a href=""><i class="fa fa-facebook"></i></a></li>
                            <li><a href=""><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                            <li><a href=""><i class="fa fa-youtube"></i></a></li>
                            <li><a href=""><i class="fa fa-pinterest"></i></a></li>
                        </ul>
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
