
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
   <script>
       function sendMessage()
       {
           alert("Message sent!!")
       }
       function addMemberLogic()
       {
           var name=document.getElementById("name").value;
           var prooftype=document.getElementById("prooftype").value;
           var proofno=document.getElementById("proofno").value;
           var age=document.getElementById("age").value;
           var gender=document.getElementById("gender").value;
           
           
           if(name==""|| prooftype==""||proofno==""|| age==""|| gender=="")
           {
               document.getElementById("errormessage").innerHTML="Please fill all the fields.";
           }
           else
           {
               var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {

                        var res = this.responseText;
                        res=res.trim();
                        if (res == "success")
                        {
                            document.getElementById("errormessage").innerHTML="Member added successfuly!";
                            location.href="index.jsp";
                        } 
                        else
                        {
                            document.getElementById("errormessage").innerHTML="Member is already added with this proof.";
                        }
                    }
                };
                xhttp.open("POST", "./addMemberLogic", true);

                //formdata
                var formdata = new FormData();
                //text
                formdata.append("name", document.getElementById("name").value);
                formdata.append("prooftype", document.getElementById("prooftype").value);
                formdata.append("proofno", document.getElementById("proofno").value);
                formdata.append("age", document.getElementById("age").value);
                formdata.append("gender", document.getElementById("gender").value);
                //file
                formdata.append("f1", document.getElementById("f1").files[0]);

                xhttp.send(formdata);
           }
       }
       
       function viewMemberLogic()
       {
           location.href="viewMembers.jsp";
           
           
       }
       function staffLoginLogic()
       {
           location.href="staffLogin.jsp";
       }
       function adminLoginLogic()
       {
           location.href="adminLogin.jsp";
       }
       function covidCenterLoginLogic()
       {
           location.href="covidCenterLogin.jsp";
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
                        <span class="iconcont"><a href="tel:98672400">9878672400</a></span>	
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
                        <li><a data-scroll href="#about">About us</a></li>
                        <li><a data-scroll href="#service">Services</a></li>
                        <li><a data-scroll href="#doctors">Doctors</a></li>
                        <li><a data-scroll href="#getintouch">Contact</a></li>
                        <%
                            if(session.getAttribute("phoneno")==null)
                            {
                        %>
                             <li><a data-scroll href="userlogin.jsp">Login</a></li>
                             <li><a data-scroll href="signup.jsp">Signup</a></li>
                        <%
                            }
                           else
                            {
                               String name=session.getAttribute("name").toString();
                        %>
                             <li class="dropdown">
                                 <a class="dropdown-toggle" data-toggle="dropdown" href="#">Welcome <%=name%>
                                     <span class="dropdown-menu"></span></a>
                                     <ul class="dropdown-menu">
                                         <li><a href="changePassword.jsp" style="color:#000">Change Password</a></li>
                                         <li><a href="./userLogout" style="color:#000">Logout</a></li>
                                     </ul>
                             </li>
                        <%     
                            }
                        %>
                      
                     </ul>
                  </div>
               </nav>
               
            </div>
         </div>
      </header>
      <div id="home" class="parallax first-section wow fadeIn" data-stellar-background-ratio="0.4" style="background-image:url('images/slider-bg.png');">
         <div class="container">
            <div class="row">
               <div class="col-md-12 col-sm-12">
                  <div class="text-contant">
                     <h2>
                        <span class="center"><span class="icon"><img src="images/icon-logo.png" alt="#" /></span></span>
                        <a href="" class="typewrite" data-period="2000" data-type='[ "Welcome to Covid Care", "We Care About Your Health", "Get vaccinated today!" ]'>
                        <span class="wrap"></span>
                        </a>
                     </h2>
                  </div>
               </div>
            </div>
            <!-- end row -->
         </div>
         <!-- end container -->
      </div>
      <!-- end section -->
      <div id="time-table" class="time-table-section">
         <div class="container">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
               <div class="row">
                  <div class="service-time one" style="background:#2895f1;">
                     <span class="info-icon"><i class="fa fa-ambulance" aria-hidden="true"></i></span>
                     <h3>Emergency Case</h3>
                     <p>Doctors are always available to contact whenever an emergency occurs or any complication is there after taking the vaccination.</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
               <div class="row">
                  <div class="service-time middle" style="background:#0071d1;">
                     <span class="info-icon"><i class="fa fa-clock-o" aria-hidden="true"></i></span> 
                     <h3>Working Hours</h3>
                     <div class="time-table-section">
                        <ul>
                           <li><span class="left">Monday - Friday</span><span class="right">9.00 to 18.00</span></li>
                           <li><span class="left">Saturday</span><span class="right">9.00 ? 16.00</span></li>
                           <li><span class="left">Sunday</span><span class="right">9.00 ? 13.00</span></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
               <div class="row">
                  <div class="service-time three" style="background:#0060b1;">
                     <span class="info-icon"><i class="fa fa-hospital-o" aria-hidden="true"></i></span>
                     <h3>Clinic Timetable</h3>
                     <p>Vaccination doses will be provided according to the prescribed time to avoid crowd at hospitals. Everyone is requested to strictly follow the appointment time. No appointments will be entertained after the scheduled time.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div id="about" class="section wow fadeIn">
         <div class="container">
            <div class="heading">
               <span class="icon-logo"><img src="images/icon-logo.png" alt="#"></span>
               <h2>The Specialist Clinic</h2>
            </div>
            <!-- end title -->
            <div class="row">
               <div class="col-md-6">
                  <div class="message-box">
                     <h4>What We Do</h4>
                     <h2>Hospital Service</h2>
                     <p class="lead">We help you get in contact with the best hospitals that are providing vaccination in a location near you. All you need to do is SignUp and book an appointment! </p>
                     <p> Wearing masks and staying 6 feet apart from others help reduce your chance of being exposed to the virus or spreading it to others, but these measures are not enough. Vaccines will work with your immune system so it will be ready to fight the virus if you are exposed.  </p>
                     <p>A growing body of evidence suggests that fully vaccinated people are less likely to be infected without showing symptoms (called an asymptomatic infection) and potentially less likely to spread the virus that causes COVID-19 to others. However, further investigation is ongoing.</p>
                     <p>Getting COVID-19 may offer some protection, known as natural immunity. Current evidence suggests that reinfection with the virus that causes COVID-19 is uncommon in the months after initial infection, but may increase with time. The risk of severe illness and death from COVID-19 far outweighs any benefits of natural immunity. COVID-19 vaccination will help protect you by creating an antibody (immune system) response without having to experience sickness.</p>
                     <a href="https://www.cdc.gov/coronavirus/2019-ncov/vaccines/vaccine-benefits.html" data-scroll class="btn btn-light btn-radius btn-brd grd1 effect-1">Learn More</a>
                  </div>
                  <!-- end messagebox -->
               </div>
               <!-- end col -->
               <div class="col-md-6">
                  <div class="post-media wow fadeIn">
                      <img src="images/image1.jpg" alt="" class="img-responsive">
                     <a href="http://www.youtube.com/watch?v=nrJtHemSPW4" data-rel="prettyPhoto[gal]" class="playbutton"><i class="flaticon-play-button"></i></a>
                  </div>
                  <!-- end media -->
               </div>
               <!-- end col -->
            </div>
            <!-- end row -->
            <hr class="hr1">
            <div class="row">
               <div class="col-md-3 col-sm-6 col-xs-12">
                  <div class="service-widget">
                     <div class="post-media wow fadeIn">
                        <a href="images/clinic_01.jpg" data-rel="prettyPhoto[gal]" class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
                        <img src="images/imag111.jpg" alt="" class="img-responsive" style="height: 100">
                     </div>
                    
                  </div>
                  <!-- end service -->
               </div>
               <div class="col-md-3 col-sm-6 col-xs-12">
                  <div class="service-widget">
                     <div class="post-media wow fadeIn">
                        <a href="images/clinic_02.jpg" data-rel="prettyPhoto[gal]" class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
                        <img src="images/image3.jpg" alt="" class="img-responsive">
                     </div>
                     
                  </div>
                  <!-- end service -->
               </div>
               <div class="col-md-3 col-sm-6 col-xs-12">
                  <div class="service-widget">
                     <div class="post-media wow fadeIn">
                        <a href="images/clinic_03.jpg" data-rel="prettyPhoto[gal]" class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
                        <img src="images/image4.jpg" alt="" class="img-responsive">
                     </div>
                     
                  </div>
                  <!-- end service -->
               </div>
               <div class="col-md-3 col-sm-6 col-xs-12">
                  <div class="service-widget">
                     <div class="post-media wow fadeIn">
                        <a href="images/clinic_01.jpg" data-rel="prettyPhoto[gal]" class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
                        <img src="images/image6.jpg" alt="" class="img-responsive">
                     </div>
                     
                  </div>
                  <!-- end service -->
               </div>
            </div>
            <!-- end row -->
         </div>
         <!-- end container -->
      </div>
      <div id="service" class="services wow fadeIn">
         <div class="container">
            <div class="row">
               <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                  <div class="inner-services">
                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <div class="serv">
                           <span class="icon-service"><img src="images/service-icon1.png" alt="#" /></span>
                           <h4>PREMIUM FACILITIES</h4>
                           <p>Lorem Ipsum is simply dummy text of the printing.</p>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <div class="serv">
                           <span class="icon-service"><img src="images/service-icon2.png" alt="#" /></span>
                           <h4>LARGE LABORATORY</h4>
                           <p>Lorem Ipsum is simply dummy text of the printing.</p>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <div class="serv">
                           <span class="icon-service"><img src="images/service-icon3.png" alt="#" /></span>
                           <h4>DETAILED SPECIALIST</h4>
                           <p>Lorem Ipsum is simply dummy text of the printing.</p>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <div class="serv">
                           <span class="icon-service"><img src="images/service-icon4.png" alt="#" /></span>
                           <h4>CHILDREN CARE CENTER</h4>
                           <p>Lorem Ipsum is simply dummy text of the printing.</p>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <div class="serv">
                           <span class="icon-service"><img src="images/service-icon5.png" alt="#" /></span>
                           <h4>FINE INFRASTRUCTURE</h4>
                           <p>Lorem Ipsum is simply dummy text of the printing.</p>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <div class="serv">
                           <span class="icon-service"><img src="images/service-icon6.png" alt="#" /></span>
                           <h4>ANYTIME BLOOD BANK</h4>
                           <p>Lorem Ipsum is simply dummy text of the printing.</p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                   
                   <%
                   if(session.getAttribute("phoneno")!=null)
                   {
                   %>
                   
                  <div class="appointment-form">
                     <h3><span>+</span> Add Member</h3>
                     <div class="form">
                        <form>
                           <fieldset>
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="row">
                                    <div class="form-group">
                                       <input type="text" id="name" name="name" placeholder="Enter Name"  />
                                    </div>
                                 </div>
                              </div>
                              
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="row">
                                    <div class="form-group">
                                       <select class="form-control"id="prooftype" name="prooftype">
                                          <option >Select Proof Type</option>
                                          <option>Adhaar card</option>
                                          <option>Pan card</option>
                                          <option>Driving licence</option>
                                          <option>Passport</option>
                                       </select>
                                    </div>
                                 </div>
                              </div>
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="row">
                                    <div class="form-group">
                                       <input type="text" placeholder="Type proof number" id="proofno" name="proofno" />
                                    </div>
                                 </div>
                              </div>
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="row">
                                    <div class="form-group">
                                       <input type="text" placeholder="Enter your birth year" id="age" name="age"/>
                                    </div>
                                 </div>
                              </div>
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="row">
                                    <div class="form-group">
                                       <select class="form-control"id="gender" name="gender">
                                          <option >Select your gender</option>
                                          <option>Male</option>
                                          <option>Female</option>
                                       </select>
                                    </div>
                                 </div>
                              </div>
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="row">
                                    <div class="form-group">
                                       <input type="file" placeholder="Select your photo" id="f1" name="f1"/>
                                    </div>
                                 </div>
                              </div>
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="row">
                                    <div class="form-group">
                                        <div class="center"><button type="button" onclick="addMemberLogic()">Add</button></div>
                                    </div>
                                 </div>
                              </div>
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                 <div class="row">
                                    <div class="form-group">
                                        <div class="center"><button type="button" onclick="viewMemberLogic()">View Members</button></div>
                                    </div>
                                 </div>
                              </div>
                               <h5 id="errormessage">
                                   
                               </h5>
                           </fieldset>
                        </form>
                     </div>
                  </div>
                   
                   <%}
%>
               </div>
            </div>
         </div>
      </div>
      <!-- end section -->
	  
	  <!-- doctor -->
	  
	  <div id="doctors" class="parallax section db" data-stellar-background-ratio="0.4" style="background:#fff;" data-scroll-id="doctors" tabindex="-1">
        <div class="container">
		
		<div class="heading">
               <span class="icon-logo"><img src="images/icon-logo.png" alt="#"></span>
               <h2>The Specialist Clinic</h2>
            </div>

            <div class="row dev-list text-center">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.2s" style="visibility: visible; animation-duration: 1s; animation-delay: 0.2s; animation-name: fadeIn;">
                    <div class="widget clearfix">
                        <img src="images/fortis.jpg" alt="" class="img-responsive img-rounded">
                        <div class="widget-title">
                            <h3>Fortis Hospital, Amritsar</h3>
                            <small>Address</small>
                        </div>
                        <!-- end title -->
                        <p>Majitha-Verka Bypass Road, Amritsar - 143004, Amritsar, Punjab 143004</p>

                        <div class="footer-social">
                            <a href="#" class="btn grd1"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="btn grd1"><i class="fa fa-github"></i></a>
                            <a href="#" class="btn grd1"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="btn grd1"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div><!--widget -->
                </div><!-- end col -->

                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.4s" style="visibility: visible; animation-duration: 1s; animation-delay: 0.4s; animation-name: fadeIn;">
                    <div class="widget clearfix">
                        <img src="images/capitol.jpg" alt="" class="img-responsive img-rounded">
                        <div class="widget-title">
                            <h3>Capitol Hospital, Jalandhar</h3>
                            <small>Address</small>
                        </div>
                        <!-- end title -->
                        <p>NH-44, Jalandhar - Pathankot Road Near Reru, Chowk, Jalandhar, Punjab 144012</p>

                        <div class="footer-social">
                            <a href="#" class="btn grd1"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="btn grd1"><i class="fa fa-github"></i></a>
                            <a href="#" class="btn grd1"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="btn grd1"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div><!--widget -->
                </div><!-- end col -->

                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 wow fadeIn">
                    <div class="widget clearfix">
                        <img src="images/civilHospital.jpg" alt="" class="img-responsive img-rounded">
                        <div class="widget-title">
                            <h3>Civil Hospital, Ludhiana</h3>
                            <small>Address</small>
                        </div>
                        <!-- end title -->
                        <p>Field Ganj Rd, CMC Campus, Ludhiana, Punjab 141008</p>

                        <div class="footer-social">
                            <a href="#" class="btn grd1"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="btn grd1"><i class="fa fa-github"></i></a>
                            <a href="#" class="btn grd1"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="btn grd1"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div><!--widget -->
                </div><!-- end col -->

            </div><!-- end row -->
        </div><!-- end container -->
    </div>
	  
	  <div id="price" class="section pr wow fadeIn" style="background-image:url('images/price-bg.png');">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="tab-content">
                     <div class="tab-pane active fade in" id="tab1">
                        <div class="row text-center">
                           <div class="col-md-4">
                              <div class="pricing-table pricing-table-highlighted">
                                 <div class="pricing-table-header grd1">       <br>
                                     <h2 style="color: whitesmoke">Females Vaccinated</h2>
                                    
                                 
                             
                                 <div class="pricing-table-features">
                                    <%
                                        ResultSet rs=DBLoader.executeSQl("select count(*) as count from members where gender='Female'");
                                        if(rs.next())
                                        {
                                            int count=rs.getInt("count");
                                    %>
                                    <br><br>
                                    <h3><%=count%> Females</h3>
                                    <%
                                        }
                                    %>
                                 </div>
                                 <div style="height:40px"></div>
                              </div>
                              </div>
                           </div>
                           <div class="col-md-4">
                              <div class="pricing-table pricing-table-highlighted">
                                 <div class="pricing-table-header grd1">
                                    <h2 style="color:green">Total People Vaccinated</h2>
                                    
                                 </div>
                                 <div class="pricing-table-space"></div>
                                 <div class="pricing-table-text">
                                    
                                 </div>
                                 <div class="pricing-table-features">
                                    <%
                                        ResultSet rs1=DBLoader.executeSQl("select count(*) as count from members");
                                        if(rs1.next())
                                        {
                                            int count=rs1.getInt("count");
                                    %>
                                    <br><br>
                                    <h3><%=count%> People</h3>
                                    <%
                                        }
                                    %>
                                 </div>
                                 <div class="pricing-table-sign-up">
                                                                     </div>
                              </div>
                           </div>
                            <div class="col-md-4">
                              <div class="pricing-table pricing-table-highlighted">
                                 <div class="pricing-table-header grd1">       <br>
                                     <h2 style="color: whitesmoke">Males Vaccinated</h2>
                                    
                                 
                             
                                 <div class="pricing-table-features">
                                    <%
                                        ResultSet rs2=DBLoader.executeSQl("select count(*) as count from members where gender='Male'");
                                        if(rs2.next())
                                        {
                                            int count=rs2.getInt("count");
                                    %>
                                    <br><br>
                                    <h3><%=count%> Males</h3>
                                    <%
                                        }
                                    %>
                                 </div>
                                 <div style="height:40px"></div>
                              </div>
                              </div>
                           </div>
                                                  </div>
                        <!-- end row -->
                     </div>
                     <!-- end pane -->
                     <div class="tab-pane fade" id="tab2">
                        <div class="row text-center">
                           <div class="col-md-6">
                              <div class="pricing-table">
                                 <div class="pricing-table-header">
                                    <h2>Dedicated Server</h2>
                                    <h3>$85/month</h3>
                                 </div>
                                 <div class="pricing-table-space"></div>
                                 <div class="pricing-table-features">
                                    <p><i class="fa fa-envelope-o"></i> <strong>250</strong> Email Addresses</p>
                                    <p><i class="fa fa-rocket"></i> <strong>125GB</strong> of Storage</p>
                                    <p><i class="fa fa-database"></i> <strong>140</strong> Databases</p>
                                    <p><i class="fa fa-link"></i> <strong>60</strong> Domains</p>
                                    <p><i class="fa fa-life-ring"></i> <strong>24/7 Unlimited</strong> Support</p>
                                 </div>
                                 <div class="pricing-table-sign-up">
                                    <a href="#contact" data-scroll="" class="btn btn-dark btn-radius btn-brd">Order Now</a>
                                 </div>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="pricing-table pricing-table-highlighted">
                                 <div class="pricing-table-header grd1">
                                    <h2>VPS Server</h2>
                                    <h3>$59/month</h3>
                                 </div>
                                 <div class="pricing-table-space"></div>
                                 <div class="pricing-table-text">
                                    <p>This is a perfect choice for small businesses and startups.</p>
                                 </div>
                                 <div class="pricing-table-features">
                                    <p><i class="fa fa-envelope-o"></i> <strong>150</strong> Email Addresses</p>
                                    <p><i class="fa fa-rocket"></i> <strong>65GB</strong> of Storage</p>
                                    <p><i class="fa fa-database"></i> <strong>60</strong> Databases</p>
                                    <p><i class="fa fa-link"></i> <strong>30</strong> Domains</p>
                                    <p><i class="fa fa-life-ring"></i> <strong>24/7 Unlimited</strong> Support</p>
                                 </div>
                                 <div class="pricing-table-sign-up">
                                    <a href="#contact" data-scroll="" class="btn btn-light btn-radius btn-brd grd1 effect-1">Order Now</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <!-- end row -->
                     </div>
                     <!-- end pane -->
                  </div>
                  <!-- end content -->
               </div>
               <!-- end col -->
            </div>
         </div>
      </div>
	  
	  <!-- end doctor section -->
	  
      <!-- end section -->
      <div id="getintouch" class="section wb wow fadeIn" style="padding-bottom:0;">
         <div class="container">
            <div class="heading">
               <span class="icon-logo"><img src="images/icon-logo.png" alt="#"></span>
               <h2>Get in Touch</h2>
            </div>
         </div>
         <div class="contact-section">
            <div class="form-contant">
               <form>
                  <div class="row">
                     <div class="col-md-6">
                        <div class="form-group in_name">
                           <input type="text" class="form-control" placeholder="Name" required="required">
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="form-group in_email">
                           <input type="email" class="form-control" placeholder="E-mail" required="required">
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="form-group in_email">
                           <input type="tel" class="form-control" id="phone" placeholder="Phone" required="required">
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="form-group in_email">
                           <input type="text" class="form-control" id="subject" placeholder="Subject" required="required">
                        </div>
                     </div>
                     <div class="col-md-12">
                        <div class="form-group in_message"> 
                           <textarea class="form-control" id="message" rows="5" placeholder="Message" required="required"></textarea>
                        </div>
                        <div class="actions">
                            <input type="button" value="Send Message" name="submit" id="submitButton" class="btn small" title="Submit Your Message!" onclick="sendMessage()">
                        </div>
                         <div id="message">
                             
                         </div>
                     </div>
                  </div>
               </form>
            </div>
             <div id="googleMap" style="width:100%;height:450px;">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3396.870914983375!2d74.88921031448618!3d31.63738454852144!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzHCsDM4JzE0LjYiTiA3NMKwNTMnMjkuMCJF!5e0!3m2!1sen!2sin!4v1622230609268!5m2!1sen!2sin" width="1250" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
             </div>
         </div>
      </div>
     <footer id="footer" class="footer-area wow fadeIn">
         <div class="container">
            <div class="row">
               <div class="col-md-4">
                  <div class="logo padding">
                     <a href=""><img src="images/covid_logo.PNG" alt=""></a>
                     <p></p>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="footer-info padding">
                     <h3>CONTACT US</h3>
                     <p><i class="fa fa-map-marker" aria-hidden="true"></i>98 Krishna Square II, backside celebration mall, Amritsar</p>
                     <p><i class="fa fa-paper-plane" aria-hidden="true"></i> pspriyanshisharma@gmail.com</p>
                     <p><i class="fa fa-phone" aria-hidden="true"></i> 9878672400</p>
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
                     <button  type=button" class="btn btn-info btn-small" onclick="staffLoginLogic()">Staff Login</button>
                     <button  type=button" class="btn btn-info btn-small" onclick="adminLoginLogic()">Admin Login</button>
                     <button  type=button" class="btn btn-info btn-small" onclick="covidCenterLoginLogic()">Covid Center Login</button>
                     
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
     
   </body>
</html>
