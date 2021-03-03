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
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author DELL
 */
@WebServlet(name = "search", urlPatterns = {"/search"})
public class search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try {
        String id=req.getParameter("id");
        String fr=req.getParameter("a");
        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Criteria cr= ses.createCriteria(Cake.class);
        cr.add(Restrictions.eq("name",id));
        int rcount=cr.list().size();
        int pages=0;
        if(rcount%15==0){
           pages=rcount/15; 
        }else{
            pages=rcount/15+1;
        }
        String button="";
        for(int j=0;j<pages;j++){
            button+="<tr><td><input type=\"button\" value=\""+j+1+"\" onclick=\"search("+(j*15)+")\" class=\"btn btn-primary\"></td></tr>";
        }
        cr.setFirstResult(Integer.parseInt(fr));
        cr.setMaxResults(15);
        Criteria cr2=ses.createCriteria(userregistration.class);
        String content="<tr>";
        int i=0;
        List<Cake> cake=cr.list();
        for(Cake b :cake){
            Criteria cr1=ses.createCriteria(Cakestore.class);
            if(b.getUserRegistration().getStatus().equals("active")){
            String name=b.getName();
            String imgurl=b.getImgurl1();
            String seller=b.getSeller().getFname();
            int bid=b.getIdcake();
            cr1.add(Restrictions.eq("cake", b));
            List<Cakestore> cakestore=cr1.list();
            String qty=null;
            String uprice=null;
            for(Cakestore bs:cakestore ){
                i++;
                qty=bs.getQty().toString();
                uprice=bs.getUnitPrice().toString();
            
            content+="<td><div>\n" +
"            <div class=\"view\">\n" +
"            <center>\n" +
"                <img src="+imgurl+" class=\"image\">\n" +
"           </center>\n" +
"	    <table>\n" +
"            <tr><td>Name :</td><td>"+name+"</td></tr>\n" +
"            <tr><td>Author :</td><td>"+seller+"</td></tr>\n" +
"            <tr><td>Price :Rs</td><td>"+uprice+"</td></tr>\n" +
"            <tr><td>Available :</td><td>"+qty+"</td></tr>\n" +
"	    </table>\n" +
"           <input type=\"text\" id=\"q"+bs.getIdcakestore()+"\" class=\"txt\">\n" +
"            <button onclick=\"addToCart("+bs.getIdcakestore()+")\" class=\"btn btn-info btn1\">Add to cart</button>\n" +
"            <span><a href=\"viewmore.jsp?a="+bs.getIdcakestore()+"\"><button onclick=\"\" class=\"btn btn-link btn1\">View more</button></a></span>\n" +
"            <span><button onclick=\"view("+bs.getIdcakestore()+")\" class=\"btn btn-color btn1\">Buy Now</button></span>\n" +
"           \n" +
"        </div></td>";
             if(i%5==0){
                content+="</tr><tr>";
              }
              System.out.println(bid);
              }
            }//dfg
            }
           
        
        content+="</tr>";
        resp.getWriter().write(content+"<br><br><table><tr><td>"+button+"</td></tr></table>");
     
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
}

