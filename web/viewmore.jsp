
<%@page import="Hibernate.Cakestore"%>
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
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body >

        <%@include file="header.jsp" %>
        <!-- <div class="col-md-12" style="height: 400px;margin: 200px" >
            
        </div>-->
        
         <section class="container" style="margin-top: 100px" >
             <% 
                 String val=request.getParameter("a");
                 System.out.println(val);
                 Session ses=NewHibernateUtil.getSessionFactory().openSession();
                 Cakestore bs=(Cakestore)ses.load(Cakestore.class, Integer.parseInt(val));
                 String name=bs.getCake().getName();
                 Integer type=bs.getCake().getType();
                 String uprice=bs.getUnitPrice().toString();
                 String qty=bs.getQty().toString();
                 String img1=bs.getCake().getImgurl1();
                 String img2=bs.getCake().getImgurl2();
                 String img3=bs.getCake().getImgurl3();
                 String sname=bs.getCake().getUserRegistration().getFname()+" "+bs.getCake().getUserRegistration().getLname();
                 String smobile=bs.getCake().getUserRegistration().getMobile();
                
             %>
          
            <div class="col-lg-12">
                <h1 class="alert-info">Category:</h1>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4" >
                <div id="mainimg" style="width: 300px ; height:400px ; margin: 10px"><img src=<%=img1 %> ></div>
                <table>
                <tr><button onclick="view('<%=img1 %>')" style="width: 90px ; height:100px ; margin: 10px"><img src=<%=img1 %> ></button></tr>
                <tr><button onclick="view('<%=img2 %>')" style="width: 90px ; height:100px ; margin: 10px"><img src=<%=img2 %> ></button></tr>
                <tr><button onclick="view('<%=img3 %>')" style="width: 90px ; height:100px ; margin: 10px"><img src=<%=img3 %> ></button></tr>
                </table>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4" >
                Name: <%=name %><br>
                page: <%=type %><br>
                Unit price: <%=uprice %><br>
                Quantity: <%=qty %><br>
                <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                    <!-- Identify your business so that you can collect the payments. -->
                    <input type="hidden" name="business" value=<%=bs.getCake().getUserRegistration().getEmail() %>>

                    <!-- Specify a Buy Now button. -->
                    <input type="hidden" name="cmd" value="_xclick">

                    <!-- Specify details about the item that buyers will purchase. -->
                    <input type="hidden" name="item_name" value="Hot Sauce-12oz. Bottle">
                    <input type="hidden" name="amount" value="5.95">
                    <input type="hidden" name="currency_code" value="USD">
                    <input type="hidden" name="return" value="http://localhost:8080/payment_gateway/success.jsp">
                    <input type="hidden" name="cancel_return" value="http://localhost:8080/payment_gateway/error.jsp">

                    <!-- Display the payment button. -->
                    <input type="image" name="submit" border="0"
                           src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif"
                           alt="Buy Now">
                    <img alt="" border="0" width="1" height="1"
                         src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" >

                </form>
            </div>
            <div  class="col-lg-4 col-md-4 col-sm-4" >
                Seller name: <%=sname %><br>
                Mobile : <%=smobile %><br>
            </div>
            
        </section>
        
         
        <!-- Footer
       ================================================== -->
        <%@include file="footer.jsp" %>
        <script type="text/javascript">
            
            function view(i){
              
               var img=document.createElement("img");
               document.getElementById("mainimg").innerHTML="";
               img.setAttribute("src",i);
              document.getElementById("mainimg").appendChild(img);
              
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

