/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Hibernate.Chat;
import Hibernate.NewHibernateUtil;
import Hibernate.UserRegistration;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author DELL
 */
@WebServlet(name = "sellersendmsg", urlPatterns = {"/sellersendmsg"})
public class sellersendmsg extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        org.hibernate.Session s=NewHibernateUtil.getSessionFactory().openSession();
        Criteria cr=s.createCriteria(Chat.class);
        UserRegistration ur=(UserRegistration) req.getSession().getAttribute("user");
        cr.add(Restrictions.eq("userRegistrationByFromUser", ur));
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        List<Chat> chat=cr.list();
        JSONArray array=new JSONArray();
        for(Chat c:chat){
            JSONObject ob=new JSONObject();
            ob.put("receiver", c.getUserRegistrationByToUser().getFname());
            ob.put("type", c.getUserRegistrationByToUser().getUserType().getUserType());
            ob.put("date", sdf.format(c.getDate()));
            ob.put("msg",c.getMessages());
            array.add(ob);
        }
        resp.getWriter().write(array.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}
