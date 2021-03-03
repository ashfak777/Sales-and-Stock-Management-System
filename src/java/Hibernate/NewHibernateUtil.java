/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author DELL
 */
public class NewHibernateUtil {

    public static SessionFactory sessionFactory;

    private NewHibernateUtil() {
    }

    public static synchronized SessionFactory getSessionFactory() {

        if (sessionFactory == null) {
            sessionFactory = new Configuration().configure("hibernate.cfg.xml").
                    buildSessionFactory();
        }
        return sessionFactory;
    }
}
