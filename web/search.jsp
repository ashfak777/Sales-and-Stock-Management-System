
<%@page import="Hibernate.Cakestore"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="Hibernate.Cake"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.NewHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
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
        <link href="css/header.css" rel="stylesheet">
        <link href="css/featherpro.css" rel="stylesheet" type="text/css" >
        <link href="css/viewdetails.css" rel="stylesheet" type="text/css">
        <link href="css/viewdetails1.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

       
    </head>

    <body >

        <%@include file="header.jsp" %>
        <section class="container"  style="margin-top: 150px" >
           
            <%
                String id = request.getParameter("a");
                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                Criteria cr = ses.createCriteria(Cake.class);
                cr.add(Restrictions.eq("name", id));

                int i = 0;
                List<Cake> book = cr.list();
                for (Cake b : book) {
                    Criteria cr1 = ses.createCriteria(Cakestore.class);
                    if (b.getUserRegistration().getStatus().equals("active")) {
                        String name = b.getName();
                        String imgurl = b.getImgurl1();
                        String seller = b.getSeller().getFname();
                        int bid = b.getIdcake();
                        cr1.add(Restrictions.eq("cake", b));
                        List<Cakestore> bookstore = cr1.list();
                        String qty = null;
                        String uprice = null;
                        for (Cakestore bs : bookstore) {
                            i++;
                            qty = bs.getQty().toString();
                            uprice = bs.getUnitPrice().toString();
            %> 
            <div>
                <div class="view">  
                    <center>
                        <img src=<%=imgurl%> width="150px" height="120px">
                    </center>
                    <table>
                        <tr><td>Name :</td><td><%=name%></td></tr>
                        <tr><td>seller :</td><td><%=seller%></td></tr>
                        <tr><td>Price :Rs</td><td> <%=uprice%></td></tr>
                        <tr><td>Available :</td><td><%=qty%></td></tr>
                    </table>
                    <input type="text" id="q<%=bs.getIdcakestore()%>" class="txt">
                    <button onclick=\"addToCart(<%=bs.getIdcakestore()%>)\" class="btn btn-info btn1">Add to cart</button>
                    <span><a href="viewmore.jsp?a="<%=bs.getIdcakestore()%>"><button onclick=\"\" class="btn btn-link btn1">View more</button></a></span>
                    <span><button onclick="view(<%=bs.getIdcakestore()%>)" class="btn btn-color btn1">Buy Now</button></span>
                </div>
            </div>
            <%
                if (i % 5 == 0) {
            %>
        </tr><tr>
            <%
                            }

                        }
                    }//dfg
                }
            %>

        </tr>

             
        </section>
        
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

    </body>
</html>

