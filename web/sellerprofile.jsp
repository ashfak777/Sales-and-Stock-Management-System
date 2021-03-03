
<%@page import="Hibernate.UserAddress"%>
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
        <link href="css/profile.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    </head>

    <body>
         <%
       UserRegistration u1=(UserRegistration)request.getSession().getAttribute("user");
     
       if(u1.getUserType().getIduserType() ==(2)){
      
      %>
     
        <%@include file="seller_header.jsp" %>
       
    <!--  end  Special-->
    <center>
    <div class="container-fluid" style="margin-top: 200px; margin-bottom: 100px" >
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
                                <img src="img/book/1.png" class="profilepic img-circle">
                                </tr>
                            </table>
                        <!--</div>-->
                       
                    <!--</div>-->
                    </center>            
                </div>
                

            </div>
    </div>
    </center>
        <!-- Footer
       ================================================== -->
        <%@include file="footer.jsp" %>
       

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
        <%
         }
      else {
          response.sendRedirect("login.jsp");
  
        }
    
      %>
    </body>
</html>
