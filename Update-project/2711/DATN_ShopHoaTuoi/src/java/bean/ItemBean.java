
package bean;

import entity.Flower;


public class ItemBean {
    private Flower product;
    private int quantity;

    public ItemBean() {
    }

    public ItemBean(Flower product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Flower getProduct() {
        return product;
    }

    public void setProduct(Flower product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    
    
    
}
