
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
        #sec2
        {
            display:none;
        }
    </style>
    <script>
        var existinguser=false;
        function userSignupLogic()
        {
            if(existinguser==true)
            {
               userSignupLogicVerify();    
            }
            else
            {
               var phoneno = document.getElementById("phoneno").value;
               var name = document.getElementById("name").value;
               var password = document.getElementById("password").value;

               if (phoneno == "" || password == "" || name == "")
              {
                   documnet.getElementById("errormessage").innerHTML = "Please fill values";
               }
               else if (phoneno.length != 10)
              {
                  document.getElementById("errormessage").innerHTML = "Please Enter valid phone number";
               } 
               else if (password.length < 5)
              {
                   document.getElementById("errormessage").innerHTML = "Weak Password";
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
                        if (res == "Success")
                        {
                            document.getElementById("sec1").style.display ="none";
                            document.getElementById("sec2").style.display="block";
                        } 
                        else
                        {
                            document.getElementById("errormessage").innerHTML = "Phone number already exists";
                        }
                    }
                };
                xhttp.open("POST", "./userSignupResponse", true);

                //formdata
                var formdata = new FormData();
                //text
                formdata.append("phoneno", document.getElementById("phoneno").value);
                formdata.append("name", document.getElementById("name").value);
                formdata.append("password", document.getElementById("password").value);
                //file
                formdata.append("f1", document.getElementById("f1").files[0]);

                xhttp.send(formdata);
            }
            }
            
        }
    
       function checkotp()
      {
        var otp=document.getElementById("otp").value;
        var phoneno=document.getElementById("phoneno").value;
        if(otp=="")
        {
            document.getElementById("errormessage2").innerHTML="Please enter OTP";
            
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
                        if(res=="success")
                        {
                            document.getElementById("errormessage2").innerHTML="Signup Successful!!";
                            location.href="userlogin.jsp";
                        }
                        else if(res=="failed")
                        {
                            document.getElementById("errormessage2").innerHTML="Wrong OTP";
                        }
                        else
                        {
                            document.getElementById("errormessage2").innerHTML="Session expired";
                            setTimeOut(gotosignup,3000);
                        }
                        
                    }
                };
                xhttp.open("GET", "./checkOtpResponse?otp="+otp+"&phoneno="+phoneno, true);
                 xhttp.send();

        }
      }
      function checkphoneno()
      {
          
          var phoneno=document.getElementById("phoneno").value;
          if(phoneno.length==10)
          {
              var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {

                        var res = this.responseText;
                        res=res.trim();
                        if(res=="success")
                        {
                            existinguser=true;
                            document.getElementById("name").style.display="none";
                            document.getElementById("password").style.display="none";
                            document.getElementById("f1").style.display="none";
                            document.getElementById("lb2").style.display="none";
                            document.getElementById("lb3").style.display="none";
                            document.getElementById("lb4").style.display="none";
                            document.getElementById("errormessage").innerHTML="Phoneno already in database, please verify with OTP.";
                        }
                       
                    }
                };
                xhttp.open("GET", "./checkPhonenoResponse?phoneno="+phoneno, true);
                 xhttp.send();

          }
      }
      function userSignupLogicVerify()
      {
          var phoneno=document.getElementById("phoneno").value;
           var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {

                        var res = this.responseText;
                        res=res.trim();
                        if(res=="success")
                        {
                            document.getElementById("sec1").style.display ="none";
                            document.getElementById("sec2").style.display="block";
                        }
               
                    }
                };
                xhttp.open("GET", "./userSignupSendOTP?phoneno="+phoneno, true);
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
                <a class="navbar-brand" href="index.html"><img src="images/covid_logo.PNG" alt="image"></a>
                <div class="right-header">
                    <div class="header-info">
                        <div class="info-inner">
                            <span class="icontop"><img src="images/phone-icon.png" alt="#"></span>
                            <span class="iconcont"><a href="tel:800 123 456">800 123 456</a></span>	
                        </div>
                        <div class="info-inner">
                            <span class="icontop"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                            <span class="iconcont"><a data-scroll href="mailto:info@yoursite.com">info@Lifecare.com</a></span>	
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
                            <li><a class="active" href="index.html">Home</a></li>
                            <li><a data-scroll href="#about">About us</a></li>
                            <li><a data-scroll href="#service">Services</a></li>
                            <li><a data-scroll href="#doctors">Doctors</a></li>
                            <li><a data-scroll href="userlogin.jsp">Login</a></li>
                            <li><a data-scroll href="signup.jsp">Signup</a></li>
                            <li><a data-scroll href="#getintouch">Contact</a></li>
                        </ul>
                    </div>
                </nav>
                <div class="serch-bar">
                    <div id="custom-search-input">
                        <div class="input-group col-md-12">
                            <input type="text" class="form-control input-lg" placeholder="Search" />
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-lg" type="button">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div style="height:200px"></div>
    <div style="height:500px ">
        <h1 style="text-align: center" class="jumbotron bg-info">User SignUp</h1>

        <div class="container" id="sec1">
            <form>
                <div class="form-group">
                    <label>Enter Phone number</label>
                    <input type="text" id="phoneno" placeholder="Enter PhoneNo" class="form-control" onkeyup="checkphoneno()"/>
                </div>
                <div class="form-group">
                    <label id="lb2">Enter Name</label> 
                    <input type="text" id="name" placeholder="Enter Name" class="form-control"/>
                </div>
                <div class="form-group">
                    <label id="lb3">Enter Password </label>
                    <input type="password" id="password" placeholder="Enter Password" class="form-control"/>
                </div>
                <div class="form-group">
                    <label id="lb4">Choose Photo</label><br>
                    <input type="file" id="f1"/><br>
                    <label style="color: peru">OTP will be sent to your phone number</label>
                </div>
                <div class="form-group">
                    <input type="button" value="Submit" class="btn-primary" onclick="userSignupLogic()"/>
                </div>
            </form>
            <h5 id="errormessage" style="color:red">

            </h5>
        </div>
        
        <div id="sec2" class="container">
            <form>
                <div class="form-group">
                    <label>Enter OTP</label>
                    <input type="text" id="otp" placeholder="Enter OTP" class="form-control"/>
                </div>
                <div class="form-group">
                    <input type="button" value="Submit" class="btn bg-primary" onclick="checkotp()"/>
                </div>
            </form>
            <h5 id="errormessage2" style="color:red">
                
            </h5>
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
