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
    private int amount;
    
}
