/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Hibernate.Cakestore;

/**
 *
 * @author DELL
 */
public class SessionCartItem {
    
    private Cakestore bs;
    private int qty;

    /**
     * @return the bs
     */
    public Cakestore getBs() {
        return bs;
    }

    /**
     * @param bs the bs to set
     */
    public void setBs(Cakestore bs) {
        this.bs = bs;
    }

    /**
     * @return the qty
     */
    public int getQty() {
        return qty;
    }

    /**
     * @param qty the qty to set
     */
    public void setQty(int qty) {
        this.qty = qty;
    }
}
