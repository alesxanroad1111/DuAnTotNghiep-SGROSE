/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import entity.Order;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author truye
 */
@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {
    @Autowired
    SessionFactory factory;
    
    @RequestMapping("productsmanage")
    public String products(ModelMap model) {
        model.addAttribute("flower", new Flower());
	model.addAttribute("flowers", getFlowers());
        return "admin/productsmanage";
    }
        @SuppressWarnings("unchecked")
    public List<Flower> getFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower";
        Query query = session.createQuery(hql);
        List<Flower> list = query.list();
        return list;
    }
    
    @RequestMapping("ordersmanage")
    public String orders(ModelMap model) {
        model.addAttribute("order", new Order());
	model.addAttribute("orders", getOrders());
        return "admin/ordersmanage";
    }
    
    @SuppressWarnings("unchecked")
    public List<Order> getOrders() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Order";
        Query query = session.createQuery(hql);
        List<Order> list = query.list();
        return list;
    }
}
