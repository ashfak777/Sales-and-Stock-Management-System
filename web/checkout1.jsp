
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.criterion.MatchMode"%>
<%@page import="java.util.List"%>
<%@page import="Hibernate.InvoiceItem"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.Invoice"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.NewHibernateUtil"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Black Lotus Cake Company</title>
    </head>
    <body>
        <% 
            try{
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Criteria cr1=s.createCriteria(Invoice.class);
            cr1.add(Restrictions.eq("idinvoice",10 ));
            Invoice i=(Invoice)cr1.uniqueResult();
            Criteria cr2=s.createCriteria(InvoiceItem.class);
            //cr2.add(Restrictions.like("idinvoiceItem","17",MatchMode.ANYWHERE));
            //cr2.add(Restrictions.eq("idinvoiceItem",1 ));
            cr2.add(Restrictions.eq("invoice", i));
            List<InvoiceItem> iitem= cr2.list();
            %>
            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
            <%
            for(InvoiceItem ii:iitem){
           // InvoiceItem ii=(InvoiceItem)cr2.uniqueResult();
                
              %>
              <h6><%= ii.getCakestore().getCake().getName() %></h6>
              <input type="hidden" name="business" value="<%= ii.getCakestore().getCake().getUserRegistration().getEmail() %>">

  
                <input type="hidden" name="cmd" value="_xclick">

                <input type="hidden" name="item_name" value="<%= ii.getCakestore().getCake().getName() %>">
                <input type="hidden" name="amount" value="<%= ii.getCakestore().getUnitPrice() %>">
                <input type="hidden" name="currency_code" value="USD">
                <input type="hidden" name="return" value="http://localhost:21949/cake_store/checkout.jsp">
                <input type="hidden" name="cancel_return" value="http://localhost:21949/cake_store/checkout.jsp">
                
                <input type="image" name="submit" border="0"
                src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif"
                alt="Buy Now">
                <img alt="" border="0" width="1" height="1"
                src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" >
               <%
           //   break;
             }
             }catch (Exception e) {
            e.printStackTrace();
           }
        %>
    </body>
</html>
