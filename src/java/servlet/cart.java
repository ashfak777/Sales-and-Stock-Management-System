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
@WebServlet(name = "cart", urlPatterns = {"/cart"})
public class cart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try {
             String sid = req.getParameter("id");
             String qty = req.getParameter("qty");

        boolean isInt = false;

        try {
            Integer.parseInt(qty);
            isInt = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isInt) {
            //valid quantity
            int qty_int = Integer.parseInt(qty);
            Session h_ses = NewHibernateUtil.getSessionFactory().openSession();
            Cakestore bs = (Cakestore) h_ses.load(Cakestore.class, Integer.parseInt(sid));

            if (qty_int <= bs.getQty()) {
               //quantity availabale
                
                if(qty_int >=1){
                  //quantity > 1  
                

                if (req.getSession().getAttribute("user") != null) {
                  //user login
                  //add to db card
                    
                    UserRegistration u=(UserRegistration) req.getSession().getAttribute("user");
                    
                    //cart_search
                    Criteria c1=h_ses.createCriteria(Cart.class);
                    c1.add(Restrictions.eq("userRegistration", u));
                    
                    if(c1.list().isEmpty()){
                        //no cart fount
                        //create new cart
                        
                        Cart c=new Cart();
                        c.setUserRegistration(u);
                        
                        //create  new cart_has_product
                        CartItem ci=new CartItem();
                        ci.setCart(c);
                        ci.setCakestore(bs);
                        ci.setQty(qty_int);
                        
                        h_ses.save(c);
                        h_ses.save(ci);
                        
                        Transaction t=h_ses.beginTransaction();
                        t.commit();
                    }else{
                        //user already has a cart
                        Cart user_cart=(Cart) c1.uniqueResult();
                        
                        Criteria c2=h_ses.createCriteria(CartItem.class);
                        c2.add(Restrictions.eq("cart", user_cart));
                        c2.add(Restrictions.eq("cakestore", bs));
                        
                        if(c2.list().isEmpty()){
                            //this product not fount in user_cart
                            CartItem ci=new CartItem();
                            ci.setCart(user_cart);
                            ci.setCakestore(bs);
                            ci.setQty(qty_int);
                            
                            h_ses.save(ci);
                            
                            Transaction t=h_ses.beginTransaction();
                            t.commit();
                            
                        }else{
                            
                            CartItem ci=(CartItem) c2.uniqueResult();
                            
                            if((ci.getQty()+qty_int)<=bs.getQty()){
                                //product already in your cart.cart update
                                
                                ci.setQty(qty_int+ ci.getQty());
                                h_ses.update(ci);
                                
                                Transaction t=h_ses.beginTransaction();
                                t.commit();
                                
                            }else{
                                //cant update. quantity out of stock
                                resp.getWriter().write("cant update. quantity out of stock");
                            }
                            
                        }
                    }
                    

                } else {
                  // user not login
                  //add to session cart
                    
                    if(req.getSession().getAttribute("cart")!=null){
                        //session contain cart
                        ArrayList<SessionCartItem> sci_list= (ArrayList<SessionCartItem>) req.getSession().getAttribute("cart");
                        
                        if(sci_list.isEmpty()){
                            //no cart item fount
                            SessionCartItem sci=new SessionCartItem();
                            sci.setBs(bs);
                            sci.setQty(qty_int);
                            
                            sci_list.add(sci);
                            resp.getWriter().write("new Item added to the seeion cart");
                            
                        }else{
                            //cart item fount
                            //read session cart item
                            
                            boolean itemAlreadyAdded=false;
                            String msg=null;
                            for(SessionCartItem sci:sci_list){
                                
                                 if(bs.getIdcakestore() == (sci.getBs().getIdcakestore())){
                                     //item already added updates
                                     
                                     itemAlreadyAdded=true;
                                     
                                     if(qty_int+sci.getQty()<=bs.getQty()){
                                        //session cart item updated
                                         sci.setQty(qty_int+sci.getQty());
                                         msg="session cart item updated";
                                     }else{
                                         //cant update session cart.quantity out of stock
                                         msg="cant update session cart.quantity out of stock";
                                         
                                     }
                                     break;
                                     
                                 }
                            } 
                                 if(itemAlreadyAdded){
                                    resp.getWriter().write(msg);  
                                 }else{
                                     //item not in session cart item
                                     SessionCartItem sci=new SessionCartItem();
                                     sci.setBs(bs);
                                     sci.setQty(qty_int);
                                     
                                     sci_list.add(sci);
                                     resp.getWriter().write("item not in session cartlist.New item added to session cart"); 
                                 }
                            
                        }
                        
                    }else{
                       //session not contain cart
                        
                        ArrayList<SessionCartItem> set_list=new ArrayList<>();
                        
                        SessionCartItem sci=new SessionCartItem();
                        sci.setBs(bs);
                        sci.setQty(qty_int);
                        
                        set_list.add(sci);
                        req.getSession().setAttribute("cart", set_list);
                        resp.getWriter().write("new Item added to the session cart");
                        for(SessionCartItem s:set_list){
                            System.out.println(s.getQty());
                            System.out.println(s.getBs().getCake().getName());
                        }
                    }

                }
                
                }else{
                    //quantity <1
                   resp.getWriter().write("quantity <1"); 
                }
            } else {
                //quantity not available
                resp.getWriter().write("Quantity not available");
            }
        } else {
            //invalid quantity
            resp.getWriter().write("invalid quantity");
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
}
