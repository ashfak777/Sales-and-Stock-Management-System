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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author DELL
 */
@WebServlet(name = "homespecial", urlPatterns = {"/homespecial"})
public class homespecial extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
       
            Session ses = NewHibernateUtil.getSessionFactory().openSession();
            Criteria cr = ses.createCriteria(Cake.class);
            cr.addOrder(Order.desc("idcake"));
            cr.setMaxResults(5);
            Criteria cr2 = ses.createCriteria(userregistration.class);
            String content = "<tr>";
            JSONArray array=new JSONArray();
            List<Cake> cake = cr.list();
            for (Cake b : cake) {
                JSONObject u=new JSONObject();
                Criteria cr1 = ses.createCriteria(Cakestore.class);
                String name = b.getName();
                String imgurl = b.getImgurl1();
                String seller = b.getSeller().getFname();
                int bid = b.getIdcake();
                int bsid = 0;
                cr1.add(Restrictions.eq("cake", b));
                List<Cakestore> cakestore = cr1.list();
                String qty = null;
                double lowuprice = 0.0;
                int j = 0;
                for (Cakestore bs : cakestore) {
                    

                    //  uprice=bs.getUnitPrice();
                    if (lowuprice > bs.getUnitPrice() || j == 0) {
                        lowuprice = bs.getUnitPrice();
                        qty = bs.getQty().toString();
                        bsid = bs.getIdcakestore();
                        j++;
                    }
                }
                 u.put("name", name);
                 u.put("imgurl", imgurl);
                 u.put("seller", seller);
                 u.put("idcake",String.valueOf(bid));
                 u.put("qty", String.valueOf(qty));
                 u.put("uprice", String.valueOf(lowuprice));
                 u.put("idcakestore",String.valueOf(bsid));
                 array.add(u);

            }

            resp.getWriter().write(array.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}
