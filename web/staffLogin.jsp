
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            
            function staffLoginLogic()
            {
                var id=document.getElementById("id").value;
                var password=document.getElementById("password").value;
               // alert(id);
                //alert(password);
                if(id == ""|| password=="")
            {
                document.getElementById("errormessage").innerHTML="Please enter id and password";
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
                        alert(res);
                        
                        if(res=="success")
                        {
                            
                            
                            alert()
                                location.href="staffHome.jsp";
                               
                        }
                        
                        else
                        {
                            document.getElementById("errormessage").innerHTML="Wrong password";
                        }
               
                    }
                };
                xhttp.open("GET", "./staffLoginResponse?id="+id+"&password="+password, true);
                 xhttp.send();
            }
        }
        </script>
    </head>
    <body>
        <h1 class="jumbotron text-center">Staff Login</h1>
        
        <div class="container" id="sec1">
            <form>
                <div class="form-group">
                    <label>Enter ID</label>
                    <input type="text" id="id" placeholder="Enter your ID" class="form-control"/>
                </div>
               
                <div class="form-group">
                    <label>Enter Password </label>
                    <input type="password" id="password" placeholder="Enter Password" class="form-control"/>
                </div>
                
                <div class="form-group">
                    <input type="button" value="Login" class="btn btn-primary" onclick="staffLoginLogic()"/>
                </div>
            </form>
            <h5 id="errormessage" style="color:red">

            </h5>
        </div>
        
       

        
    </body>
</html>
