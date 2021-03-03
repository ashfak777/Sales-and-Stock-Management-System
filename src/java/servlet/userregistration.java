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
@WebServlet(name = "userregistration", urlPatterns = {"/userregistration"})
public class userregistration extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fname=req.getParameter("fname");
            String lname=req.getParameter("lname");
            String email=req.getParameter("email");
            String password=req.getParameter("password");
            
            Session ses = NewHibernateUtil.getSessionFactory().openSession();
            
            UserType ut=(UserType) ses.load(UserType.class,3);
            UserRegistration reg=new UserRegistration();
            reg.setFname(fname);
            reg.setLname(lname);
            reg.setEmail(email);
            reg.setPassword(password);
            reg.setUserType(ut);
            Transaction tr = ses.beginTransaction();
            ses.save(reg);
            tr.commit();
            ses.flush();
            ses.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
