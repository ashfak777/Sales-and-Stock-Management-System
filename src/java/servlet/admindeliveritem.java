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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author DELL
 */
@WebServlet(name = "admindeliveritem", urlPatterns = {"/admindeliveritem"})
public class admindeliveritem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          try {
          String fr=req.getParameter("a");
          String dstatus=req.getParameter("b");
        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Criteria cr= ses.createCriteria(InvoiceItem.class);
        int pages=0;
       
        cr.setFirstResult(Integer.parseInt(fr));
        cr.setMaxResults(15);
       
        String content="";
        int rcount=0;
        rcount=cr.list().size();
        List<InvoiceItem> invoiceitem=cr.list();
        for(InvoiceItem ii :invoiceitem){
            Criteria cr1=ses.createCriteria(DeliveryDetails.class);
           
            cr1.add(Restrictions.eq("invoiceItem", ii));
            cr1.add(Restrictions.eq("status", dstatus));
            DeliveryDetails dd=(DeliveryDetails) cr1.uniqueResult();
                   if(dd!=null){
                    content+="<tr><td>"+dd.getInvoiceItem().getCakestore().getCake().getName()+"</td><td>"+dd.getInvoiceItem().getQty()+"</td><td>"+dd.getInvoiceItem().getCakestore().getUnitPrice()+"</td><td>"+dd.getInvoiceItem().getCakestore().getCake().getUserRegistration().getFname()+" "+dd.getInvoiceItem().getCakestore().getCake().getUserRegistration().getLname()+"</td><td>"+dd.getInvoiceItem().getCakestore().getCake().getUserRegistration().getEmail()+"</td><td>"+dd.getInvoiceItem().getCakestore().getCake().getUserRegistration().getFname()+" "+dd.getInvoiceItem().getCakestore().getCake().getUserRegistration().getLname()+"</td><td>"+dd.getInvoiceItem().getCakestore().getCake().getUserRegistration().getEmail()+"</td><td>"+dd.getDate().toString()+"</td><td>"+dd.getComplain()+"</td></tr>";
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
        content="<tr><th>Cake Name</th><th>Quantity</th><th>Unit Price</th><th>Client name</th><th>Client Email</th><th>Seller Name</th><th>Seller Email</th><th>deliver date</th><th>Client complain</th></tr>"+content;
        resp.getWriter().write(content+"<br><br><table><tr><td>"+button+"</td></tr></table>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
}
