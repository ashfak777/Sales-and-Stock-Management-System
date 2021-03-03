
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Hibernate.UserLogin" %>
<%@page import="Model.Forget_Email" %>
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
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
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
        <link href="css/login.css" rel="stylesheet">
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

        <div class="container-fluid" >
            <div  class="col-md-12 " style="margin-top: 250px;"> 
                <div class="row">
                    <!--Right div-->
                    <div class="col-md-8  col-sm-8 col-lg-8" > 
                        <div class="col-md-offset-1 text-center img-responsive" id="sign-image">

                            <div  id="login-div">

                                <table class="table-condensed col-md-offset-2">
                                    <tr >
                                        <td><label>E - mail</label></td>
                                        <td>:</td>
                                        <td  >
                                            <input type="email" required class="form-control" id="mailE" name="loginEmail" style="height: 30px;width: 350px" placeholder="Enter your Email Address">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>Password</label></td>
                                        <td>:</td>
                                        <td >
                                            <input type="password" required class="form-control" id="password" name="loginPassword" style="height: 30px;width: 350px" placeholder="Enter your password">
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <table class="table-condensed col-md-offset-2">
                                    <tr>
                                        <td colspan="3" width="150"><a href="#" data-toggle="modal" data-target=".bs-example-modal-sm">Forget something ?</a></td>

                                        <td ><label style="color: red;" id="msg" ></label></td>

                                    </tr>
                                </table>
                                <table class="table-condensed col-md-offset-3">
                                    <tr>
                                        <td colspan="2"><input type="checkbox" name="rem" class="checkbox"></td>
                                        <td>Remember me</td>
                                    </tr>
                                </table>
                                <br>
                                <div class="form-group" >
                                    <div class="col-sm-offset-4 col-sm-3">
                                        <button type="button" class="btn btn-danger buttonmy" style="width: 200px" onclick="login()">Sign in</button>
                                    </div><br>

                                </div>

                            </div>
                        </div>

                    </div>
                    <!--End Right Div-->

                    <div class="col-md-4  col-sm-4 col-lg-4 text-center" id="login-right-div" style="margin-top: -20px" >
                        <h3 style=" font-weight: bold">Don't you have  account ?</h3>
                        <h4>Get started now. It's fast and easy!</h4>
                        <div class="col-md-6 col-md-offset-3">
                            <a href="Seller_register.jsp"><input type="button" value="Registration" class="btn btn-warning"></a> 
                        </div>
                    </div> 
                    <!--Question & Answer-->
                </div>
            </div>
        </div>
        <!-- Footer
       ================================================== -->
        <%@include file="footer.jsp" %>
        <script type="text/javascript">
            function login() {
                // alert("0");
                var email = document.getElementById("mailE").value;
                var password = document.getElementById("password").value;
                var request = new XMLHttpRequest();

                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            if (request.responseText === '3') {
                                window.location = "index.jsp";
                            } else if (request.responseText === '2') {
                                window.location = "sellerprofile.jsp";
                            } else if (request.responseText === '1') {
                                window.location = "adminprofile.jsp";
                            } else {
                                document.getElementById("msg").innerHTML = request.responseText;

                            }
                        }
                    }
                };

                request.open("POST", "login", true);
                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
                request.send("email=" + email + "&password=" + password);

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
