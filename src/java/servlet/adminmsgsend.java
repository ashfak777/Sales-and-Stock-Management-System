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
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
@WebServlet(name = "adminmsgsend", urlPatterns = {"/adminmsgsend"})
public class adminmsgsend extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Session s = NewHibernateUtil.getSessionFactory().openSession();
            String user=req.getParameter("id");
            String msg=req.getParameter("msg");
            UserRegistration ur=(UserRegistration) s.load(UserRegistration.class, Integer.parseInt(user));
            UserRegistration admin=(UserRegistration) req.getSession().getAttribute("user");
           
            Date d=new Date();
            Chat chat=new Chat();
            chat.setDate(d);
            chat.setMessages(msg);
            chat.setStatus("1");
            chat.setUserRegistrationByFromUser(admin);
            chat.setUserRegistrationByToUser(ur);
            s.save(chat);
            Transaction tr = s.beginTransaction();
            tr.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
  

}
