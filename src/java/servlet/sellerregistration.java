/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Hibernate.NewHibernateUtil;
import Hibernate.UserAddress;
import Hibernate.UserRegistration;
import Hibernate.UserType;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author DELL
 */
@WebServlet(name = "sellerregistration", urlPatterns = {"/sellerregistration"})
public class sellerregistration extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try {
            String type=req.getParameter("type");System.out.println(type);
            String fname=req.getParameter("fname");
            String lname=req.getParameter("lname");
            String email=req.getParameter("email");
            String mobile=req.getParameter("mobile");
            String rdate=req.getParameter("rdate");
            String address=req.getParameter("address");
            String password=req.getParameter("password");
           
            Session ses = NewHibernateUtil.getSessionFactory().openSession();
            Criteria c= ses.createCriteria(UserRegistration.class);
            c.add(Restrictions.eq("email", email));
            if(c.list().isEmpty()){
            UserType ut=(UserType) ses.load(UserType.class,2);
            UserType ut1=(UserType) ses.load(UserType.class,3);
            UserRegistration reg=new UserRegistration();
            UserAddress ua=new UserAddress();
            reg.setFname(fname);
            reg.setLname(lname);
            reg.setEmail(email);
            reg.setMobile(mobile);
            reg.setRegisterDate(rdate);
            reg.setPassword(password);
            if(type.equals("Seller")){
            reg.setStatus("notactive");
            reg.setUserType(ut);
            }else{
            reg.setStatus(null);
            reg.setUserType(ut1);   
            }
            ua.setAddress(address);
            ua.setUserRegistration(reg);
            Transaction tr = ses.beginTransaction();
            ses.save(reg);
            ses.save(ua);
            tr.commit();
            ses.flush();
            ses.close();
            resp.getWriter().write("1");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
}
