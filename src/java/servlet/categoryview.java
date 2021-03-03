/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Hibernate.Cakestore;
import Hibernate.Category;
import Hibernate.CategoryHasCake;
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
@WebServlet(name = "categoryview", urlPatterns = {"/categoryview"})
public class categoryview extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try {
        String val=req.getParameter("a");
        String fr=req.getParameter("b");
             System.out.println(val);
        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Category ctgy=(Category) ses.load(Category.class, Integer.parseInt(val));
        Criteria cr1=ses.createCriteria(CategoryHasCake.class);
        cr1.add(Restrictions.eq("category", ctgy));
        int rcount=cr1.list().size();
        int pages=0;
        if(rcount%15==0){
           pages=rcount/15; 
        }else{
            pages=rcount/15+1;
        }
        String button="";
        String content="<tr>";
        int i=0;
        for(int j=0;j<pages;j++){
            button+="<tr><td><input type=\"button\" value=\""+j+1+"\" onclick=\"search("+Integer.parseInt(val)+","+(j*15)+")\" class=\"btn btn-primary\"></td></tr>";
        }
        cr1.setFirstResult(Integer.parseInt(fr));
        cr1.setMaxResults(15);
        List<CategoryHasCake> chplist=cr1.list();
        for(CategoryHasCake chb1:chplist){
       
            Criteria cr2=ses.createCriteria(Cakestore.class);
            String name=chb1.getCake().getName();
            String imgurl=chb1.getCake().getImgurl1();
            String seller=chb1.getCake().getSeller().getFname();
            cr2.add(Restrictions.eq("cake", chb1.getCake()));
            List<Cakestore> cakestore=cr2.list();
            String qty=null;
            String uprice=null;
            for(Cakestore bs:cakestore ){
                i++;
                qty=bs.getQty().toString();
                uprice=bs.getUnitPrice().toString();
            
            content+="<td><div>\n" +
"            <div class=\"view\">\n" +
"            <center>\n" +
"                <img src="+imgurl+" width=\"150px\" height=\"120px\">\n" +
"           </center>\n" +
"	    <table>\n" +
"            <tr><td>Name :</td><td>"+name+"</td></tr>\n" +
"            <tr><td>Seller :</td><td>"+seller+"</td></tr>\n" +
"            <tr><td>Price :Rs</td><td>"+uprice+"</td></tr>\n" +
"            <tr><td>Available :</td><td>"+qty+"</td></tr>\n" +
"	    </table>\n" +
"           <input type=\"text\" id=\"\" class=\"txt\">\n" +
"            &nbsp;&nbsp;\n" +
"            <button onclick=\"\" class=\"btn btn-info btn1\">Add to cart</button>\n" +
"           \n" +
"        </div></td>";
             if(i%5==0){
                content+="</tr><tr>";
            }
            
            }
           
        }
        content+="</tr>";
        resp.getWriter().write(content+"<br><br><table><tr><td>"+button+"</td></tr></table>");
        } catch (Exception e) {
        }
    }

    
}