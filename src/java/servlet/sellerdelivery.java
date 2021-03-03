/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import Hibernate.DeliveryDetails;
import Hibernate.InvoiceItem;
import Hibernate.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
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
@WebServlet(name = "sellerdelivery", urlPatterns = {"/sellerdelivery"})
public class sellerdelivery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Session s = NewHibernateUtil.getSessionFactory().openSession();
            Criteria cr = s.createCriteria(DeliveryDetails.class);
            String a=req.getParameter("a");
            InvoiceItem ii=(InvoiceItem) s.load(InvoiceItem.class,Integer.parseInt(a));
            cr.add(Restrictions.eq("invoiceItem",ii ));
          //  String receiver=req.getParameter("receiver");
            String date=req.getParameter("date");
            String status="Delivered";
            SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
            if(cr.list().isEmpty()){
             DeliveryDetails dd=new DeliveryDetails();
            // dd.setRevName(receiver);
            //if use date object
//             if(date!=""){ 
//             Date d = sdf.parse(date);
//             dd.setDate(d);
//             }
             dd.setDate(Date.from(Instant.EPOCH));
             dd.setStatus(status);
             dd.setInvoiceItem(ii);
             s.save(dd);
            }else{
               DeliveryDetails delivery= (DeliveryDetails) cr.uniqueResult();
               String feedback=delivery.getFeedback();
              // delivery.setRevName(receiver);
              //if use date object
//               if(date!=""){
//               Date d = sdf.parse(date);
//               delivery.setDate(d);
//               }
               delivery.setDate(Date.from(Instant.EPOCH));
               delivery.setStatus(status);
               delivery.setFeedback(feedback);
               s.update(delivery);
            }
            Transaction tr = s.beginTransaction();
            tr.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}
