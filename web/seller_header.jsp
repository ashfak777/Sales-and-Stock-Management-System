<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="Hibernate.Chat"%>
<%@page import="Hibernate.UserRegistration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.NewHibernateUtil"%>
<%@page import="org.hibernate.Criteria"%>
<header>

    <!-- Navbar
    ================================================== -->

    <!--    end header-->
    <%
              int mcount=0;
              if(request.getSession().getAttribute("user")!=null){
              Session ses1=NewHibernateUtil.getSessionFactory().openSession();
              Criteria cr2=ses1.createCriteria(Chat.class);
              UserRegistration ur1=(UserRegistration) request.getSession().getAttribute("user");
              cr2.add(Restrictions.eq("userRegistrationByToUser", ur1));
              mcount=cr2.list().size();
              }
    %>
    <div class="navbar navbar-fixed-top">
        <section class="top-header">
            <div class="container">
                <div class="col-lg-3 col-sm-3 col-xs-3 top-user">
                    <div class="user-name">
                        <p>Welcome to CakeStore</p>
                    </div>
                </div>
                <div class="col-lg-9 col-sm-9 col-xs-9 mainmenu">
                    <nav>
                        <ul>
                            <li>
                               <a href="sellermessages.jsp"><span style="color: red"><%=mcount %><img src="img/messages.png" style="width: 30px; height: 25px"></a>
                            </li>
                            <% if(request.getSession().getAttribute("user") == null){ %>
                            <li>
                                <a href="login.jsp">Login</a>
                            </li>
                            <% }else{ %>
                            <li>
                                <a href="logout"><img src="img/logout.png" style="width: 30px; height: 25px"></a>
                            </li>
                            <% } %>
                        </ul>
                    </nav>
                </div>
            </div>
        </section>
        <div class="navbar-inner" >
            <div class="container" >

                <!-- logo -->
                <a class="brand logo" href="index.jsp" style="margin-top: 0px"><h1>Online BookStore</h1></a>
                <!-- end logo -->
                <!-- top menu -->
                <div class="navigation" >
                    <nav>
                        <ul class="nav topnav">
                            <li class="dropdown active">
                                <a href="sellerprofile.jsp">Profile</a>
                            </li>
                            
                            <li class="dropdown">
                                <a href="#">Pages</a>
                                <ul class="dropdown-menu">
                                    <li><a href="contact.jsp">About us</a></li>
                                    <li><a href="login.jsp">Login</a></li>
                                    <li><a href="Seller_register.jsp">Register</a></li>
                                    <li><a href="fullwidth.html">FAQ</a></li>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="seller_upload.jsp">Cake Upload</a>
                            </li>
                            <li>
                                <a href="seller_stock.jsp">Cake Stock</a>
                            </li>
                            <li>
                                <a href="seller_solditem.jsp">Income</a>
                            </li>
                             <li>
                                <a href="seller_order.jsp">Order cake</a>
                            </li>
                            
                            <li>
                                <a href="contact.jsp">Contact</a>
                            </li>

                        </ul>
                    </nav>
                </div>
                <!-- end menu -->
            </div>
        </div>
    </div>
</header>
