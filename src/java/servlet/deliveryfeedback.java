/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Hibernate.DeliveryDetails;
import Hibernate.InvoiceItem;
import Hibernate.NewHibernateUtil;
import Hibernate.UserRegistration;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "deliveryfeedback", urlPatterns = {"/deliveryfeedback"})
public class deliveryfeedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       Session s = NewHibernateUtil.getSessionFactory().openSession();
            Criteria cr = s.createCriteria(DeliveryDetails.class);
            String a=req.getParameter("a");
            InvoiceItem ii=(InvoiceItem) s.load(InvoiceItem.class,Integer.parseInt(a));
            cr.add(Restrictions.eq("invoiceItem",ii ));
            String rate=req.getParameter("rate");
            String comment=req.getParameter("comment");
            SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
            boolean state=false;
            if(cr.list().isEmpty()){
             DeliveryDetails dd=new DeliveryDetails();
             dd.setFeedback(rate);
             dd.setComplain(comment);
             dd.setInvoiceItem(ii);
             s.save(dd);
            }else{
               DeliveryDetails delivery= (DeliveryDetails) cr.uniqueResult();
               //if(delivery.getFeedback().equals(0)){
               String receiver=delivery.getRevName();
               String status=delivery.getStatus();
//               if use date object
//               Date d=delivery.getDate();
               Date d=delivery.getDate();
               delivery.setFeedback(rate);
               delivery.setComplain(comment);
               delivery.setRevName(receiver);
               delivery.setDate(d);
               delivery.setStatus(status);
               s.update(delivery);
               state=true;
              // }
            }
            Criteria cr1=s.createCriteria(DeliveryDetails.class);
            List<DeliveryDetails> ddetail = cr1.list();
            int count=0;
            for(DeliveryDetails dd:ddetail){
                if((dd.getInvoiceItem().getCakestore().getCake().getUserRegistration().getUid()==ii.getCakestore().getCake().getUserRegistration().getUid()) && !(dd.getFeedback().equals(null))){
                    count++;
                }
            }
            Criteria cr2 = s.createCriteria(UserRegistration.class);
            cr2.add(Restrictions.eq("uid", ii.getCakestore().getCake().getUserRegistration().getUid()));
            UserRegistration ur=(UserRegistration) cr2.uniqueResult();
            int rv=0;
            if(ur.getRate()!=null){
            rv=Integer.parseInt(ur.getRate());
            }
            int rating=count*rv;
            
            int nrate=(Integer.parseInt(rate)+rating)/(count+1);
            UserRegistration r=(UserRegistration) s.load(UserRegistration.class,ii.getCakestore().getCake().getUserRegistration().getUid() );
            if(true){
            r.setRate(nrate+"");
            s.saveOrUpdate(r);
            }
            Transaction tr = s.beginTransaction();
            tr.commit();
    }

   

}
