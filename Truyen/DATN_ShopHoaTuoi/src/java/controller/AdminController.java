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
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
    
    
    
//    @RequestMapping("productsmanage")
//    public String products(ModelMap model) {
//        model.addAttribute("flower", new Flower());
//	model.addAttribute("flowers", getFlowers());
//        return "admin/productsmanage";
//    }
//    
//    @RequestMapping(params = "btnInsert")
//    public String insert(ModelMap model, @ModelAttribute("flower") Flower flower) {
//        System.out.println("in");
//        Session session = factory.openSession();
//        Transaction t = session.beginTransaction();
//        try {
//            session.save(flower);
//            t.commit();
//            model.addAttribute("message", "Thêm mới thành công !");
//        } catch (Exception e) {
//            t.rollback();
//            model.addAttribute("message", "Thêm mới thất bại !");
//        } finally {
//            session.close();
//        }
//        model.addAttribute("flowers", getFlowers());
//        return "admin/productsmanage";
//    }
//
//    @RequestMapping(params = "btnUpdate")
//    public String update(ModelMap model, @ModelAttribute("flower") Flower flower) {
//        Session session = factory.openSession();
//        Transaction t = session.beginTransaction();
//        try {
//            session.update(flower);
//            t.commit();
//            model.addAttribute("message", "Cập nhật thành công !");
//        } catch (Exception e) {
//            t.rollback();
//            model.addAttribute("message", "Cập nhật thất bại !");
//        } finally {
//            session.close();
//        }
//        model.addAttribute("flowers", getFlowers());
//        return "admin/productsmanage";
//    }
//
//    @RequestMapping(params = "btnDelete")
//    public String delete(ModelMap model, Flower flower) {
//        Session session = factory.openSession();
//        Transaction t = session.beginTransaction();
//        try {
//            session.delete(flower);
//            t.commit();
//            model.addAttribute("message", "Xóa thành công !");
//        } catch (Exception e) {
//            t.rollback();
//            model.addAttribute("message", "Xóa thất bại !");
//        } finally {
//            session.close();
//        }
//        model.addAttribute("flower", new Flower());
//        model.addAttribute("flowers", getFlowers());
//        return "admin/productsmanage";
//    }
//
//    @RequestMapping("{id}")
//    public String edit(ModelMap model, @PathVariable("id") Integer id) {
//        Session session = factory.getCurrentSession();
//        Flower flower = (Flower) session.get(Flower.class, id);
//
//        model.addAttribute("flower", flower);
//        model.addAttribute("flowers", getFlowers());
//        return "admin/productsmanage";
//    }
//    
//        @SuppressWarnings("unchecked")
//    public List<Flower> getFlowers() {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower";
//        Query query = session.createQuery(hql);
//        List<Flower> list = query.list();
//        return list;
//    }
//    
    
//    @RequestMapping("ordersmanage")
//    public String orders(ModelMap model) {
//        model.addAttribute("order", new Order());
//	model.addAttribute("orders", getOrders());
//        return "admin/ordersmanage";
//    }
//    
//    @SuppressWarnings("unchecked")
//    public List<Order> getOrders() {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Order";
//        Query query = session.createQuery(hql);
//        List<Order> list = query.list();
//        return list;
//    }
}
