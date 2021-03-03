/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import Hibernate.Cake;
import Hibernate.Cakestore;
import Hibernate.DeliveryDetails;
import Hibernate.InvoiceItem;
import Hibernate.NewHibernateUtil;
import Hibernate.UserAddress;
import Hibernate.UserRegistration;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author DELL
 */
@WebServlet(name = "solditem", urlPatterns = {"/solditem"})
public class solditem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        double amount,totamount=0;
        String fr=req.getParameter("a");
        String year=req.getParameter("year");
        String month=req.getParameter("month");
        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Criteria cr= ses.createCriteria(Cake.class);
        int pages=0;
       
        cr.setFirstResult(Integer.parseInt(fr));
        cr.setMaxResults(15);
        UserRegistration ur=(UserRegistration) req.getSession().getAttribute("user");
        //UserRegistration ur=(UserRegistration) ses.load(UserRegistration.class, 5);
        cr.add(Restrictions.eq("userRegistration",ur));
        String content="";
        int rcount=0;
        List<Cake> cake=cr.list();
        for(Cake b :cake){
            Criteria cr1=ses.createCriteria(Cakestore.class);
           
            cr1.add(Restrictions.eq("book", b));
            List<Cakestore> cakestore=cr1.list();
          
            for(Cakestore bs:cakestore ){
               rcount++;
                Criteria cr3 = ses.createCriteria(InvoiceItem.class);  
                cr3.add(Restrictions.eq("cakestore", bs));
                List<InvoiceItem> invoiceitem=cr3.list();
 
                for(InvoiceItem item:invoiceitem){
                    Criteria cr2=ses.createCriteria(DeliveryDetails.class);
                    cr2.add(Restrictions.eq("invoiceItem", item));
                 //   cr2.add(Restrictions.eq("status","Delivered"));
                    if(month!=""){
                    if(Integer.parseInt(month)<10){
                    cr2.add(Restrictions.like("date",year+"-0"+month, MatchMode.START));
                    }else {
                     cr2.add(Restrictions.like("date",year+"-"+month, MatchMode.START));        
                    }
                        
                      
                    }
                    DeliveryDetails dd=(DeliveryDetails)cr2.uniqueResult();
                    if(dd!=null){
                        Criteria cr4=ses.createCriteria(UserAddress.class);
                        UserRegistration ur1=dd.getInvoiceItem().getInvoice().getUserRegistration();
                       // UserRegistration ur1=(UserRegistration) ses.load(UserRegistration.class,dd.getInvoiceItem().getInvoice().getUserRegistration().getUid() );
                       // System.out.println(dd.getInvoiceItem().getInvoice().getUserRegistration().getUid());
                        cr4.add(Restrictions.eq("userRegistration", ur1));
                        UserAddress ua=(UserAddress) cr4.uniqueResult();
                        if(ua!=null){
                                amount=dd.getInvoiceItem().getQty()*dd.getInvoiceItem().getCakestore().getUnitPrice();
                                content+="<tr><td>"+dd.getInvoiceItem().getCakestore().getCake().getName()+"</td><td>"+dd.getInvoiceItem().getInvoice().getUserRegistration().getFname()+" "+dd.getInvoiceItem().getInvoice().getUserRegistration().getLname()+"</td><td>"+dd.getInvoiceItem().getQty()+"</td><td>"+dd.getInvoiceItem().getCakestore().getUnitPrice()+"</td><td>"+dd.getInvoiceItem().getCakestore().getCake().getUserRegistration().getMobile()+"</td><td>"+ua.getAddress()+"</td><td>"+dd.getInvoiceItem().getCakestore().getCake().getUserRegistration().getEmail()+"</td><td>"+dd.getComplain()+"</td><td>"+dd.getFeedback()+"</td><td>"+dd.getDate()+"</td><td>"+amount+"</td></tr>";
                                totamount+=amount;
                         }  
                    }
                }
              }
          
            }
                if(rcount%15==0){
                   pages=rcount/15; 
                }else{
                    pages=rcount/15+1;
                }
        String button="";
        for(int j=0;j<pages;j++){
            button+="<td><input type=\"button\" value=\""+j+1+"\" onclick=\"search("+(j*15)+")\" class=\"btn btn-primary\"></tr>";
        }
        content="<tr><th>Cake Name</th><th>Client name</th><th>Quantity</th><th>Unit price</th><th>Mobile</th><th>Address</th><th>Email</th><th>Complain</th><th>Feedback</th><th>Deliver date</th><th>Amont</th></tr>"+content+"<tr><td>Total amount :"+totamount+"</td> </tr>";
        resp.getWriter().write(content+"<br><br><table><tr><td>"+button+"</td></tr></table>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  
}
