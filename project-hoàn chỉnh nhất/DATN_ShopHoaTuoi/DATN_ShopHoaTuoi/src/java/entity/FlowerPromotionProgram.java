/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "FlowerPromotionPrograms")
public class FlowerPromotionProgram {
    @Id
    @GeneratedValue
    private int id;
    @ManyToOne
    @JoinColumn(name = "discountId")
    private DiscountProgram discountId;
    
    @ManyToOne
    @JoinColumn(name = "flowerId")
    private Flower flowerId;
    
    private double typePercent;
    private double typeprice;
    private int amount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public DiscountProgram getDiscountId() {
        return discountId;
    }

    public void setDiscountId(DiscountProgram discountId) {
        this.discountId = discountId;
    }

    public Flower getFlowerId() {
        return flowerId;
    }

    public void setFlowerId(Flower flowerId) {
        this.flowerId = flowerId;
    }

    public double getTypePercent() {
        return typePercent;
    }

    public void setTypePercent(double typePercent) {
        this.typePercent = typePercent;
    }

    public double getTypeprice() {
        return typeprice;
    }

    public void setTypeprice(double typeprice) {
        this.typeprice = typeprice;
    }

    

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    
    
}
