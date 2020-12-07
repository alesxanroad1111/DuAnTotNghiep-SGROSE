/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "DiscountPrograms")
public class DiscountProgram {
    @Id
    @GeneratedValue
    private int id;
    private String name;
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
    private Date dateStart;
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
    private Date dateEnd;
    
    @OneToMany(mappedBy = "discountId", fetch = FetchType.EAGER)
    private Collection<FlowerPromotionProgram> FlowerPromotionPrograms;

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

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public Collection<FlowerPromotionProgram> getFlowerPromotionPrograms() {
        return FlowerPromotionPrograms;
    }

    public void setFlowerPromotionPrograms(Collection<FlowerPromotionProgram> FlowerPromotionPrograms) {
        this.FlowerPromotionPrograms = FlowerPromotionPrograms;
    }
    
    
    
}
