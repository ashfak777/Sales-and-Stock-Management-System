
<%@page import="java.util.List"%>
<%@page import="Hibernate.UserRegistration"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.Cake"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.NewHibernateUtil"%>
<%@page import="Hibernate.Cakestore"%>
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
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="assets/css/docs.css" rel="stylesheet">
        <link href="assets/css/prettyPhoto.css" rel="stylesheet">
        <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">
        <link href="assets/css/flexslider.css" rel="stylesheet">
        <link href="assets/css/sequence.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/color/default.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet">
        <link href="css/featherpro.css" rel="stylesheet">
        <link href="css/viewdetail.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/sellerupload.css" rel="stylesheet">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    </head>

    <body >
         <%
       UserRegistration u1=(UserRegistration)request.getSession().getAttribute("user");
     
       if(u1!=null && u1.getUserType().getIduserType() ==(2)){
      
       %>

        <%@include file="seller_header.jsp" %>
        <!-- <div class="col-md-12" style="height: 400px;margin: 200px" >
            
        </div>-->
        
         <section class="container" style="margin-top: 150px ;margin-bottom: 250px;" >
            
             <div class="table-responsive">
                 <table class="table">  
                     <tr><th>Stock id</th><th>Cake Name</th><th>Page</th><th>Size</th><th>Weight</th><th><a href="">Seller</a></th><th>Quantity</th><th>Unit price</th></tr>
                     <%  if((request.getSession().getAttribute("user") != null)){
                         Session s = NewHibernateUtil.getSessionFactory().openSession();
                        // UserRegistration seller = (UserRegistration) s.load(UserRegistration.class, 1);
                         UserRegistration seller=(UserRegistration)request.getSession().getAttribute("user");
                         Criteria cr = s.createCriteria(Cake.class);
                         cr.add(Restrictions.eq("userRegistration", seller));
                         int id = 0, pages = 0;
                         String name = "", size = "", weight = "", Seller = "";
                         List<Cake> book = cr.list();
                         for (Cake b : book) {
                             id = b.getIdcake();
                             pages = b.getType();
                             name = b.getName();
                             size = b.getSize();
                             weight = b.getWeight();
                            Seller = b.getSeller().getFname() + " " + b.getSeller().getLname();
                             Criteria cr1 = s.createCriteria(Cakestore.class);
                             cr1.add(Restrictions.eq("cake", b));
                             List<Cakestore> bs = cr1.list();
                             for (Cakestore bookstore : bs) {
                          %>
                     <tr><td><%=id %></td><td><%=name %></td><td><%=pages %></td><td><%=size %></td><td><%=weight %></td><td><%=seller %></td><td><%=bookstore.getQty() %></td><td><%=bookstore.getUnitPrice() %></td><td><a href="seller_productedit.jsp?a="<%=bookstore.getIdcakestore()%><button class="btn btn-danger">Edit</button></a></td></tr>
                          <%       
                             }
                         }
                     }
                     %>
                     
             </div>
                 </table>
        </section>
        
         
        <!-- Footer
       ================================================== -->
        <footer class="footer"  >
            <div class="container">
                <div class="row">
                    <div class=" col-lg-4 col-sm-4 col-xs-4">
                        <div class="widget">
                            <h5>Our Services</h5>
                            <ul class="regular">
                                <li><a href="#">Orders Returns</a></li>
                                <li><a href="#">Search Terms</a></li>
                                <li><a href="#">Advanced search</a></li>
                                <li><a href="#">Wholesales</a></li>
                                
                            </ul>
                        </div>
                    </div>
                    <div class=" col-lg-4 col-sm-4 col-xs-4">
                        <div class="widget">
                            <h5>My Account</h5>
                            <ul class="regular">
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">My Cart</a></li>
                                <li><a href="#">Login</a></li>
                                <li><a href="#">Wishlist</a></li>
                                <li><a href="#">Perchases</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class=" col-lg-4 col-sm-4 col-xs-4">
                        <div class="widget">
                            <!-- logo -->
                            <h5>Contact Us</h5>
                            <!-- end logo -->
                            <address>
                                <strong>Registered Companyname, Inc.</strong><br>
                                8895 Somename Ave, Suite 600<br>
                                San Francisco, CA 94107<br>
                                <abbr title="Phone">P:</abbr> (123) 456-7890
                            </address>
                        </div>
                    </div>
                </div>
            </div>
            <div class="verybottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-sm-6 col-xs-6">
                            <p>
                                &copy; Serenity - All right reserved
                            </p>
                        </div>
                        <div class="col-lg-6 col-sm-6 col-xs-6">
                            <div class="credits">
                                Designed by <a href="https://bootstrapmade.com/">Ashfak</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script type="text/javascript">
         
    
           
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
         <%
         }
      else {
          response.sendRedirect("login.jsp");
  
        }
    
      %>

    </body>
</html>

