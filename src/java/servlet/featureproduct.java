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
@WebServlet(name = "featureproduct", urlPatterns = {"/featureproduct"})
public class featureproduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Criteria cr= ses.createCriteria(Cake.class);
        cr.addOrder(Order.desc("idcake"));
        cr.setMaxResults(5);
       // Criteria cr1=ses.createCriteria(Bookstore.class);
        Criteria cr2=ses.createCriteria(userregistration.class);
        List<Cake> cake=cr.list();
        JSONArray array=new JSONArray();
        for(Cake b :cake){
            JSONObject u=new JSONObject();
            u.put("name", String.valueOf(b.getName()));
            u.put("imgurl", String.valueOf(b.getImgurl1()));
            u.put("seller", String.valueOf(b.getSeller().getFname()));
            Criteria cr1=ses.createCriteria(Cakestore.class);
            cr1.add(Restrictions.eq("cake", b));
            List<Cakestore> cakestore=cr1.list();
            for(Cakestore bs:cakestore ){
              /// u.put("seller", String.valueOf(bs.getUserRegistration().getFname()));
               u.put("idcale",String.valueOf(bs.getCake().getIdcake()));
               u.put("qty", String.valueOf(bs.getQty()));
               u.put("uprice", String.valueOf(bs.getUnitPrice()));
               array.add(u);
            }
            
        }
        resp.getWriter().write(array.toJSONString());
        } catch (Exception e) {
        }
    }

   
}