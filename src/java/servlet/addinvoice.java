/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Hibernate.Cart;
import Hibernate.CartItem;
import Hibernate.DeliveryDetails;
import Hibernate.Invoice;
import Hibernate.InvoiceItem;
import Hibernate.NewHibernateUtil;
import Hibernate.UserRegistration;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author DELL
 */
@WebServlet(name = "addinvoice", urlPatterns = {"/addinvoice"})
public class addinvoice extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if(req.getSession().getAttribute("user")!=null){
            UserRegistration u = (UserRegistration) req.getSession().getAttribute("user");
            Session s = NewHibernateUtil.getSessionFactory().openSession();
            Invoice invoice=new Invoice();
            invoice.setUserRegistration(u);
            //SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Date date=new Date();
            invoice.setDate(date);
            s.save(invoice);
            Criteria cr=s.createCriteria(Cart.class);
            cr.add(Restrictions.eq("userRegistration", u));
            Cart cart=(Cart) cr.uniqueResult();
            Criteria cr1 = s.createCriteria(CartItem.class);
            cr1.add(Restrictions.eq("cart", cart));
            List<CartItem> cartitem=cr1.list();
            for(CartItem ci:cartitem){
                InvoiceItem invoiceitem=new InvoiceItem();
                invoiceitem.setInvoice(invoice);
                invoiceitem.setCakestore(ci.getCakestore());
                invoiceitem.setQty(ci.getQty());
                 s.save(invoiceitem);
                DeliveryDetails dd=new DeliveryDetails();
                dd.setStatus("Not Delivered");
                dd.setFeedback("0");
                dd.setInvoiceItem(invoiceitem);
                s.save(dd);
            }
            Transaction tr = s.beginTransaction();
            tr.commit();
            
            }else{
                resp.getWriter().write("notlogin");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}
