/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Hibernate.Seller;
import Hibernate.Cake;
import Hibernate.Cakestore;
import Hibernate.NewHibernateUtil;
import Hibernate.UserRegistration;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author DELL
 */
@WebServlet(name = "productupload", urlPatterns = {"/productupload"})
public class productupload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String cakename = null, size = null, weight = null;
            int page = 0, qty = 0;
            double uprice = 0;
            Session ses = NewHibernateUtil.getSessionFactory().openSession();
            Cake b = new Cake();
            Cakestore cakestore = new Cakestore();

            DiskFileItemFactory dfi = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(dfi);

            List<FileItem> items = sfu.parseRequest(req);
            for (FileItem i : items) {
                if (i.isFormField()) {
                    if (i.getFieldName().equals("name")) {
                        b.setName(i.getString());
                        cakename = i.getString();
                    } else if (i.getFieldName().equals("size")) {
                        b.setSize(i.getString());
                        size = i.getString();
                    } else if (i.getFieldName().equals("type")) {
                        b.setType(Integer.parseInt(i.getString()));
                        page = Integer.parseInt(i.getString());
                    } else if (i.getFieldName().equals("weight")) {
                        b.setWeight(i.getString());
                        weight = i.getString();
                    } else if (i.getFieldName().equals("qty")) {
                        qty = Integer.parseInt(i.getString());
                    } else if (i.getFieldName().equals("uprice")) {
                        uprice = Integer.parseInt(i.getString());
                    }
                } else {
                    String cake_path1 = null, cake_path2 = null, cake_path3 = null;
                    String path1 = null, path2 = null, path3 = null;
                    if (i.getFieldName().equals("f1")) {
                        cake_path1 = req.getServletContext().getRealPath("/") + "img/cake/" + "img1" + System.currentTimeMillis() + ".png";
                        path1 = "img/book/" + "img1" + System.currentTimeMillis() + ".png";
                        File file_upload1 = new File(cake_path1);
                        i.write(file_upload1);
                        b.setImgurl1(path1);
                    } else if (i.getFieldName().equals("f2")) {
                        cake_path2 = req.getServletContext().getRealPath("/") + "img/cake/" + "img2" + System.currentTimeMillis() + ".png";
                        path2 = "img/book/" + "img2" + System.currentTimeMillis() + ".png";
                        File file_upload2 = new File(cake_path2);
                        i.write(file_upload2);
                        b.setImgurl2(path2);
                    } else if (i.getFieldName().equals("f3")) {
                        cake_path3 = req.getServletContext().getRealPath("/") + "img/cake/" + "img3" + System.currentTimeMillis() + ".png";
                        path3 = "img/book/" + "img3" + System.currentTimeMillis() + ".png";
                        File file_upload3 = new File(cake_path3);
                        i.write(file_upload3);
                        b.setImgurl3(path3);
                    }

                }
            }
            Criteria cr = ses.createCriteria(Cake.class);
            cr.add(Restrictions.eq("name", cakename));
            Cake cake = (Cake) cr.uniqueResult();
            Criteria cr1 = ses.createCriteria(Cakestore.class);
            cr1.add(Restrictions.eq("cake", cake));
            cr1.add(Restrictions.eq("unitPrice", uprice));
            Seller au = (Seller) ses.load(Seller.class, 1);
            UserRegistration u1 = (UserRegistration) req.getSession().getAttribute("user");
            UserRegistration ur = (UserRegistration) ses.load(UserRegistration.class, u1.getUid());
            b.setSeller(au);
            b.setUserRegistration(ur);

            if (cake == null) {
                ses.save(b);
//               bookstore.setQty(qty);
//               bookstore.setUnitPrice(uprice);
//               bookstore.setBook(b);
//               ses.save(bookstore);
            } else {
                Cake cake1 = (Cake) ses.load(Cake.class, cake.getIdcake());
                cake1.setSize(size);
                cake1.setWeight(weight);
                cake1.setType(page);
                ses.update(cake1);

            }

            Cakestore bs = (Cakestore) cr1.uniqueResult();
            if (bs != null) {
                System.out.println("okkkkkkk");
                Cakestore bs2 = (Cakestore) ses.load(Cakestore.class, bs.getIdcakestore());
                int qtycount = bs2.getQty() + qty;
                bs2.setQty(qtycount);
                bs2.setUnitPrice(uprice);
                bs2.setCake(cake);
                ses.update(bs2);
            } else if (bs == null && cake != null) {
                cakestore.setQty(qty);
                cakestore.setUnitPrice(uprice);
                cakestore.setCake(cake);
                ses.save(cakestore);
            } else {
                cakestore.setQty(qty);
                cakestore.setUnitPrice(uprice);
                cakestore.setCake(b);
                ses.save(cakestore);
            }

            Transaction tr = ses.beginTransaction();
            tr.commit();
            resp.getWriter().write("Successfully update the stock");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
