/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import Hibernate.NewHibernateUtil;
import Hibernate.UserRegistration;
import Hibernate.UserType;
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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author DELL
 */
@WebServlet(name = "adminallseller", urlPatterns = {"/adminallseller"})
public class adminallseller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
              Session ses=NewHibernateUtil.getSessionFactory().openSession();
              Criteria cr=ses.createCriteria(UserRegistration.class);
              String search_object=req.getParameter("search_object");
              JSONParser parser=new JSONParser();
              JSONObject job=(JSONObject) parser.parse(search_object);
              String name=job.get("name").toString();
              String email=job.get("email").toString();
              cr.add(Restrictions.eq("status","active"));
              if(!name.equals("All")){
               //   cr.add(Restrictions.eq("", name));
              }
              if(!email.equals("All")){
                  cr.add(Restrictions.eq("email", email));System.out.println(email);
              }
              UserType ut=(UserType)ses.load(UserType.class, 2);
              cr.add(Restrictions.eq("userType", ut));
              List<UserRegistration> ur=cr.list();
              JSONArray array=new JSONArray();
            //  String content="";
              for(UserRegistration u:ur){
                  JSONObject jo=new JSONObject();
                  jo.put("name", u.getFname()+" "+u.getLname());
                  jo.put("email", u.getEmail());
                  jo.put("mobile", u.getMobile());
                  jo.put("registerdate", u.getRegisterDate());
                  jo.put("uid", u.getUid());
                  array.add(jo);
              // content+="<tr><td>"+u.getFname()+" "+ u.getLname()+ "</td><td>"+u.getEmail()+"</td><td>"+u.getMobile()+"</td><td>"+u.getRegisterDate()+"</td><td><button class=\"btn btn-color\" onclick=\"save("+ u.getUid()+")\">Deactivate</button></td></tr>";
                
              }
              resp.getWriter().write(array.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   

}
