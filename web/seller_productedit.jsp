
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.Cake"%>
<%@page import="Hibernate.UserRegistration"%>
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
        
         <section class="container" style="margin-top: 100px ;margin-bottom: 250px;" >
             
                 <%
                         Session s = NewHibernateUtil.getSessionFactory().openSession();
                         Cakestore b = (Cakestore) s.load(Cakestore.class, 1);
                         int qty=0,pages = 0;
                         double uprice=0.0;
                   
                         String name = "", size = "", weight = "", seller = "",img1,img2,img3;
                        
                             pages = b.getCake().getType();
                             name = b.getCake().getName();
                             size = b.getCake().getSize();
                             weight = b.getCake().getWeight();
                             seller = b.getCake().getSeller().getFname() + " " + b.getCake().getSeller().getLname();
                             qty=b.getQty();
                             uprice=b.getUnitPrice();
                             img1=b.getCake().getImgurl1();
                             img2=b.getCake().getImgurl2();
                             img3=b.getCake().getImgurl3();
                     %>
                     <div class="col-lg-12 col-sm-12 col-xs-12">
                     <center><h2 class="alert-info">Book Upload</h2></center>
                     </div>
                     <div style="margin-left: 200px;">
                 <table>
                         <tr>
                             <td>Cake Name:</td>
                             <td><h4 id="name"><%=name %></h4></td>
                         </tr>
                         <tr>
                             <td>Quantity:</td>
                             <td><input type="text" id="qty" value=<%=qty %>></td>
                         </tr>
                         <tr>
                             <td>Unit Price:</td>
                             <td><input type="text" id="uprice" value=<%=uprice %>></td>
                         </tr>
                         <tr>
                             <td>Type :</td>
                             <td><input type="text" id="page" value=<%=pages %>></td>
                         </tr>
                         <tr>
                             <td>Size:</td>
                             <td><input type="text" id="size" value=<%=size %>></td>
                         </tr>
                         <tr>
                             <td>Weight:</td>
                             <td><input type="text" id="weight" value=<%=weight %>></td>
                         </tr>
                         <tr>
                             <td>seller</td>
                             <td><select id="seller">
                             <option><%=seller %></option>
                             </select></td>
                         </tr>
                 </table>
                 <br><br>
                 <span>Image</span>
                 <label for="f" class="l">
                     <img class="im"  src="img/upload.png">
                 </label>
                 <input type="file"  id="f" class="f" onchange="preview();" style="display: none" multiple="">
                 <img id="preview1"  class="preview" src=<%=img1 %>>
                 <img id="preview2"  class="preview prev2" src=<%=img2 %> >
                 <img id="preview3"  class="preview prev3" src=<%=img3 %> >
                 <br><br>
                 <input type="button"  value="Save" onclick="save();" class="btn btn-success">
                
             </div>
            
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
  
                                Designed by <a href="https://bootstrapmade.com/">ashfak</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script type="text/javascript">
          function preview(){
            
           var file1=document.getElementById("f").files[0];
           var file2=document.getElementById("f").files[1];
           var file3=document.getElementById("f").files[2];
           var reader=new FileReader();
           reader.readAsDataURL(file1);
           var reader1=new FileReader();
           reader1.readAsDataURL(file2);
           var reader2=new FileReader();
           reader2.readAsDataURL(file3);
           
           reader.onload = function(content){
               document.getElementById("preview1").src=content.target.result;
               
           };
            
           reader1.onload = function(content){
               document.getElementById("preview2").src=content.target.result;
               
           };
            
           reader2.onload = function(content){
               document.getElementById("preview3").src=content.target.result;
               
           };
       }
           function save(){
             
                    var name=document.getElementById("name").innerHTML; 
                    var qty=document.getElementById("qty").value;
                    var uprice=document.getElementById("uprice").value;
                    var page=document.getElementById("page").value;
                    var size=document.getElementById("size").value;
                    var weight=document.getElementById("weight").value;
                    var file_chooser=document.getElementById("f");
                    var path1=document.getElementById("preview1").src;
                    var path2=document.getElementById("preview2").src;
                    var path3=document.getElementById("preview3").src;
                    
                    var form=new FormData();
                    form.append("name",name);
                    form.append("qty",qty);
                    form.append("uprice",uprice);
                    form.append("page",page);
                    form.append("size",size);
                    form.append("weight",weight);
                    if(file_chooser.files[0]!=null && file_chooser.files[1]!=null && file_chooser.files[2]!=null){
                    form.append("f1",file_chooser.files[0]);
                    form.append("f2",file_chooser.files[1]);
                    form.append("f3",file_chooser.files[2]);
                    }else{
                    form.append("f1",path1);
                    form.append("f2",path2);
                    form.append("f3",path3); 
                    }
                    var request=new XMLHttpRequest();
                    
                    request.onreadystatechange=function (){
                        if(request.readyState==4 && request.status==200){
                             alert(request.responseText);
                        }
                    };
                    request.open("post","productedit",true);
                    request.send(form);
           
            
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
        <%
         }
      else {
          response.sendRedirect("login.jsp");
  
        }
    
      %>

    </body>
</html>

