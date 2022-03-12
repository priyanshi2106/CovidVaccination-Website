
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
        function addVaccineData(vcid)
        {
            var vacname=document.getElementById("name").value;
            //alert(vacname);
            var doses=document.getElementById("doses").value;
            var agelimit=document.getElementById("agelimit").value;
            var qty=document.getElementById("qty").value;
            var price=document.getElementById("price").value;
            var date=document.getElementById("date").value;
            if(vacname==""||doses==""||agelimit==""||qty==""||price==""||date=="")
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
                            
                          setTimeout(fetchVaccineDataLogic,1000);
                               
                        }
                        
                        else
                        {
                            document.getElementById("errormessage").innerHTML="Data Already Present";
                        }
               
                    }
                };
                xhttp.open("GET", "./addVaccineDataResponse?vacname="+vacname+"&doses="+doses+"&agelimit="+agelimit+"&price="+price+"&qty="+qty+"&date="+date+"&vcid="+vcid, true);
                 xhttp.send();
        }
    }
    function fetchVaccineDataLogic()
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
                              ans=ans+"<th>Doses</th>";
                              ans=ans+"<th>Price</th>";
                              ans=ans+"<th>AgeLimit</th>";
                              ans=ans+"<th>Quantity</th>";
                              ans=ans+"<th>Date</th>";
                              ans=ans+"<th>Delete</th>";
                               for(var i=0;i<arr.length;i++) 
                               {
                                   ans=ans+"<tr>";
                                     ans=ans+"<td>"+arr[i]["vacname"]+"</td>";
                                     ans=ans+"<td>"+arr[i]["doses"]+"</td>";
                                     ans=ans+"<td>"+arr[i]["price"]+"</td>";
                                     ans=ans+"<td>"+arr[i]["agelimit"]+"</td>";
                                     ans=ans+"<td>"+arr[i]["qty"]+"</td>";
                                     ans=ans+"<td>"+arr[i]["date"]+"</td>";
                                     ans=ans+"<td><button type=\"button\" class=\"btn btn-primary\"  onclick=\"deleteLogic('"+arr[i]["vid"]+"')\"> Delete </button>"
                                     
                                   ans=ans+"</tr>";
                               } 
                              ans=ans+"</table>";
                              document.getElementById("d1").innerHTML=ans;
                           }
                         };
                    var url = "./fetchVaccineDataResponse";
                xhttp.open("GET", url , true);
               xhttp.send();
    }
    function deleteLogic(vid)
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
                           
                                setTimeout(fetchVaccineDataLogic,1000);
                               
                        }
                        
                        else
                        {
                            document.getElementById("errormessage").innerHTML="No Data";
                        }
               
                    }
                };
                xhttp.open("GET", "./deleteVaccineDataResponse?vid="+vid, true);
                 xhttp.send();
                }
            }
            

    </script>
    
    </head>
    <body onload="fetchVaccineDataLogic()" style="background-color: whitesmoke">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12" style="background-color: papayawhip">
                    <h1 style="color: green;text-align: center">Add Vaccine Data</h1>
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
                    <label>Enter Vaccine Name</label>
                    <select class="form-control"id="name" name="name">
                                          <option >Select Vaccine Name</option>
                                          <option>Covishield</option>
                                          <option>Covaxin</option>
                                          <option>Pfizer</option>
                                          <option>Astra Zaneca</option>
                                       </select>
                </div>
                <div class="form-group">
                    <label>Doses </label>
                      <select class="form-control"id="doses" name="doses">
                                          <option >Select Doses</option>
                                          <option>1</option>
                                          <option>2</option>
                                          <option>3</option>
                                          
                                       </select>
                </div>
                
                
                <div class="form-group">
                    <label>Enter Price </label>
                    <input type="text" id="price" placeholder="Enter Price" class="form-control"/>
                </div>
                
                <div class="form-group">
                    <label>Enter Age Limit </label>
                    <input type="text" id="agelimit" placeholder="Enter Age Limit" class="form-control"/>
                </div>
                
                <div class="form-group">
                    <label>Enter Quantity </label>
                    <input type="text" id="qty" placeholder="Enter Quantity" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Enter Date </label>
                    <select class="form-control"id="date" name="date">
                                          <option >Select Date</option>
                                          <option>2021-06-1</option>
                                          <option>2021-05-31</option>
                                          <option>2021-06-2</option>
                                          <option>2021-05-27</option>
                                          <option>2021-05-28</option>
                                          <option>2021-05-29</option>
                                          <option>2021-05-30</option>
                                       </select>
                </div>
                
                
                <div class="form-group">
                    <%
                        int vcid=Integer.parseInt(request.getParameter("vcid"));
                    %>
                    <input type="button" value="Add" class="btn btn-primary" onclick="addVaccineData(<%=vcid%>)"/>
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
