
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
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

        <%@include file="header.jsp" %>
       
        <section id="subintro" style="margin-top: 200px">
            <center>
            <div class="col-sm-12 col-md-12 col-lg-10 alert-info" style="height: 100px;margin-bottom: 20px;  margin-left: 110px; " >
      
                <h3 >Contact page</h3>
             
           </div>
           </center>
  </section>
    <section id="breadcrumb" >
    <div class="container">
      
          <ul class="breadcrumb notop">
            <li><a href="#">Home</a>
            <li class="active">Contact</li>
          </ul>
        
    </div>
  </section>
  <section id="maincontent">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-sm-4 col-md-4">
          <aside>
            <div class="widget">
              <h4>Get in touch with us</h4>
              <ul>
                <li><label><strong>Phone : </strong></label>
                  <p>
                    +947 888 70729
                  </p>
                </li>
                <li><label><strong>Email : </strong></label>
                  <p>
                    blacklotus@gmail.com
                  </p>
                </li>
                <li><label><strong>Adress : </strong></label>
                  <p>
                    895 Somename Ave, Suite 600 Colombo, Sri Lanka
                  </p>
                </li>
              </ul>
            </div>
            <div class="widget">
              <h4>Social network</h4>
              <ul class="social-links">
                <li><a href="#" title="Twitter"><i class="icon-rounded icon-32 icon-twitter"></i></a></li>
                <li><a href="#" title="Facebook"><i class="icon-rounded icon-32 icon-facebook"></i></a></li>
                <li><a href="#" title="Google plus"><i class="icon-rounded icon-32 icon-google-plus"></i></a></li>
                <li><a href="#" title="Linkedin"><i class="icon-rounded icon-32 icon-linkedin"></i></a></li>
                <li><a href="#" title="Pinterest"><i class="icon-rounded icon-32 icon-pinterest"></i></a></li>
              </ul>
            </div>
          </aside>
        </div>
        <div class="col-lg-8 col-sm-8 col-md-8 ">
          

          <div id="sendmessage">Your message has been sent. Thank you!</div>
          <div id="errormessage"></div>
          <% if(request.getSession().getAttribute("user")!=null){%> 
          <form action="" method="Post">
               <div class="span8 form-group">
                   <% Session s= NewHibernateUtil.getSessionFactory().openSession();
                    Criteria cr= s.createCriteria(UserRegistration.class);
                    List<UserRegistration> ur=cr.list();
                    %>
                    <select id="email"><% for(UserRegistration ur1:ur){ %><option value=<%= ur1.getUid() %> ><%= ur1.getFname()+" "+ur1.getLname() %></option><% }%></select>
               </div>
              <div class="span8 form-group">
                  <textarea id="msg" class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validation"></div>
                <div class="text-center">
                    <button onclick="msgsend()" class="btn btn-color btn-rounded" type="submit">Send message</button>
                </div>
              </div>
          </form>
          <%}else{%>
          <form action="" method="post" role="form" class="contactForm">
            <div class="row">
              <div class="span4 form-group">
                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validation"></div>
              </div>

              <div class="span4 form-group">
                <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                <div class="validation"></div>
              </div>
              <div class="span8 form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validation"></div>
              </div>
              <div class="span8 form-group">
                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validation"></div>
                <div class="text-center">
                    <button onclick="msgsend()" class="btn btn-color btn-rounded" >Send message</button>
                </div>
              </div>
            </div>
          </form>
          <% } %>
        </div>
      </div>
    </div>
  </section>
  <script type="text/javascript">
        function msgsend(){
            
            var id=document.getElementById("email").value;alert(id);
            var msg=document.getElementById("msg").value;alert(msg);
            var request=new XMLHttpRequest();
               
                    request.onreadystatechange=function (){
                        if(request.readyState==4){
                            if(request.status==200){
                                
                        }
                    }
                    };
                    
                 request.open("POST","msgsend",true);
                 request.setRequestHeader("Content-type","application/x-www-form-urlencoded")
                 request.send("id="+id+"&msg="+msg);
        
    }
    </script>
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
