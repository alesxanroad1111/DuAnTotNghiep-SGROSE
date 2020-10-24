
package bean;

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
    @JoinColumn(name = "TypeId")
    private TypesOfFlower typeid;
    
    private int amount;
    private double price;
    private String image;
    private String note;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date createTime;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date updateTime;

    public Flower() {
    }

    public Flower(String name, double price, String image) {
        this.name = name;
        this.price = price;
        this.image = image;
    }

    public Flower(String id, String name, TypesOfFlower typeid, int amount, double price, String image, String note, Date createTime, Date updateTime) {
        this.id = id;
        this.name = name;
        this.typeid = typeid;
        this.amount = amount;
        this.price = price;
        this.image = image;
        this.note = note;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    
}
