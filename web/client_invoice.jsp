
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="java.util.List"%>
<%@page import="Hibernate.InvoiceItem"%>
<%@page import="Hibernate.UserRegistration"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.Invoice"%>
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
        <link href="css/header.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

       
    </head>

    <body>
         <%
       UserRegistration u1=(UserRegistration)request.getSession().getAttribute("user");
     
       if(u1!=null && u1.getUserType().getIduserType() ==(3)){
      
      %>

        <%@include file="header.jsp" %>
        <section class="container"  style="margin-top: 150px" >
            <table class="table">
                <tr><th>Cake name</th><th>Unit price</th><th>Quantity</th><th>delivery feedback</th><th>Comment</th></tr>
            <%
              if(request.getSession().getAttribute("user")!=null){
                 
                Session s=NewHibernateUtil.getSessionFactory().openSession();
                Criteria cr1=s.createCriteria(Invoice.class);
                UserRegistration u=(UserRegistration)request.getSession().getAttribute("user");
                cr1.add(Restrictions.eq("userRegistration", u)) ;
                cr1.addOrder(Order.desc("idinvoice"));
                cr1.setMaxResults(1);
                Invoice i=(Invoice)cr1.uniqueResult();
                Criteria cr2=s.createCriteria(InvoiceItem.class);
                cr2.add(Restrictions.eq("invoice", i));
                List<InvoiceItem> ini= cr2.list();
                for(InvoiceItem iitem:ini){
                    %>
                <tr><td><%=iitem.getCakestore().getCake().getName() %></td><td><%=iitem.getCakestore().getUnitPrice() %></td><td><%=iitem.getQty() %></td><td><select id="rate" style="height: 30px"><option value="1">very good</option><option value="2">good</option><option value="3">fair</option><option value="4">Bad</option><option value="5">very Bad</option></select></td><td><input type="text" id="comment" style="height: 30px"></td><td><button class="btn btn-color" onclick="save(<%= iitem.getIdinvoiceItem() %>)">Add delivery feedback</button></td></tr>
                   <%
                }
              }
            %>
            </table>
        </section>
        <script type="text/javascript">
             function save(i){
                var rate=document.getElementById("rate").value;
                var comment=document.getElementById("comment").value;
                var request =new  XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                            
                          document.getElementById("main1").innerHTML=request.responseText;
                         // document.getElementById("button").innerHTML=request.responseText.split(",");
                       
                          }
                           
                        }
                        
                };
                request.open("GET","deliveryfeedback?a="+i+"&rate="+rate+"&comment="+comment,true);
                request.send();
            }
            
        </script>>
     

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

