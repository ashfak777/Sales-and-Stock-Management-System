
<%@page import="java.util.List"%>
<%@page import="Hibernate.Seller"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.Category"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Black Lotus Cake Company</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- styles -->
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
        <link href="css/featherpro.css" rel="stylesheet">
        <link href="css/viewdetails.css" rel="stylesheet">
        <link href="css/viewdetails1.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

       
    </head>

    <body onload="load()">

        <%@include file="header.jsp" %>
        <section class="container"  style="margin-top: 150px" >
            <table id="main1" class="table table-bordered">
               
            </table>
        </section>
      
        <%@include file="footer.jsp" %>
        
        <script type="text/javascript">
          function load(){
                
              
                var name=document.getElementById("searchtxt").value;
                
                
                var request =new  XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                            alert(name);
                          document.getElementById("main1").innerHTML=request.responseText;
                         // document.getElementById("button").innerHTML=request.responseText.split(",");
                       
                          }
                           
                        }
                        
                };
                request.open("GET","generalsearch?name="+name);
                request.send();
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

