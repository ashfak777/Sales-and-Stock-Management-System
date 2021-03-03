/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import Hibernate.Cake;
import Hibernate.Cakestore;
import Hibernate.NewHibernateUtil;
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
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author DELL
 */
@WebServlet(name = "specialcake", urlPatterns = {"/specialcake"})
public class specialcake extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try {
        String fr=req.getParameter("a");
        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Criteria cr= ses.createCriteria(Cake.class);
        cr.addOrder(Order.desc("idcake"));
        int rcount=cr.list().size();
        int pages=0;
        if(rcount%15==0){
           pages=rcount/15; 
        }else{
            pages=rcount/15+1;
        }
        String button="";
        for(int j=0;j<pages;j++){
            button+="<td><input type=\"button\" value=\""+(j+1)+"\" onclick=\"search("+(rcount-j*15)+")\" class=\"btn btn-primary\"></td>";
        }
        //search(rcount-j*15)
        if(fr!="0"){
        cr.setFirstResult(Integer.parseInt(fr));
        }else{
        cr.setFirstResult(rcount);   
        }
        cr.setMaxResults(15);
        Criteria cr2=ses.createCriteria(userregistration.class);
        String content="<tr>";
        //String content="";
        int i=0;
        List<Cake> cake=cr.list();
        for(Cake b :cake){
            if(b.getUserRegistration().getStatus().equals("active")){
            //i++;
            Criteria cr1=ses.createCriteria(Cakestore.class);
            String name=b.getName();
            String imgurl=b.getImgurl1();
            String seller=b.getSeller().getFname();
            int bid=b.getIdcake();
            int bsid=0;
            cr1.add(Restrictions.eq("book", b));
           // cr1.add(Restrictions.ne("unitPrice",'0'));
            List<Cakestore> cakestore=cr1.list();
            String qty=null;
            double lowuprice=0.0;
             int  k=0;
            
            for(Cakestore bs:cakestore ){
                
              //  uprice=bs.getUnitPrice();
                if(lowuprice > bs.getUnitPrice() || k==0){
                    lowuprice=bs.getUnitPrice();
                    qty=bs.getQty().toString();
                    bsid=bs.getIdcakestore();
                    k++;
                }
            }
            if(!cr1.list().isEmpty()){
            i++;
            content+="<td><div>\n" +
"            <div class=\"view\">\n" +
"            <center>\n" +
"                <img src="+imgurl+" class=\"image\">\n" +
"           </center>\n" +
"	    <table>\n" +
"            <tr><td>Name :</td><td>"+name+"</td></tr>\n" +
"            <tr><td>Author :</td><td>"+seller+"</td></tr>\n" +
"            <tr><td>Price :Rs</td><td>"+lowuprice+"</td></tr>\n" +
"            <tr><td>Available :</td><td>"+qty+"</td></tr>\n" +
"	    </table>\n" +
"           <input type=\"text\" id=\"q"+bsid+"\" class=\"txt\">\n" +
"            <button onclick=\"addToCart("+bsid+")\" class=\"btn btn-info btn1\">Add to cart</button>\n" +
"            <span><a href=\"viewmore.jsp?a="+bsid+"\"><button onclick=\"\" class=\"btn btn-link btn1\">View more</button></a></span>\n" +
"            <span><button onclick=\"view("+bsid+")\" class=\"btn btn-color btn1\">Buy Now</button></span>\n" +
"           \n" +
"        </div></td>";
            
             if(i%5==0){
                content+="</tr><tr>";
            }
            }
              System.out.println(bid);
            //}
            }
           
        }
        
        content+="</tr>";
        resp.getWriter().write(content+"<br><br><table><tr><td>"+button+"</td></tr></table>");
        } catch (Exception e) {
        }
    }

   

}
