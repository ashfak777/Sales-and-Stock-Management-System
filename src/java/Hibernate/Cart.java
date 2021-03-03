package Hibernate;
// Generated Feb 11, 2020 7:58:15 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Cart generated by hbm2java
 */
public class Cart  implements java.io.Serializable {


     private Integer idcard;
     private UserRegistration userRegistration;
     private String day;
     private Set cartItems = new HashSet(0);

    public Cart() {
    }

	
    public Cart(UserRegistration userRegistration) {
        this.userRegistration = userRegistration;
    }
    public Cart(UserRegistration userRegistration, String day, Set cartItems) {
       this.userRegistration = userRegistration;
       this.day = day;
       this.cartItems = cartItems;
    }
   
    public Integer getIdcard() {
        return this.idcard;
    }
    
    public void setIdcard(Integer idcard) {
        this.idcard = idcard;
    }
    public UserRegistration getUserRegistration() {
        return this.userRegistration;
    }
    
    public void setUserRegistration(UserRegistration userRegistration) {
        this.userRegistration = userRegistration;
    }
    public String getDay() {
        return this.day;
    }
    
    public void setDay(String day) {
        this.day = day;
    }
    public Set getCartItems() {
        return this.cartItems;
    }
    
    public void setCartItems(Set cartItems) {
        this.cartItems = cartItems;
    }




}


