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
    @JoinColumn(name = "flowerID")
    private Flower flowerID;
    
    private int typePercent;
    private int typeprice;
    private double amount;

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

    public Flower getFlowerID() {
        return flowerID;
    }

    public void setFlowerID(Flower flowerID) {
        this.flowerID = flowerID;
    }

    public int getTypePercent() {
        return typePercent;
    }

    public void setTypePercent(int typePercent) {
        this.typePercent = typePercent;
    }

    public int getTypeprice() {
        return typeprice;
    }

    public void setTypeprice(int typeprice) {
        this.typeprice = typeprice;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

   
    
}
