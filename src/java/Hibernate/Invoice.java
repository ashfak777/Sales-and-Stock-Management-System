package Hibernate;
// Generated Feb 11, 2020 7:58:15 AM by Hibernate Tools 3.6.0


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Invoice generated by hbm2java
 */
public class Invoice  implements java.io.Serializable {


     private int idinvoice;
     private UserRegistration userRegistration;
     private Date date;
     private Set invoiceItems = new HashSet(0);

    public Invoice() {
    }

	
    public Invoice(int idinvoice, UserRegistration userRegistration) {
        this.idinvoice = idinvoice;
        this.userRegistration = userRegistration;
    }
    public Invoice(int idinvoice, UserRegistration userRegistration, Date date, Set invoiceItems) {
       this.idinvoice = idinvoice;
       this.userRegistration = userRegistration;
       this.date = date;
       this.invoiceItems = invoiceItems;
    }
   
    public int getIdinvoice() {
        return this.idinvoice;
    }
    
    public void setIdinvoice(int idinvoice) {
        this.idinvoice = idinvoice;
    }
    public UserRegistration getUserRegistration() {
        return this.userRegistration;
    }
    
    public void setUserRegistration(UserRegistration userRegistration) {
        this.userRegistration = userRegistration;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public Set getInvoiceItems() {
        return this.invoiceItems;
    }
    
    public void setInvoiceItems(Set invoiceItems) {
        this.invoiceItems = invoiceItems;
    }




}

