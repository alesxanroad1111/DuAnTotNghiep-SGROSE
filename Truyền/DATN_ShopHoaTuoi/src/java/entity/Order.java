package entity;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Orders")
public class Order {

    @Id
    @GeneratedValue
    private int id;
    
    @ManyToOne
    @JoinColumn(name = "userid")
    private User userid;

    private String address;
    private int totalmoney;
    private int status;
    private int ispaid;
    
    @Generated(GenerationTime.ALWAYS)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    
    private Date createdtime;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    @UpdateTimestamp
    private Date updatedtime;

    
    
    @OneToMany(mappedBy = "orderid", fetch = FetchType.EAGER)
    private Collection<OrdersDetail> ordersdetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(int totalmoney) {
        this.totalmoney = totalmoney;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIspaid() {
        return ispaid;
    }

    public void setIspaid(int ispaid) {
        this.ispaid = ispaid;
    }

    public Date getCreatedtime() {
        return createdtime;
    }

    public void setCreatedtime(Date createdtime) {
        this.createdtime = createdtime;
    }

    public Date getUpdatedtime() {
        return updatedtime;
    }

    public void setUpdatedtime(Date updatedtime) {
        this.updatedtime = updatedtime;
    }

    public User getUserid() {
        return userid;
    }

    public void setUserid(User userid) {
        this.userid = userid;
    }

    public Collection<OrdersDetail> getOrdersdetails() {
        return ordersdetails;
    }

    public void setOrdersdetails(Collection<OrdersDetail> ordersdetails) {
        this.ordersdetails = ordersdetails;
    }

  

}
