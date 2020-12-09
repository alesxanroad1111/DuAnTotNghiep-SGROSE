/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import bean.ItemBean;
import entity.Flower;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author DiemNgonTrai
 */
public class CartModel {
    
    HashMap<Integer, ItemBean> cart;

    public CartModel() {
        cart = new HashMap<>(); 
    }

    public void addProduct(int productid){
        //Nếu masp có trong giỏ hàng thì ta chỉ ....tăng số lượng lên 1
        if(cart.containsKey(productid)){
            // Lấy item trong giỏ hàng ra và tăng số lượng lên
            ItemBean item = cart.get(productid);
            item.setQuantity(item.getQuantity() + 1); // tăng lên 1
            
        } else {
            // Nếu masp chưa có trong giỏ hàng thì ta thêm item vào giỏ hàng
            //1. lấy ra SanPham dựa vào masp
            Flower product = new FlowerModel().getProductByProductid(productid);
            ItemBean item = new ItemBean(product,1);
            cart.put(productid, item);
        }
    }
    
    // 1. Lấy toàn bộ các món hàng items trong giỏ hàng cart ra ..bỏ vào ArrayList 
    public ArrayList<ItemBean> getListItems() {
        ArrayList<ItemBean> listItems = new ArrayList<>();
        // duyệt hết giỏ hàng cart lấy ra từng item
        // cart.values() : trả về 1 tập các item
        for (ItemBean i : cart.values()) {
            listItems.add(i); // thêm vào danh sách listItems
        }
        return listItems;
    }
    
    public void plusProduct(int productid){
        ItemBean item = cart.get(productid);
        item.setQuantity(item.getQuantity() + 1);
    }
    
    public void minusProduct(int productid){
        ItemBean item = cart.get(productid);
        item.setQuantity(item.getQuantity() - 1);
        if(item.getQuantity() == 0){
            cart.remove(productid);
        }
    }
    
     //1. Xóa từng item trong giỏ hàng dựa vào masp
    public void removeProduct(int productid) {
        cart.remove(productid);
    }

    //2. Xóa hết giỏ hàng
    public void removeAllProduct() {
        cart.clear();
    }

    //3. Tính tổng tiền các sản phẩm chọn trong giỏ hàng
    public double getTotal() {
        double total = 0;
        //duyệt qua từng item trong giỏ hàng cộng dồn
        for (ItemBean i : cart.values()) {
            total = total + i.getQuantity()* i.getProduct().getPrice();
        }
        return total;
    }
    
    
}
