
<%@page import="java.util.List"%>
<%@page import="Hibernate.UserType"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.UserRegistration"%>
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
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="assets/css/docs.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/color/default.css" rel="stylesheet">
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
          <%
       UserRegistration u1=(UserRegistration)request.getSession().getAttribute("user");
     
       if(u1!=null && u1.getUserType().getIduserType() ==(2)){
      
     %>
    <!--        header-->
    <%@include file="seller_header.jsp" %>
     <!--end header-->
       
        <section class="container" style="margin-top: 150px">
            <table class="table" id="tcontent">
                
             
            
            </table>
        </section>
        
        <script type="text/javascript">
           function search(i){
                
                var request=new XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                         document.getElementById("tcontent").innerHTML=request.responseText;
                         
                              
                        }
                        
                    }
                };
                
                request.open("GET","orderitem?a="+i,true);
                request.send();
            }
        
             function save(j){
                
                var date=document.getElementById("date").value;
              
                var request=new XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                         
                         search(0);
                         alert("Add delivery details");
                              
                        }
                        
                    }
                };
                
                request.open("GET","sellerdelivery?a="+j+"&date="+date,true);
                request.send();
            }
        
        </script>
        <!-- JavaScript Library Files -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.prettyPhoto.js"></script>
        <!-- Template Custom JavaScript File -->
        <script src="assets/js/custom.js"></script>
         <%
         }
      else {
          response.sendRedirect("login.jsp");
  
        }
    
      %>
    </body>
</html>
