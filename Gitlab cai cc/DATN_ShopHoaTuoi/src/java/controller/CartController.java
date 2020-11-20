/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import entity.Order;
import entity.OrdersDetail;
import entity.User;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.CartModel;
import org.hibernate.Query;
import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Transactional
@Controller
@RequestMapping("/user/")
public class CartController {

    @Autowired
    SessionFactory factory;
    
    CartModel cartmodel = new CartModel();
    
    @RequestMapping("cart")
    public String cart(ModelMap model) {

        return "user/cart";
    }

    @RequestMapping("delete/{id}")
    public String delete(ModelMap model, @PathVariable("id") String id) {
        Session session = factory.getCurrentSession();
        OrdersDetail oddt = (OrdersDetail) session.get(OrdersDetail.class, id);
        session.delete(oddt);
        return "redirect:/user/cart.htm";

    }

//    @RequestMapping("buy/{id}")
//    public String Buy(ModelMap model, HttpSession httpsession) {
//        model.addAttribute("flower", new Flower());
//        model.addAttribute("flowers", GetFlower());
//        
//        return "user/cart";
//    }
//    @RequestMapping(value = "buy", params = "btnBuy")
//    public String GetFlower(ModelMap model,HttpServletRequest request, HttpSession httpsession) {
//        
//        String yeucau = request.getParameter("yeucau");
//        int masp = 0;
//        if (request.getParameter("txtmasp") != null) {
//            masp = Integer.parseInt(request.getParameter("txtmasp"));
//            System.out.println(masp);
//        }
//        if (yeucau.equals("muasp")) {
//            cartmodel.addProduct(masp); // thêm vào giỏ hàng
//        }
//        request.setAttribute("giohang", cartmodel.getListItems());
//        request.setAttribute("total", cartmodel.getTotal());
//        
//
//        return "user/cart";
//    }

    @RequestMapping(params = "btnInsert")
    public String insert(ModelMap model, @RequestParam("pid") String id, @RequestParam("pname") String name, @RequestParam("pprice") int price) {

        return "student";
    }

    @SuppressWarnings("unchecker")
    public List<OrdersDetail> getOrdersDetails() {
        Session session = factory.getCurrentSession();
        String hql = "FROM OrdersDetail";
        Query query = session.createQuery(hql);
        List<OrdersDetail> list = query.list();
        return list;
    }

    @ModelAttribute("orders")
    @SuppressWarnings("unchecker")
    public List<Order> getOrders() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Order";
        Query query = session.createQuery(hql);
        List<Order> list = query.list();
        return list;
    }

}
