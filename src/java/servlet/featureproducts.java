/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author DELL
 */
@WebServlet(name = "featureproducts", urlPatterns = {"/featureproducts"})
public class featureproducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try {
        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Criteria cr= ses.createCriteria(Cakestore.class);
        cr.addOrder(Order.desc("idcakestore"));
        cr.setMaxResults(5);
       // Criteria cr1=ses.createCriteria(Bookstore.class);
        Criteria cr2=ses.createCriteria(userregistration.class);
        List<Cakestore> cakestore=cr.list();
        JSONArray array=new JSONArray();
        for(Cakestore bs :cakestore){
            JSONObject u=new JSONObject();
            u.put("name", String.valueOf(bs.getCake().getName()));
            u.put("imgurl", String.valueOf(bs.getCake().getImgurl1()));
            u.put("seller", String.valueOf(bs.getCake().getSeller().getFname()+ " "+bs.getCake().getSeller().getLname()));
               u.put("idcake",String.valueOf(bs.getCake().getIdcake()));
               u.put("qty", String.valueOf(bs.getQty()));
               u.put("uprice", String.valueOf(bs.getUnitPrice()));
               u.put("idcakestore",String.valueOf(bs.getIdcakestore()));
               array.add(u);
           // }
            
        }
        resp.getWriter().write(array.toJSONString());
        } catch (Exception e) {
        }
    }

   
}
