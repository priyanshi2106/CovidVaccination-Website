
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
        #d2
        {
            border-radius: 25px;
            border: 2px solid green;
            padding: 20px;
        }
    </style>
    <script>
        function bookAppointmentLogic(vcid, mid)
        {


            location.href = "bookAppointment.jsp?vcid=" + vcid + "&mid=" + mid;
        }
        function cancelAppointmentLogic(aid)
        {

            var xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var res = this.responseText;
                    res = res.trim();
                    if (res == "success")
                    {
                        location.href = "viewAppointment.jsp";
                    }
                }
            };

            xhttp.open("GET", "./cancelAppointment?aid=" + aid, true);
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
                            <span class="iconcont"><a href="tel:98 786 724 00">9878672400</a></span>	
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
            <h1 class="text-center jumbotron bg-primary"> View Appointment</h1>
            <%
                try {
                    int mid = Integer.parseInt(request.getParameter("mid"));
                    System.out.println("Hola");
                    System.out.println(mid);
                    ResultSet rs = DBLoader.executeSQl("select * from appointments where mid=\'" + mid + "\' ORDER BY date DESC");
                    while (rs.next())
                    {
                        System.out.println();
                        int vcid = rs.getInt("vcid");
            %>

            <div class="row">
                <div class="col-lg-1">

                </div>
                <div class="col-lg-10"  id="d2" style="background-color:papayawhip">
                    <div class="row">


                        <%
                          
                                String date = rs.getString("date");
                                String time = rs.getString("time");
                        %>
                        <div class="col-lg-5">
                            <div class="card">
                                <h3 class="card-title" style="color:green"><%= date%></h3>
                            </div>
                        </div>          
                        <div class="col-lg-5">
                            <div class="card" style="float:right">
                                <h3 class="card-title" style="color:green"><%= time%></h3>
                            </div>
                        </div>


                        <%
                            

                        %>
                    </div>  
                    <hr>

                    <div class="row">
                        <div class="col-lg-7">
                            <div class="card">

                                <div class="card-body text-left">

                                    <% ResultSet rs2 = DBLoader.executeSQl("select * from vaccinecenters where vcid=\'" + vcid + "\'");
                                        if (rs2.next())
                                        {
                                            String center_name = rs2.getString("name");
                                            String city = rs2.getString("city");
                                    %>

                                    <h3 class="card-title" style="color:green">Center Name: <%= center_name%></h3>
                                    <h3 class="card-title" style="color:green">City: <%=city%></h3>
                                    <%
                                        }
                                    %>


                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3" style="float: right">
                            <div class="card">
                                <%
                                        String status = rs.getString("status");
                                        int aid = rs.getInt("aid");
                                        System.out.println(status);
                                        if (status.equals("pending")) {
                                %>
                                <label style="text-align:center;color:greenyellow">Appointment Status: <%=status%></label><br><br>
                                <button type="button" onclick="cancelAppointmentLogic(<%=aid%>)" class="btn btn-danger">Cancel Appointment</button>

                                <%
                                } else if (status.equals("missed")) {
                                %>
                                <label style="text-align:center;color:orange">Appointment Status: <%=status%></label><br><br>
                                <button type="button" onclick="bookAppointmentLogic(<%=vcid%>,<%=mid%>)" class="btn btn-primary">Book Appointment</button>
                               <%
                                } else {
                                %>
                                <label style="text-align:center;color:red">Appointment Status: <%=status%></label><br><br>
                                <button type="button" onclick="bookAppointmentLogic(<%=vcid%>,<%=mid%>)" class="btn btn-primary">Book Appointment</button>
                                <%
                                    }
                                %>

                        

                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-lg-1">

                </div>
            </div>

            <%
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>

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
                        <p>? 2018 Lifecare. All Rights Reserved.</p>
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
