/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Hibernate.NewHibernateUtil;
import Hibernate.UserRegistration;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "sellercontrol", urlPatterns = {"/sellercontrol"})
public class sellercontrol extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
             String id=req.getParameter("id");
             Session s = NewHibernateUtil.getSessionFactory().openSession();
             UserRegistration ur=(UserRegistration) s.load(UserRegistration.class, Integer.parseInt(id));
             ur.setStatus("blacklist");
             s.update(ur);
             Transaction tr = s.beginTransaction();
             tr.commit();
             resp.getWriter().write("Seller deactivated");
             
        } catch (Exception e) {
        }
    }

  
          
}

