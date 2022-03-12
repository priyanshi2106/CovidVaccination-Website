
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
    <title>Covid 19 Care - Responsive HTML5 Multi Page Template</title>
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
            function addStaffLogic(vcid)
            {
                var name=document.getElementById("name").value;
                var password=document.getElementById("password").value;
                 if(name==""||password=="")
                {
                    document.getElementById("errormessage2").innerHTML="Please fill all the details!";
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
                            
                          setTimeout(fetchStaffLogic,1000);
                               
                        }
                        
                        else
                        {
                            document.getElementById("errormessage").innerHTML="Already added";
                        }
               
                    }
                };
                xhttp.open("GET", "./addStaffResponse?name="+name+"&password="+password+"&vcid="+vcid, true);
                 xhttp.send();
               
            }
        }
        function fetchStaffLogic()
        {
             var xhttp = new XMLHttpRequest();
                         xhttp.onreadystatechange = function()
                         {
                           if (this.readyState == 4 && this.status == 200) 
                           {
                               var res=this.responseText;
                               console.log(res);
                              
                              var mainobj=JSON.parse(res.trim());
                              console.log(mainobj);
                              
                              var arr = mainobj["ans"];
                              console.log(arr);
                              
                              var ans = "<table width=800 border=2>";
                              ans=ans+"<tr>";
                              ans=ans+"<th>Name</th>";
                              ans=ans+"<th>Password</th>";
                              ans=ans+"<th>Delete</th>";
                               for(var i=0;i<arr.length;i++) 
                               {
                                     ans=ans+"<tr>";
                                     ans=ans+"<td>"+arr[i]["name"]+"</td>";
                                     ans=ans+"<td>"+arr[i]["password"]+"</td>";
                                     ans=ans+"<td><button type=\"button\" class=\"btn btn-primary\"  onclick=\"deleteLogic('"+arr[i]["sfid"]+"')\"> Delete </button>"
                                     
                                   ans=ans+"</tr>";
                               } 
                              ans=ans+"</table>";
                              document.getElementById("d1").innerHTML=ans;
                           }
                         };
                    var url = "./fetchStaffResponse";
                xhttp.open("GET", url , true);
               xhttp.send();
        }
        function deleteLogic(sfid)
        {
             var option=confirm("Are you sure you want to delete this entry?");
                if(option)
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
                           
                                setTimeout(fetchStaffLogic,1000);
                               
                        }
                        
                        else
                        {
                            document.getElementById("errormessage").innerHTML="No Data";
                        }
               
                    }
                };
                xhttp.open("GET", "./deleteStaffResponse?sfid="+sfid, true);
                 xhttp.send();
               
        }
        }
        </script>
    </head>
    <body onload="fetchStaffLogic()">
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12" style="background-color: peachpuff">
                    <h2 style="color: green;text-align: center">Add Staff</h2>
                </div>
            </div>
        </div>
        <div style="height: 20px"></div>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2">
                    
                </div>
                <div class="col-sm-8">
                    
            <form>
                <div class="form-group">
                    <label>Enter Staff Name</label>
                    <input type="text" id="name" placeholder="Enter Staff Name" class="form-control"/>
                </div>
                
                <div class="form-group">
                    <label>Enter Password </label>
                    <input type="password" id="password" placeholder="Enter Password" class="form-control"/>
                </div>
                
                <div class="form-group">
                    <%
                        int vcid=Integer.parseInt(request.getParameter("vcid"));
                    %>
                    <input type="button" value="Add" class="btn btn-primary" onclick="addStaffLogic(<%=vcid%>)"/>
                </div>
            </form>
            <h5 id="errormessage" style="color:red">

            </h5>
        </div>
        
                </div>
                <div class="col-sm-2">
                </div>  
            </div>
     
        
        <div style="height: 60px"></div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2">
                    
                </div>
                <div class="col-sm-8" id="d1">
                    
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
            
        </div>
        <div style="height: 60px"></div>
    
        
        
        
        
        
        
        
        
        
         <!-- end copyrights -->
      <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- all js files -->
      
      <!-- all plugins -->
      <script src="js/custom.js"></script>
      <!-- map -->
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNUPWkb4Cjd7Wxo-T4uoUldFjoiUA1fJc&callback=myMap"></script>

    </body>
</html>
