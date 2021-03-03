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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author DELL
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        System.out.println(email + " " + password + "okk");
        Session s = NewHibernateUtil.getSessionFactory().openSession();
        Criteria cr = s.createCriteria(UserRegistration.class);
        cr.add(Restrictions.eq("email", email));
        cr.add(Restrictions.eq("password", password));

        //  UserRegistration ul=(UserRegistration) cr.uniqueResult();
        if (cr.list().isEmpty()) {
            resp.getWriter().write("Invalid user name or password");

        } else {

            HttpSession ses = req.getSession();
            UserRegistration u = (UserRegistration) cr.uniqueResult();
            ses.setAttribute("user", u);
            System.out.println("cart empty.....1");
            if ((req.getSession().getAttribute("cart") != null) && (u.getUserType().getIduserType() == (3))) {
                //session cart fount
                System.out.println("cart empty.....11");
                ArrayList<SessionCartItem> scil = (ArrayList<SessionCartItem>) req.getSession().getAttribute("cart");

                for (SessionCartItem ss : scil) {
                    System.out.println(ss.getQty() + "first");
                }
                if (scil.isEmpty()) {
                    System.out.println("cart empty.....");
                    //session cart empty
                } else {
                    //session cart not empty
                    //login success //session cart fount //have item
                    System.out.println("cart empty.....2");
                    Criteria c1 = s.createCriteria(Cart.class);
                    c1.add(Restrictions.eq("userRegistration", u));

                    if (c1.list().isEmpty()) {
                        //session cart fount no db cart

                        //insert new cart
                        Cart cart = new Cart();
                        cart.setUserRegistration(u);
                        s.save(cart);

                        for (SessionCartItem sci : scil) {
                            //get session cart item one by one

                            //insert new cart has product
                            CartItem ci = new CartItem();
                            ci.setCart(cart);
                            ci.setCakestore(sci.getBs());
                            ci.setQty(sci.getQty());
                            s.save(ci);
                            System.out.println(sci.getQty() + "lol");
                            //remove session cart item
                            // scil.remove(sci);
                        }

                        Transaction t = s.beginTransaction();
                        t.commit();
                    } else {
                        //session cart fount,db cart fount

                        Cart cart = (Cart) c1.uniqueResult();

                        Criteria c2 = s.createCriteria(CartItem.class);
                        c2.add(Restrictions.eq("cart", cart));

                        //user db cart product
                        List<CartItem> chp_list = c2.list();

                        for (SessionCartItem sci : scil) {
                            //read session cart item one by one   
                            for (CartItem cil : chp_list) {
                                //read db cart item one by one
                                if (sci.getBs().getIdcakestore() == (cil.getCakestore().getIdcakestore())) {
                                    //sci fount in db
                                    //update qty

                                    //get product available qty
                                    Cakestore bs = (Cakestore) s.load(Cakestore.class, cil.getCakestore().getIdcakestore());

                                    if (cil.getQty() + sci.getQty() <= bs.getQty()) {
                                        //update db cart

                                        cil.setQty(cil.getQty() + sci.getQty());
                                        s.update(cil);

                                        Transaction t = s.beginTransaction();
                                        t.commit();
                                    } else {
                                        //can't update quantity of stock
                                    }
                                    //remove session cart item
                                    scil.remove(sci);
                                } else {
                                    System.out.println("all right");

                                }
                            }
                        }

                        for (SessionCartItem sci : scil) {
                            CartItem ci = new CartItem();
                            ci.setCart(cart);
                            ci.setCakestore(sci.getBs());
                            ci.setQty(sci.getQty());
                            s.save(ci);

                            Transaction t = s.beginTransaction();
                            t.commit();
                            scil.remove(sci);
                        }
                    }
                }
                // ArrayList<SessionCartItem> new_scil=new ArrayList<SessionCartItem>();
                // req.getSession().setAttribute("cart", new_scil);

                req.getSession().removeAttribute("cart");
            } else {
                //session cart not fount
            }
            if (u.getUserType().getIduserType() == (3)) {
                resp.getWriter().write("3");
            } else if ((u.getUserType().getIduserType() == (2)) && u.getStatus() == ("active")) {
                resp.getWriter().write("2");
            } else if (u.getUserType().getIduserType() == (1)) {
                resp.getWriter().write("1");
            } else {
                resp.getWriter().write("Invalid user");
            }
        }

    }

}
