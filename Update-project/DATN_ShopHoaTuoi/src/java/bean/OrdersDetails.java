/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author a
 */
public class OrdersDetails {
    
    private int id;
    
    private int orderid;
    
    private int flowerId;
    
    private int price;
    private int amount;
    private int totalprice;
    
    private Date createdtime;
    
    private Date updatedtime;
    
    

    public int getId() {
        return id;
    }

    public void setId(int Id) {
        this.id = Id;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int OrderId) {
        this.orderid = OrderId;
    }

    public int getFlowerId() {
        return flowerId;
    }

    public void setFlowerId(int FlowerId) {
        this.flowerId = FlowerId;
    }

   

    public int getPrice() {
        return price;
    }

    public void setPrice(int Price) {
        this.price = Price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int Amount) {
        this.amount = Amount;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(int Totalprice) {
        this.totalprice = Totalprice;
    }

    public Date getCreatedtime() {
        return createdtime;
    }

    public void setCreatedtime(Date Createdtime) {
        this.createdtime = Createdtime;
    }

    public Date getUpdatedtime() {
        return updatedtime;
    }

    public void setUpdatedtime(Date Updatedtime) {
        this.updatedtime = Updatedtime;
    }
    
    
}
