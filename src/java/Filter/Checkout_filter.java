/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import Hibernate.Cakestore;
import Hibernate.CartItem;
import Hibernate.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
@WebFilter(filterName = "Checkout_filter", urlPatterns = "/checkout2.jsp", dispatcherTypes = DispatcherType.FORWARD)
public class Checkout_filter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        try {
            System.out.println("workng");

            HttpServletRequest req = (HttpServletRequest) request;
            // System.out.println(req.getSession().getAttribute("cid"));
            //System.out.println(req.getParameter("x").equals("1"));
            if (req.getSession().getAttribute("cid") != null && !(req.getParameter("x") == null)) {
                System.out.println("okkk");
                Session s = NewHibernateUtil.getSessionFactory().openSession();
                ArrayList<Integer> arr = (ArrayList<Integer>) req.getSession().getAttribute("cid");
                for (Integer ar : arr) {
                    System.out.println(ar + "yessss");
                    CartItem ci = (CartItem) s.load(CartItem.class, ar);
                    Cakestore bs = (Cakestore) s.load(Cakestore.class, ci.getCakestore().getIdcakestore());
                    int qty = bs.getQty();
                    bs.setQty(qty - ci.getQty());
                    s.update(bs);

                    s.delete(ci);
                    arr.remove(ar);
                    Transaction tr = s.beginTransaction();
                    tr.commit();
                    System.out.println(ar + "kk");
                }
                System.out.println("yessss");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        chain.doFilter(request, response);

    }

    @Override
    public void destroy() {

    }

}
