
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Black Lotus Cake Company</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="assets/css/docs.css" rel="stylesheet">
        <link href="assets/css/prettyPhoto.css" rel="stylesheet">
        <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">
        <link href="assets/css/flexslider.css" rel="stylesheet">
        <link href="assets/css/sequence.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/color/default.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">
        <link href="css/register.css" rel="stylesheet">
        <link href="css/featherpro.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    </head>

    <body>

        <%@include file="header.jsp" %>
       
    <!--  end  Special-->
    <center>
        <div class="container-fluid" style="margin-top: 200px">
           
            <div class="col-md-12 col-sm-12 col-lg-12">
                <div>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-lg-10 col-md-offset-1">
                            <h2 ><b>New Account</b></h2>
                            <h4 >Not our registered customer yet</h4>
                        </div>
                    </div>
                </div>


                <!--form section-->
               <div class="col-md-10 col-sm-10 col-lg-10 col-md-offset-1">
                            <div class="panel panel-register">
                                <div class="panel-heading panel-head-register"><h3>User Registration</h3></div>
                                <div class="panel-body">
                                    <div class="row">
                                        <center>
                                        <table class="table-condensed tablemy">
                                            <tr>
                                                <td width="150">First Name</td>
                                                <td>:</td>
                                                <td width="600">
                                                    <input type="text" style="height:25px ;width: 300px " class="form-control " id="fname" required="required" placeholder="Enter User First Name" id="fname">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Last Name</td>
                                                <td>:</td>
                                                <td>
                                                    <input type="text" style="height:25px ;width: 300px " class="form-control " id="lname" required="required" placeholder="Enter User Last Name" id="lname">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Email</td>
                                                <td>:</td>
                                                <td>
                                                    <input type="email" style="height:25px ;width: 300px "  onchange="emailChange()" class="form-control" id="email" required="required" placeholder="Enter User Email" id="email">
                                                </td>
                                                <td>
                                                    <label id="emailTXT" style="width: 250px; color: red; font-family: sans-serif"></label>
                                                </td>
                                            </tr>
                                           
                                            <tr>
                                                <td>Password Name</td>
                                                <td>:</td>
                                                <td>
                                                    <input type="password" style="height:25px ;width: 300px " class="form-control" id="password" required="required" placeholder="Enter User Password" >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Confirm Password</td>
                                                <td>:</td>
                                                <td>
                                                    <input type="password" style="height:25px ;width: 300px " class="form-control" id="rePassword" onchange="passwordCange()" required="required" placeholder="Confirm User Password" >
                                                </td>
                                                <td><label id="passwordTXT" style="width: 250px; color: red;"></label></td>
                                            </tr>
                                        </table>
                                        </center>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-offset-2">
                                           
                                            <div class="col-md-3 " style="width: 300px">
                                                <input class="buttonmy btn btn-block btn-success" type="submit" value="Submit" onclick="userSave()">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>   
                        </div>  

            </div>
    </div>
    </center>
        <!-- Footer
       ================================================== -->
        <%@include file="footer.jsp" %>
        <script type="text/javascript">
        function userSave(){
           
            var fname=document.getElementById("fname").value; 
            var lname=document.getElementById("lname").value;
            var email=document.getElementById("email").value;
            var password=document.getElementById("password").value;
            var request=new XMLHttpRequest();
                   
                    request.onreadystatechange=function (){
                        if(request.readyState==4){
                            if(request.status==200){
                                
                             //document.getElementById("msg").innerHTML=request.responseText;   
                             window.location='login.jsp';   
                           
                        }
                    }
                    };
                 
                 request.open("POST","userregistration",true);
                 request.setRequestHeader("Content-type","application/x-www-form-urlencoded")
                 request.send("fname="+fname+"&lname="+lname+"&email="+email+"&password="+password);
        
    }
    
    </script>

        <!-- JavaScript Library Files -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.easing.js"></script>
        <script src="assets/js/google-code-prettify/prettify.js"></script>
        <script src="assets/js/modernizr.js"></script>
        <script src="assets/js/bootstrap.js"></script>
        <script src="assets/js/jquery.elastislide.js"></script>
        <script src="assets/js/sequence/sequence.jquery-min.js"></script>
        <script src="assets/js/sequence/setting.js"></script>
        <script src="assets/js/jquery.prettyPhoto.js"></script>
        <script src="assets/js/application.js"></script>
        <script src="assets/js/jquery.flexslider.js"></script>
        <script src="assets/js/hover/jquery-hover-effect.js"></script>
        <script src="assets/js/hover/setting.js"></script>

        <!-- Template Custom JavaScript File -->
        <script src="assets/js/custom.js"></script>

    </body>
</html>
