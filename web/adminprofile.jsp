
<%@page import="Hibernate.UserAddress"%>
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
        <link href="css/viewdetails.css" rel="stylesheet" type="text/css">
        <link href="css/profile.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

       
    </head>

    <body>
    <!--        header-->
    <%@include file="admin_header.jsp" %>
     <!--end header-->
       
         <center>
    <div class="container-fluid" style="margin-top: 200px;">
           <%
               UserRegistration u=(UserRegistration)request.getSession().getAttribute("user");
               String name=u.getFname()+" "+u.getLname();
               String email=u.getEmail();
               String mobile=u.getMobile();
               String registerdate=u.getRegisterDate();
               Session ses=NewHibernateUtil.getSessionFactory().openSession();
               Criteria cr=ses.createCriteria(UserAddress.class);
               cr.add(Restrictions.eq("userRegistration", u));
               UserAddress ua=(UserAddress)cr.uniqueResult();
               String address=ua.getAddress();
               
           %>
<!--            <div class="col-md-12">
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-1">
                            <h2 class="alert-success"><b> Profile details</b></h2>
                            <table>
                                <tr>
                                    <td>Email</td>
                                    <td>:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Mobile</td>
                                    <td>:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Register date</td>
                                    <td>:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td>:</td>
                                    <td>></td>
                                </tr>
                            </table>
                        </div>
                        
                    </div>
                </div>
                <div class="col-md-4 ">
                    <img class="profile" src="img/book/pic1.jpg"/>
                </div>

            </div>-->

             <div class="col-md-12 col-lg-12">
                <div class="col-md-8 col-lg-8 tableviver" >
                    <center><h2 class="alert-success"><b><%=name %> Profile details</b></h2></center>
                    <center>
                    <!--<div class="row">-->
                        
                        <!--<div class="col-md-6 col-lg-6 col-md-offset-1">-->
                            
                            <table class="table table-striped">
                                <tr>
                                <tr>
                                    <td>Email</td>
                                    <td>:</td>
                                    <td><%=email %></td>
                                </tr>
                                <tr>
                                    <td>Mobile</td>
                                    <td>:</td>
                                    <td><%=mobile %></td>
                                </tr>
                                <tr>
                                    <td>Register date</td>
                                    <td>:</td>
                                    <td><%=registerdate %></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td>:</td>
                                    <td><%=address %></td>
                                </tr>
                                </tr>
                                <tr>
                                <img src="img/cake/1.png" class="profilepic img-circle">
                                </tr>
                            </table>
                        <!--</div>-->
                       
                    <!--</div>-->
                    </center>            
                </div>
                

            </div>
    </div>
    </center>
        
        <script type="text/javascript">
           function save(id){
                
                var request=new XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                          alert(request.responseText); 
                              
                        }
                        
                    }
                };
                
                request.open("GET","requestcontrol?id="+id,true);
                request.send();
            }
        
        </script>
        <!-- JavaScript Library Files -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.prettyPhoto.js"></script>
        <!-- Template Custom JavaScript File -->
        <script src="assets/js/custom.js"></script>
    </body>
</html>
