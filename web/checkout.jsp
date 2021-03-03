
<%@page import="Hibernate.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Hibernate.CartItem"%>
<%@page import="javax.smartcardio.Card"%>
<%@page import="org.hibernate.criterion.MatchMode"%>
<%@page import="java.util.List"%>
<%@page import="Hibernate.InvoiceItem"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Hibernate.Invoice"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Hibernate.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Black Lotus Cake Company</title>
    </head>
    <body>
        <h1>Cake Outlet Checkout</h1>
        <% 
            try{
            Session s=NewHibernateUtil.getSessionFactory().openSession();
            Cart c=(Cart)s.load(Cart.class,3);
            Criteria cr1=s.createCriteria(CartItem.class);
            cr1.add(Restrictions.eq("cart",c ));
            System.out.println("1ok");
            List<CartItem> citem= cr1.list();
            %>
<!--            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">-->
            <%
            for(CartItem ci:citem){System.out.println("2ok");
            ArrayList<Integer> a1=(ArrayList<Integer>)request.getSession().getAttribute("cid");
            if(a1!=null){
            for(int i=0;i<a1.size();i++){
                a1.remove(i);
            }
            }
               // System.out.println(ci.getBookstore().getIdbookstore()+"nuwan");
            %>
            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
            <%
           // InvoiceItem ii=(InvoiceItem)cr2.uniqueResult();
                System.out.println("111");
                String email=ci.getCakestore().getCake().getUserRegistration().getEmail(); 
                double amount=0.0;
                double x=0.0;
                for(CartItem cil:citem){ 
                    if(cil.getCakestore().getCake().getUserRegistration().getEmail().equals(email)){
                        System.out.println(cil.getQty() * cil.getCakestore().getUnitPrice());
                        amount=cil.getQty()*cil.getCakestore().getUnitPrice();
                        x+=amount;
                        System.out.println("22222");
                       // System.out.println(cil.getcakestore().getIdcakestore()+"ashfak");
                        if(request.getSession().getAttribute("cid")==null){System.out.println("finish");
                            ArrayList<Integer> al=new ArrayList<Integer>();
                            al.add(cil.getIdcardItem());
                            request.getSession().setAttribute("cid", al);//System.out.println(al);
                          //  System.out.println(cil.getcakestore().getIdcakestore()+"loop1");
                        }else{
                        ArrayList<Integer> a=(ArrayList<Integer>)request.getSession().getAttribute("cid");System.out.println(cil.getCakestore().getIdcakestore());
                        a.add(cil.getIdcardItem());  System.out.println("finish");
                         System.out.println(cil.getIdcardItem()+"loop2");
                        }
                    }
                    }
              
              %>
              <h6><%= ci.getCakestore().getCake().getName() %></h6><% System.out.println("finish");%>
              <input type="hidden" name="business" value="<%= ci.getCakestore().getCake().getUserRegistration().getEmail() %>">

  
                <input type="hidden" name="cmd" value="_xclick">
                
                <input type="hidden" name="item_name" value="<%= ci.getCakestore().getCake().getName() %>">
                <input type="hidden" name="amount" value="<%= x %>">
                <input type="hidden" name="currency_code" value="USD">
                <input type="hidden" name="return" value="http://localhost:21949/cake_store/A">
                <input type="hidden" name="cancel_return" value="http://localhost:21949/cake_store/checkout.jsp">
                
                <input type="image" name="submit" border="0"
                src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif"
                alt="Buy Now">
                <img alt="" border="0" width="1" height="1"
                src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" >
            </form>
               <%
               break;
               
             }
             }catch (Exception e) {
            e.printStackTrace();
           }
        %>
            
            <!--</form>-->
    </body>
</html>
