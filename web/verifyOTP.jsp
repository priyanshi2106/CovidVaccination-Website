
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
        <script>
            function checkotp(aid)
            {
                var uotp=document.getElementById("otp").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {

                        var res = this.responseText;
                        res=res.trim();
                        alert(res);
                        if(res=="success")
                        {
                            
                                location.href="staffHome.jsp";
                               
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
                xhttp.open("GET", "./vaccinatedResponse?aid="+aid+"&uotp="+uotp, true);
                 xhttp.send();
                
            }
        </script>
    </head>
    <body>
        
        <div style="height:200px"></div>
        
        <div id="sec2" class="container">
            <div class="row">
                <div class="col-sm-4">
                    
                </div>
                <div class="col-sm-4">
                    <form>
                <div class="form-group">
                    <label>Enter OTP</label>
                    <input type="text" id="otp" placeholder="Enter OTP" class="form-control"/>
                </div>
                <div class="form-group">
                    <%
                        int aid=Integer.parseInt(request.getParameter("aid"));
                    %>
                    <input type="button" value="Submit" class="btn bg-primary" onclick="checkotp(<%=aid%>)"/>
                </div>
            </form>
            <h5 id="errormessage2" style="color:red">
                
            </h5>

                </div>
                <div class="col-sm-4">
                    
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
