<%@page import="Hibernate.Chat"%>
<%@page import="Hibernate.CartItem"%>
<%@page import="Hibernate.Cart"%>
<%@page import="Hibernate.DeliveryDetails"%>
<%@page import="Hibernate.InvoiceItem"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="Hibernate.UserRegistration"%>
<%@page import="Hibernate.Invoice"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.NewHibernateUtil"%>
<header>
         <%
                int d=0;int ccount=0;int mcount=0;
               if(request.getSession().getAttribute("user")!=null){
                 
                Session s=NewHibernateUtil.getSessionFactory().openSession();
                Criteria cr1=s.createCriteria(Invoice.class);
                UserRegistration u=(UserRegistration)request.getSession().getAttribute("user");
                cr1.add(Restrictions.eq("userRegistration", u)) ;
                List<Invoice> invoice=cr1.list();
                for(Invoice i:invoice){
                Criteria cr2=s.createCriteria(InvoiceItem.class);
                cr2.add(Restrictions.eq("invoice", i));
                List<InvoiceItem> ini= cr2.list();
                for(InvoiceItem iitem:ini){
                    Criteria cr3=s.createCriteria(DeliveryDetails.class);
                    cr3.add(Restrictions.eq("invoiceItem", iitem));
                    cr3.add(Restrictions.eq("feedback","0"));
                    cr3.add(Restrictions.eq("status", "Delivered"));
                    DeliveryDetails dd=(DeliveryDetails)cr3.uniqueResult();
                    if(dd!=null){
                        d++;
                    }
                }
                }
                
              
               
               ///////////////////////////////
                     
                     Criteria c1=s.createCriteria(Cart.class);
                     c1.add(Restrictions.eq("userRegistration",u));
                     
                     Cart cart=(Cart)c1.uniqueResult();
                     
                     Criteria c2=s.createCriteria(CartItem.class);
                     c2.add(Restrictions.eq("cart", cart));
                     
                     ccount=c2.list().size();
                     
                  /////////////////////////////////
                    Criteria cr2=s.createCriteria(Chat.class);
                    UserRegistration ur1=(UserRegistration) request.getSession().getAttribute("user");
                    cr2.add(Restrictions.eq("userRegistrationByToUser", ur1));
                    mcount=cr2.list().size();
                     
               }
            %>
            
           
    <!-- Navbar
    ================================================== -->

    <!--    end header-->
    
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

                                <input type="text"  class="form-control " style="width: 300px; height: 30px; margin-top: 3px" placeholder="Search cake by code/name" name="searchtxt">

                            </li>
                            <li>
                                <button class="btn btn-info" style="margin-top: -7px"  id="bt" >Search</button>
                            </li>
                            <li>
                                <button class="btn btn-color" style="margin-top: -7px"><a href="Advanced_search.jsp" style="margin-top: -7px">Advanced search</a></button>
                            </li>
                            <% if(request.getSession().getAttribute("user")== null){
                             %>
                            <li>
                                <a href="Seller_register.jsp">Register</a>
                            </li>
                            <li>
                                <a href="login.jsp">Login</a>
                            </li>
                             <%
                                }else{
                             %>
                             <li>
                                <a href="logout">Logout</a>
                             </li>
                             <% 
                             }
                             %>
                            <li>
                                <a href="clientmessages.jsp"><span style="color: red"><%=mcount %><img src="img/messages.png" style="width: 30px; height: 25px"></a>
                            </li>
                            <li>
                                <a href="viewcart.jsp"><span style="color: red"><%=ccount %><img src="img/cart.jpg" style="width: 30px; height: 25px"></a>
                            </li>
                            <li>
                                <a href="client_feedback.jsp"><span style="color: red"><%=d %><img src="img/notification.png" style="width: 30px; height: 25px"></a>
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
                                <a href="index.jsp">Home</a>
                            </li>
                            <li class="dropdown">
                                <a href="#">Type</a>
                                <ul class="dropdown-menu">

                                    <li><a href="category.jsp?v=1" id="science fiction">Butter Cake</a></li>
                                    <li><a href="category.jsp?v=2">Fruit Cake</a></li>
                                    <li><a href="category.jsp?v=3">Chiffon Cake</a></li>
                                    <li><a href="category.jsp?v=4">Chocolate Cake</a></li>
                                    <li><a href="category.jsp?v=5">Pound Cake</a></li>
                                    <li><a href="category.jsp?v=6">Carrot Cake</a></li>
                                    <li><a href="category.jsp?v=10">Sponge Cake</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#">Pages</a>
                                <ul class="dropdown-menu">
                                    <li><a href="contact.jsp">About us</a></li>
                                    <li><a href="login.jsp">Login</a></li>
                                    <li><a href="Seller_register.jsp">Register</a></li>
                                    <li><a href="fullwidth.html">FAQ</a></li>
                                    <li><a href="404.html">Logout</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="allcake.jsp">All Cakes</a>
                            </li>
                            <li>
                                <a href="newbook.jsp">Personalised</a>
                            </li>
                            <li>
                                <a href="special.jsp">Special</a>
                            </li>
                            <li>
                                <a href="cinvoices.jsp">Invoice</a>
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