package Hibernate;
// Generated Feb 11, 2020 7:58:15 AM by Hibernate Tools 3.6.0



/**
 * CakeUpload generated by hbm2java
 */
public class CakeUpload  implements java.io.Serializable {


     private Integer idbookupload;
     private Cakestore cakestore;
     private UserRegistration userRegistration;
     private String bname;

    public CakeUpload() {
    }

	
    public CakeUpload(Cakestore cakestore, UserRegistration userRegistration) {
        this.cakestore = cakestore;
        this.userRegistration = userRegistration;
    }
    public CakeUpload(Cakestore cakestore, UserRegistration userRegistration, String bname) {
       this.cakestore = cakestore;
       this.userRegistration = userRegistration;
       this.bname = bname;
    }
   
    public Integer getIdbookupload() {
        return this.idbookupload;
    }
    
    public void setIdbookupload(Integer idbookupload) {
        this.idbookupload = idbookupload;
    }
    public Cakestore getCakestore() {
        return this.cakestore;
    }
    
    public void setCakestore(Cakestore cakestore) {
        this.cakestore = cakestore;
    }
    public UserRegistration getUserRegistration() {
        return this.userRegistration;
    }
    
    public void setUserRegistration(UserRegistration userRegistration) {
        this.userRegistration = userRegistration;
    }
    public String getBname() {
        return this.bname;
    }
    
    public void setBname(String bname) {
        this.bname = bname;
    }




}

