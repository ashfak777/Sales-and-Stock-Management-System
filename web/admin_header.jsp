<%@page import="Hibernate.Chat"%>
<%@page import="Hibernate.UserType"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.UserRegistration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.NewHibernateUtil"%>
<header>

           <%  
              Session ses1=NewHibernateUtil.getSessionFactory().openSession();
              Criteria cr1=ses1.createCriteria(UserRegistration.class);
              cr1.add(Restrictions.eq("status","notactive"));
              UserType ut1=(UserType)ses1.load(UserType.class, 2);
              cr1.add(Restrictions.eq("userType", ut1));
              int rcount=cr1.list().size();
              
              Criteria cr2=ses1.createCriteria(Chat.class);
              UserRegistration ur1=(UserRegistration) request.getSession().getAttribute("user");
              cr2.add(Restrictions.eq("userRegistrationByToUser", ur1));
              int mcount=cr2.list().size();
   
            %>      
    <div class="navbar navbar-fixed-top">
        <section class="top-header">
            <div class="container">
                <div class="col-lg-3 col-sm-3 col-xs-3 top-user">
                    <div class="user-name">
                       <img class="" src="img/pic6.png" alt="">
                    </div>
                </div>
                <div class="col-lg-9 col-sm-9 col-xs-9 mainmenu">
                    <nav>
                        <ul>
                            <li>
                                
                            </li>
                            <li >
                                <a href="admin_request.jsp"> <span style="color: red"><%= rcount %></span></span><img src="img/notification.png" style="width: 30px; height: 25px"></a>
                            </li>
                            <li>
                                <a href="adminmessages.jsp"> <span style="color: red"><%=mcount %><img src="img/messages.png" style="width: 30px; height: 25px"></a>
                            </li>
                            <li>
                                <a href="logout"><img src="img/logout.png" style="width: 30px; height: 25px"></a>
                            </li>
                            
                        </ul>
                    </nav>
                </div>
            </div>
        </section>
        <div class="navbar-inner" >
            <div class="container" >

                <!-- logo -->
                <a class="brand logo" href="index.jsp" style="margin-top: 0px"><h1>Black Lotus Cake Company</h1></a>
                <!-- end logo -->
                <!-- top menu -->
                <div class="navigation" >
                    <nav>
                        <ul class="nav topnav">
                            <li class="dropdown active">
                                <a href="admin_profile.jsp">Profile</a>
                            </li>
                            
                            <li class="dropdown">
                                <a href="#">Pages</a>
                                <ul class="dropdown-menu">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </li>
                             <li class="dropdown">
                                <a href="#">Seller</a>
                                <ul class="dropdown-menu">
                                    <li><a href="admin_allseller">All sellers</a></li>
                                    <li><a href="admin_blacklist.jsp">Blacklist seller</a></li>
                                    <li><a href="admin_request.jsp">Seller request</a></li>
                                    <li><a href="admin_allclient.jsp">All Client</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="admin_deliveritem.jsp">Invoice details</a>
                            </li>
                            <li>
                                <a href="adminmessages.jsp">Messages</a>
                            </li>
                            

                        </ul>
                    </nav>
                </div>
                <!-- end menu -->
            </div>
        </div>
    </div>
</header>
