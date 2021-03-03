/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import java.util.ArrayList;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SSL", urlPatterns = {"/SSL"})

public class SSL implements HttpSessionListener{

    @Override
    public void sessionCreated(HttpSessionEvent se) {
         ArrayList<Integer> al= new ArrayList<>();
         se.getSession().setAttribute("cid", al);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        
    }

}
