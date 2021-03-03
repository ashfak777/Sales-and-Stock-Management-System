
<%@page import="Model.SessionCartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="Hibernate.CartItem"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="Hibernate.Cart"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.NewHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.UserRegistration"%>
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
        <link href="css/featherpro.css" rel="stylesheet">
        <link href="css/viewdetails.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    </head>

    <body onload="search(0);">
       

        <%@include file="header.jsp" %>
        <!-- <div class="col-md-12" style="height: 400px;margin: 200px" >
            
        </div>-->
        
        <section class="container"  style="margin-top: 150px" >
            <center><h1 class="alert-danger">Cart</h1></center>
        <%
            double total=0.0;
            
        %>
        <table class="table">
            <tr>
                <td>Name</td>
                <td>Price</td>
                <td>Available Quantity</td>
                <td>Cart Quantity</td>
                <%
                if(request.getSession().getAttribute("user")!=null){
                   //user log in
                   //view_db cart 
                 UserRegistration u=(UserRegistration)request.getSession().getAttribute("user");
                 
                 if(u.getCarts().isEmpty()){
                     
                 }else{
                    
                     
                     Session s=NewHibernateUtil.getSessionFactory().openSession();
                     
                     Criteria c1=s.createCriteria(Cart.class);
                     c1.add(Restrictions.eq("userRegistration",u));
                     
                     Cart cart=(Cart)c1.uniqueResult();
                     
                     Criteria c2=s.createCriteria(CartItem.class);
                     c2.add(Restrictions.eq("cart", cart));
                     c2.add(Restrictions.not(Restrictions.eq("qty", 0)));
                    // c2.addOrder(Order.asc("book"));
                     
                     List<CartItem> chp_set=c2.list();
                     for(CartItem ci: chp_set){
                         %>
                        <tr>
                            <td><%= ci.getCakestore().getCake().getName() %></td>
                            <td><%= ci.getCakestore().getUnitPrice() %></td>
                            <td><%= ci.getCakestore().getQty() %></td>
                            <td><%= ci.getQty() %></td>
                            <td><input id="t<%= ci.getCakestore().getIdcakestore()%>" type="text"><button onclick="remove(<%= ci.getCakestore().getIdcakestore()%>);" class="btn btn-danger" style="width: 75px">Remove</button></td>
                            <%
                             total+=ci.getCakestore().getUnitPrice()*ci.getQty();
  
                            %>
                        </tr>
                         <%
                     }
                     
                 }
                 
                }else{
                    //user not login
                    //view session cart
                    if(request.getSession().getAttribute("cart")!=null){
                        //session cart fount
                        
                        ArrayList<SessionCartItem> sci_list= (ArrayList<SessionCartItem>) request.getSession().getAttribute("cart");
                        
                        for(SessionCartItem c1: sci_list){
                         %>
                        <tr>
                            <td><%= c1.getBs().getCake().getName() %></td>
                            <td><%= c1.getBs().getUnitPrice() %></td>
                            <td><%= c1.getBs().getQty() %></td>
                            <td><%= c1.getQty() %></td>
                            <td><input id="t<%= c1.getBs().getIdcakestore()%>" type="text"><button onclick="remove(<%= c1.getBs().getIdcakestore()%>);" class="btn btn-danger" style="width: 75px">Remove</button></td>
                            <%
                             total+=c1.getBs().getUnitPrice()*c1.getQty();
  
                            %>
                        </tr>
                         <%
                       }
                    }else{
                        //no session cart fount
                        
                    }
                }
                %>
            </tr>
        </table>
            
                <h2 id="tot" class="alert-info">Total= <%= total  %></h2>
                <input type="button" value="Check Out" onclick="save();" class="btn btn-color">
        </section>
        
        <!-- Footer
       ================================================== -->
        <%@include file="footer.jsp" %>
        <script type="text/javascript">
         
            
             function remove(bsid){
                    
                    var qty=document.getElementById("t" +bsid).value;
                    
                     var request=new XMLHttpRequest();
                    
                    request.onreadystatechange=function (){
                        if(request.readyState==4 && request.status==200){
                            
                            if(request.responseText=="1"){
                                window.location="viewcart.jsp";
                            }else{
                                alert(request.responseText);
                            }
                        }
                    
                    };
                     
                    request.open("GET","remove?pid="+bsid+"&qty="+qty,true);
                    request.send();
                }
                
                function save(){
           
            var request=new XMLHttpRequest();
               
                    request.onreadystatechange=function (){
                        if(request.readyState==4){
                            if(request.status==200){
                                if(request.responseText === 'notlogin'){
                                    window.location="login.jsp";
                                }else{
                                  //  window.location="client_invoice.jsp";
                                 // alert("cheout succeessfull");
                                 window.location="checkout.jsp";
                                
                            }
                        }
                    }
                    };
                    
                 request.open("POST","addinvoice",true);
                 request.setRequestHeader("Content-type","application/x-www-form-urlencoded")
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

