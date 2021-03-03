/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import Hibernate.Cakestore;
import Hibernate.Cart;
import Hibernate.CartItem;
import Hibernate.NewHibernateUtil;
import Hibernate.UserRegistration;
import Model.SessionCartItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "remove", urlPatterns = {"/remove"})
public class remove extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
       String pid=req.getParameter("pid");
       String qty=req.getParameter("qty");System.out.println(qty);
        Session s=NewHibernateUtil.getSessionFactory().openSession();
        
        //get product object by id
            Cakestore bs=(Cakestore) s.load(Cakestore.class, Integer.parseInt(pid));
        
        if(req.getSession().getAttribute("user") != null){
            //user log in
            //get db cart
            UserRegistration u= (UserRegistration) req.getSession().getAttribute("user");
            Criteria c= s.createCriteria(Cart.class);
            c.add(Restrictions.eq("userRegistration", u));
            Cart cart=(Cart) c.uniqueResult();
            Criteria c1 = s.createCriteria(CartItem.class);
            c1.add(Restrictions.eq("cart", cart));
            if(c1.list().isEmpty()){
                
            }else{
                List<CartItem> ci_list=c1.list();
                
                for(CartItem ci: ci_list){
                    if(ci.getCakestore().getIdcakestore() == (bs.getIdcakestore())){
                        
                        if(Integer.parseInt(qty) <= ci.getQty()){
                            ci.setQty(ci.getQty() - Integer.parseInt(qty));
                            
                            if(ci.getQty() ==0){
                                ci_list.remove(ci);
                            }
                            s.save(ci);
                            Transaction tr = s.beginTransaction();
                            tr.commit();
                            resp.getWriter().write("1");
                        }
                    }
                }
            }
        }else{
            //user not log in
            //session cart
            
            ArrayList<SessionCartItem> scil=(ArrayList<SessionCartItem>) req.getSession().getAttribute("cart");
            
            //get sessioncart item one by one
            for(SessionCartItem sci: scil){
                
                if(sci.getBs().getIdcakestore() == (bs.getIdcakestore())){
                    //sci [update product
                    //update qty
                    
                    if(Integer.parseInt(qty) <=sci.getQty()){
                        //update success
                        sci.setQty(sci.getQty()-Integer.parseInt(qty));
                        
                        if(sci.getQty() ==0){
                            scil.remove(sci);
                        }
                        resp.getWriter().write("1");
                        
                        
                    }else{
                        //can't update
                        resp.getWriter().write("Can't Update");
                    }
                    break;
                }
            }
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   
}
