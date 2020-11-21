/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import entity.Order;
import entity.OrdersDetail;
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
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author truye
 */
@Transactional
@Controller
@RequestMapping("/admin/")
public class orderController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("/ordersmanage")
    public String orders(ModelMap model) {
        model.addAttribute("order", new Order());
        model.addAttribute("orders", getOrders());
        return "admin/ordersmanage";
    }

    @RequestMapping(value = "ordersmanage",method = RequestMethod.GET, params = "btnInsert")
    public String insert1(ModelMap model, @ModelAttribute("order") Order order) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            System.out.println(order);
            session.save(order);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("orders", getOrders());
        return "admin/ordersmanage";
    }
    
    @RequestMapping("delete1/{id}")
	public String delete1(ModelMap model, @PathVariable("id") int id) {
		Session session = factory.getCurrentSession();
		Order order = (Order) session.get(Order.class, id);
		session.delete(order);
		return "redirect:/admin/ordersmanage.htm";
               
	}

    @RequestMapping(value = "ordersmanage",method = RequestMethod.GET, params = "btnUpdate")
    public String update1(ModelMap model, @ModelAttribute("order") Order order) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(order);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("orders", getOrders());
        return "admin/ordersmanage";
    }


    @RequestMapping(method = RequestMethod.GET, params = "btnReset")
    public String reset1(ModelMap model, Order order) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        {
            session.clear();
            t.commit();
        }
        model.addAttribute("order", new Order());
        model.addAttribute("orders", getOrders());
        return "admin/ordersmanage";
    }

    @RequestMapping("{id}")
    public String edit1(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Order order = (Order) session.get(Order.class, id);
        model.addAttribute("order", order);
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
    @ModelAttribute("OrdersDetails")
    @SuppressWarnings("unchecked")
    public List<OrdersDetail> getOrdersDetails() {
        Session session = factory.getCurrentSession();
        String hql = "FROM OrdersDetail";
        Query query = session.createQuery(hql);
        List<OrdersDetail> list = query.list();
        return list;
    }
}
