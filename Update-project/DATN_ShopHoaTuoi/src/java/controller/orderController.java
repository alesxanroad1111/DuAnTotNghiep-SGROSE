/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Ispaid;
import entity.Order;
import entity.OrderStatus;
import entity.OrdersDetail;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
@RequestMapping("/admin/order/")
public class orderController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("index")
    public String orders(ModelMap model) {
        model.addAttribute("order", new Order());
        model.addAttribute("orders", getOrders());
        model.addAttribute("orderstatus", getIsactive());
        model.addAttribute("orderstatus1", getIsactive1());
        model.addAttribute("orderstatus2", getIsactive2());
        model.addAttribute("ordersispaid", getIspaid());
        model.addAttribute("ordersispaid2", getIspaid2());
        return "admin/order/index";
    }

    @RequestMapping("update")
    public String insert(ModelMap model) {
       
        model.addAttribute("order", new Order());
        return "admin/order/update";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("order") Order order, HttpSession httpsession) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        if (!httpsession.getAttribute("rolestaff").toString().equals("1")) {
            model.addAttribute("message", "Bạn không có quyền thêm mới");
        } else {
            
            try {
                session.save(order);
                t.commit();
                model.addAttribute("message", "Thêm mới thành công !");
                return "redirect:/admin/order/index";
            } catch (Exception e) {
                t.rollback();
                e.printStackTrace();
                model.addAttribute("message", "Thêm mới thất bại !");
            } finally {
                session.close();
            }
        }
        model.addAttribute("orders", getOrders());
        return "admin/order/update";
    }
//    

    @RequestMapping("edit/delete1/{id}")
    public String delete(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Order order = (Order) session.get(Order.class, id);
        session.delete(order);
        return "redirect:/admin/order/index";

    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public String update(ModelMap model, @ModelAttribute("order") Order order) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(order);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
            return "redirect:/admin/order/index";
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("orders", getOrders());
        return "admin/order/edit";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET, params = "btnReset")
    public String reset1(ModelMap model, Order order) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        {
            session.clear();
            t.commit();
        }
        model.addAttribute("order", new Order());
        model.addAttribute("orders", getOrders());
        model.addAttribute("ordersispaid", getIspaid());
        return "admin/order/edit";
    }

    @RequestMapping("/edit/show/{id}")
    public String edit1(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Order order = (Order) session.get(Order.class, id);
        model.addAttribute("order", order);
        model.addAttribute("orders", getOrders());
        return "admin/order/edit";
    }

    @RequestMapping("details/{id}")
    public String detail(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Order order = (Order) session.get(Order.class, id);
        model.addAttribute("order", order);
        return "admin/order/details";
    }

    public List<Order> getIsactive() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Order where status = 1";
        Query query = session.createQuery(hql);
        List<Order> list = query.list();
        return list;
    }

    public List<Order> getIsactive1() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Order where status = 2";
        Query query = session.createQuery(hql);
        List<Order> list = query.list();
        return list;
    }

    public List<Order> getIsactive2() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Order where status = 3";
        Query query = session.createQuery(hql);
        List<Order> list = query.list();
        return list;
    }

    public List<Order> getIspaid() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Order where ispaid = 1";
        Query query = session.createQuery(hql);
        List<Order> list = query.list();
        return list;
    }

    public List<Order> getIspaid2() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Order where ispaid = 2";
        Query query = session.createQuery(hql);
        List<Order> list = query.list();
        return list;
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

    @ModelAttribute("Ispaids")
    @SuppressWarnings("unchecked")
    public List<Ispaid> getIspaids() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Ispaid";
        Query query = session.createQuery(hql);
        List<Ispaid> list = query.list();
        return list;
    }

    @ModelAttribute("OrderStatuss")
    @SuppressWarnings("unchecked")
    public List<OrderStatus> getOrderStatuss() {
        Session session = factory.getCurrentSession();
        String hql = "FROM OrderStatus";
        Query query = session.createQuery(hql);
        List<OrderStatus> list = query.list();
        return list;
    }
}
