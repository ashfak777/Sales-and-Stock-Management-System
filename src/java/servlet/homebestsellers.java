/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Hibernate.Cake;
import Hibernate.Cakestore;
import Hibernate.InvoiceItem;
import Hibernate.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author DELL
 */
@WebServlet(name = "homebestsellers", urlPatterns = {"/homebestsellers"})
public class homebestsellers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
       
            Session ses = NewHibernateUtil.getSessionFactory().openSession();
            Criteria cr = ses.createCriteria(Cake.class);
            Criteria cr2 = ses.createCriteria(userregistration.class);
            String content = "<tr>";
            TreeMap h=new TreeMap();
            ArrayList<Integer> ar=new ArrayList();
            int sum=0;
            JSONArray array=new JSONArray();
            List<Cake> cake = cr.list();
            for (Cake b : cake) {
               
                Criteria cr1 = ses.createCriteria(Cakestore.class);
                int bid = b.getIdcake();
                int bsid = 0;
                sum=0;
                cr1.add(Restrictions.eq("cake", b));
                List<Cakestore> cakestore = cr1.list();
                int qty = 0;
                double lowuprice = 0.0;
                for (Cakestore bs : cakestore) {
                    int j = 0;
                  
                    Criteria cr3=ses.createCriteria(InvoiceItem.class);
                    cr3.add(Restrictions.eq("cakestore", bs));
                    
                    List<InvoiceItem> ii= cr3.list();
                    for(InvoiceItem i:ii){
                        sum+=i.getQty();
                    }
                }
              //  TreeMap h=new TreeMap();
                if(sum!=0){
                h.put(sum, bid);
                System.out.println(h.get(sum));
                  
                    ar.add((Integer) h.get(sum));
                }
               
               

            }
             Collections.reverse(ar);
             if(ar.size()>=5){
             for(int i=0;i<4;i++){
             Criteria c=ses.createCriteria(Cake.class);
                     int x = ar.get(i);
             c.add(Restrictions.eq("idcake",x));System.out.println(ar.get(i));
           //  c.addOrder(Order.desc("idbook"));
             List<Cake> b2=c.list();
             for(Cake b1:b2){
                 Criteria c1 = ses.createCriteria(Cakestore.class);
                 c1.add(Restrictions.eq("cake", b1));
                 List<Cakestore> bs1=c1.list();
                 for(Cakestore bs:bs1){
                  JSONObject u=new JSONObject();
                 u.put("name", b1.getName());
                 u.put("imgurl", b1.getImgurl1());
                 u.put("seller", b1.getSeller().getFname());
                 u.put("idcake",b1.getIdcake());
                 u.put("qty",String.valueOf(bs.getQty()));
                 u.put("uprice", String.valueOf(bs.getUnitPrice()));
                 u.put("idcakestore",String.valueOf(bs.getIdcakestore()));
                 array.add(u);  
                 }
             }
             }
             }
             else{
               for(int i=0;i<ar.size();i++){
             Criteria c=ses.createCriteria(Cake.class);
                     int x = ar.get(i);
             c.add(Restrictions.eq("idcake",x));System.out.println(ar.get(i));
             List<Cake> b2=c.list();
             for(Cake b1:b2){
                 Criteria c1 = ses.createCriteria(Cakestore.class);
                 c1.add(Restrictions.eq("cake", b1));
                 List<Cakestore> bs1=c1.list();
                 for(Cakestore bs:bs1){
                  JSONObject u=new JSONObject();
                 u.put("name", b1.getName());
                 u.put("imgurl", b1.getImgurl1());
                 u.put("seller", b1.getSeller().getFname());
                 u.put("idcake",b1.getIdcake());
                 u.put("qty",String.valueOf(bs.getQty()));
                 u.put("uprice", String.valueOf(bs.getUnitPrice()));
                 u.put("idcakestore",String.valueOf(bs.getIdcakestore()));
                 array.add(u);  
                 }
             }
             }
             }
           resp.getWriter().write(array.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}
