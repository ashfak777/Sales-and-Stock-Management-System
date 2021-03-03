
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

    <body>
        <%
       UserRegistration u1=(UserRegistration)request.getSession().getAttribute("user");
     
       if(u1!=null && u1.getUserType().getIduserType() ==(2)){
      
      %>
    <!--        header-->
    <%@include file="seller_header.jsp" %>
     <!--end header-->
       
        <section class="container" style="margin-top: 150px">
            <center>
            <span class="alert-info">Received message</span><input type="radio" name="type" onchange="load()">&nbsp;&nbsp;&nbsp;
            <span class="alert-info">Send message</span><input type="radio" name="type" onchange="load1()">
            </center>
            <div id="main">
                
            </div>
           
        </section>
        
        <script type="text/javascript">
           function receiveload(){
                
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
            
            function load(){
                document.getElementById("main").innerHTML="";
                var request=new XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                        // document.getElementById("main").innerHTML="";
                         var table=document.createElement("table");
                         table.setAttribute("class","table");
                        // table.setAttribute("id","main");
                         var tr1=document.createElement("tr");
                         var d1=document.createElement("td");
                         var d2=document.createElement("td");
                         var d3=document.createElement("td");
                         var d4=document.createElement("td");
                         d1.innerHTML="Sender name";
                         d2.innerHTML="Type";
                         d3.innerHTML="Date";
                         d4.innerHTML="Message";
                         tr1.appendChild(d1);
                         tr1.appendChild(d2);
                         tr1.appendChild(d3);
                         tr1.appendChild(d4);
                         table.appendChild(tr1);
                         var json_string=request.responseText;
                         
                         var array=JSON.parse(json_string);
                         for(var i=0;i<array.length; i++){
                             var u=array[i];
                             
                               var tr=document.createElement("tr");
                               var td1=document.createElement("td");
                               var td2=document.createElement("td");
                               var td3=document.createElement("td");
                               var td4=document.createElement("td");
                             
                               td1.innerHTML=u.sender;
                               td2.innerHTML=u.type;
                               td3.innerHTML=u.date;
                               td4.innerHTML=u.msg;
                              
                               
                               tr.appendChild(td1);
                               tr.appendChild(td2);
                               tr.appendChild(td3);
                               tr.appendChild(td4);
                                                             
                               table.appendChild(tr);
                              
                         }
                            document.getElementById("main").appendChild(table);  
                        
                        }
                        
                    }
                };
                
                request.open("GET","sellermsg",true);
                request.send();
            }
             function load1(){
                 document.getElementById("main").innerHTML="";
                var request=new XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                        // document.getElementById("main").innerHTML="";
                         var table=document.createElement("table");
                         table.setAttribute("class","table");
                        // table.setAttribute("id","main");
                         var tr1=document.createElement("tr");
                         var d1=document.createElement("td");
                         var d2=document.createElement("td");
                         var d3=document.createElement("td");
                         var d4=document.createElement("td");
                         d1.innerHTML="Sender name";
                         d2.innerHTML="Type";
                         d3.innerHTML="Date";
                         d4.innerHTML="Message";
                         tr1.appendChild(d1);
                         tr1.appendChild(d2);
                         tr1.appendChild(d3);
                         tr1.appendChild(d4);
                         table.appendChild(tr1);
                         var json_string=request.responseText;
                         
                         var array=JSON.parse(json_string);
                         for(var i=0;i<array.length; i++){
                             var u=array[i];
                             
                               var tr=document.createElement("tr");
                               var td1=document.createElement("td");
                               var td2=document.createElement("td");
                               var td3=document.createElement("td");
                               var td4=document.createElement("td");
                             
                               td1.innerHTML=u.receiver;
                               td2.innerHTML=u.type;
                               td3.innerHTML=u.date;
                               td4.innerHTML=u.msg;
                              
                               
                               tr.appendChild(td1);
                               tr.appendChild(td2);
                               tr.appendChild(td3);
                               tr.appendChild(td4);
                                                             
                               table.appendChild(tr);
                              
                         }
                            document.getElementById("main").appendChild(table);  
                        
                        }
                        
                    }
                };
                
                request.open("GET","sellersendmsg",true);
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

y>
</html>
