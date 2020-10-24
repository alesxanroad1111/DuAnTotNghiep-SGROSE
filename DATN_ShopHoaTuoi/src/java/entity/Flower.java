
package entity;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Flowers")
public class Flower {
    @Id
    private String id;
    private String name;
    
    @ManyToOne
    @JoinColumn(name = "typeid")
    private TypesOfFlower typeid;
    
    private int amount;
    private double price;
    private String image;
    private String notes;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="MM/dd/yyyy")
    private Date createtimes;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="MM/dd/yyyy")
    private Date updatetimes;

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public Date getCreatetimes() {
        return createtimes;
    }

    public void setCreatetimes(Date createtimes) {
        this.createtimes = createtimes;
    }

    public Date getUpdatetimes() {
        return updatetimes;
    }

    public void setUpdatetimes(Date updatetimes) {
        this.updatetimes = updatetimes;
    }
    
}
