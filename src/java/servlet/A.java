/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Hibernate.Cakestore;
import Hibernate.CartItem;
import Hibernate.Invoice;
import Hibernate.InvoiceItem;
import Hibernate.NewHibernateUtil;
import Hibernate.UserRegistration;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
@WebServlet(name = "A", urlPatterns = {"/A"})
public class A extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println("workng");
            
        if(req.getSession().getAttribute("cid")!=null ){ System.out.println("okkk");
        Session s = NewHibernateUtil.getSessionFactory().openSession();    
        ArrayList<Integer> arr=(ArrayList<Integer>)req.getSession().getAttribute("cid");
            Invoice i=new Invoice();
            i.setDate(new Date());
            i.setUserRegistration((UserRegistration)req.getSession().getAttribute("user"));
            s.save(i);
        for(Integer ar:arr){
            System.out.println(ar+"aa");
            CartItem ci=(CartItem) s.load(CartItem.class,ar);
            Cakestore bs=(Cakestore) s.load(Cakestore.class, ci.getCakestore().getIdcakestore());
            int qty=bs.getQty();
            bs.setQty(qty-ci.getQty());
            s.update(bs);
            
            s.delete(ci);
            arr.remove(ar);
            
            InvoiceItem ii=new InvoiceItem();
            ii.setInvoice(i);
            ii.setCakestore(bs);
            ii.setQty(ci.getQty());
            s.save(ii);
            Transaction tr = s.beginTransaction();
            tr.commit();
            System.out.println(ar+"kk");
        }
            System.out.println("bb");
        }
        
        } catch (Exception e) {
            e.printStackTrace();
        }
       // resp.sendRedirect("checkout.jsp");
        resp.sendRedirect("viewcart.jsp");
    }

    
}
