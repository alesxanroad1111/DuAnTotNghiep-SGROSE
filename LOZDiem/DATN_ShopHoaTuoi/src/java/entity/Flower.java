package entity;

import java.util.Collection;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Flowers")
public class Flower {

    @Id
    @GeneratedValue
    private int id;
    private String name;

    @ManyToOne
    @JoinColumn(name = "typeid")
    private TypesOfFlower typeid;

    private int amount;
    private double price;
    private String image;
    private String notes;
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date createdtime;
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @UpdateTimestamp
    private Date updatedtime;

    @OneToMany(mappedBy = "flowerId", fetch = FetchType.EAGER)
    private Collection<OrdersDetail> orders;

//    public Flower(String name, TypesOfFlower typeid, int amount, double price, String image, String notes) {
//        this.name = name;
//        this.typeid = typeid;
//        this.amount = amount;
//        this.price = price;
//        this.image = image;
//        this.notes = notes;
//
//    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public TypesOfFlower getTypeid() {
        return typeid;
    }

    public void setTypeid(TypesOfFlower typeid) {
        this.typeid = typeid;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
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

    public void setUpdatedtime(Date updatetime) {
        this.updatedtime = updatetime;
    }

    public Collection<OrdersDetail> getOrders() {
        return orders;
    }

    public void setOrders(Collection<OrdersDetail> orders) {
        this.orders = orders;
    }

}
