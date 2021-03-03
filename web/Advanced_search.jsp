<%-- 
    Document   : Advanced_search
    Created on : Jan 3, 2020, 11:20:14 PM
    Author     : DELL
--%>

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

    <body onload="search(0)">

        <%@include file="header.jsp" %>
        <section class="container"  style="margin-top: 150px" >
            <%
                Session s=NewHibernateUtil.getSessionFactory().openSession();
                Criteria cr1=s.createCriteria(Seller.class);
                Criteria cr2=s.createCriteria(Category.class);
                List<Seller> au = cr1.list();
                List<Category> ct=cr2.list();
             %>
            <center><h2 class="alert-warning">Advanced search</h2></center>
            <div >
                <table class="table">
                    <tr><th>Cake Name</th><th>Code</th><th>Seller</th><th>Type</th><th>Price from</th><th>Price To</th></tr>
                    <tr><td><input type="text" id="name" onkeyup="search(0)" ></td><td><input type="text" id="isbn" ></td>
                        <td><select id="Seller" onchange="search(0)" style="height: 20px"><% for( Seller a:au ){%><option><%= a.getFname() %></option> <%}%></select></td>
                        <td><select id="category" onchange="search(0)" style="height: 20px"><% for( Category c:ct ){%><option><%= c.getCategoryName() %></option> <%}%></select></td>
                        <td><input type="text" id="from" onkeyup="search(0)" style="width: 100px"></td><td><input type="text" id="to" onkeyup="search(0)" style="width: 100px"></tr>
                </table>
            </div>
           
            <table id="main1" class="table table-bordered">
               
            </table>
        </section>
        
        <!-- Footer
       ================================================== -->
        <%@include file="footer.jsp" %>
        
        <script type="text/javascript">
          function search(i){
                
              //  alert("1");
                var name=document.getElementById("name").value;
                var isbn=document.getElementById("colour").value;
                var seller=document.getElementById("seller").value;
                var category=document.getElementById("category").value;
                var from=document.getElementById("from").value;
                var to=document.getElementById("to").value;
                
                var request =new  XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                            
                          document.getElementById("main1").innerHTML=request.responseText;
                         // document.getElementById("button").innerHTML=request.responseText.split(",");
                       
                          }
                           
                        }
                        
                };
                request.open("GET","advancedsearch?a="+i+"&name="+name+"&colour="+isbn+"&seller="+seller+"&category="+category+"&from="+from+"&to="+to,true);
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

