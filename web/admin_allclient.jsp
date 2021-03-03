
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
        <link href="css/viewseller.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

       
    </head>

    <body onload="load()">
         <%
       UserRegistration u1=(UserRegistration)request.getSession().getAttribute("user");
     
       if(u1!=null && u1.getUserType().getIduserType() == (1)){
      
      %>
    <!--        header-->
    <%@include file="admin_header.jsp" %>
     <!--end header-->
       
        <section class="container" style="margin-top: 150px">
            <% 
             Session s=NewHibernateUtil.getSessionFactory().openSession();
             Criteria cr=s.createCriteria(UserRegistration.class);
             UserType ut=(UserType)s.load(UserType.class, 3);
             cr.add(Restrictions.eq("userType",ut));
             List<UserRegistration> ur=cr.list();
            %>
            
            <span>Seller Name</span><select id="sellername" onchange="load" ><option value="0">All</option><%for(UserRegistration u:ur){ %><option><%=u.getFname()+" "+ u.getLname() %></option><% } %></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span>Seller Email</span><select id="selleremail" onchange="load()" ><option >All</option><%for(UserRegistration u:ur){ %><option><%=u.getEmail() %></option><% } %></select><br><br>
            <div id="main1">
                
            </div>
        </section>
        
        <script type="text/javascript">
            
            function load(){
                
                var name=document.getElementById("sellername").value;
                var email=document.getElementById("selleremail").value;
                var search_object={"name":name,"email":email};
                var request=new XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                         document.getElementById("main1").innerHTML="";
                         var table=document.createElement("table");
                         table.setAttribute("class","table");
                        // table.setAttribute("id","main");
                         var tr1=document.createElement("tr");
                         var d1=document.createElement("td");
                         var d2=document.createElement("td");
                         var d3=document.createElement("td");
                         var d4=document.createElement("td");
                         d1.innerHTML="Name";
                         d2.innerHTML="Email";
                         d3.innerHTML="Mobile";
                         d4.innerHTML="Register date";
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
                               var td6=document.createElement("td");
                               var td7=document.createElement("td");
                               var td8=document.createElement("td");
                               //var br=document.createElement("br");
                               var input=document.createElement("input");
                               input.setAttribute("type","text");
                               input.setAttribute("class","txt1");
                               input.setAttribute("placeholder","type message here");
                               input.setAttribute("id","msg");
                               var button1=document.createElement("button");
                               button1.setAttribute("class","btn btn-color");
                               button1.setAttribute("onclick","msg("+u.uid+")");
                               td1.innerHTML=u.name;
                               td2.innerHTML=u.email;
                               td3.innerHTML=u.mobile;
                               td4.innerHTML=u.registerdate;
                               button1.innerHTML="save";
                               td6.appendChild(input);
                               td7.appendChild(button1)
                               
                               tr.appendChild(td1);
                               tr.appendChild(td2);
                               tr.appendChild(td3);
                               tr.appendChild(td4);
                               tr.appendChild(td6);
                               tr.appendChild(td7);
                               
                               table.appendChild(tr);
                              
                         }
                            document.getElementById("main1").appendChild(table);  
                        }
                        
                    }
                };
                
                request.open("GET","adminallclient?search_object="+JSON.stringify(search_object),true);
                request.send();
            }
            
            
            function msg(userid){
                var msg=document.getElementById("msg").value;
                var request=new XMLHttpRequest();
                
                request.onreadystatechange=function (){
                    if(request.readyState==4){
                        if(request.status===200){
                        //  alert(request.responseText); 
                              
                        }
                        
                    }
                };
                
                request.open("GET","adminmsgsend?id="+userid+"&msg="+msg,true);
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
