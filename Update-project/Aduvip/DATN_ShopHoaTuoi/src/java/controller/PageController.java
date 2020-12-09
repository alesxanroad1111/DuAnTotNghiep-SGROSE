/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import dao.FlowerDAO;
import entity.Order;
import entity.Staff;
import entity.TypesOfFlower;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.CartModel;
import model.OrderModel;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Transactional
@Controller
@RequestMapping("user")
public class PageController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("check-order")
    public String checkOrder(ModelMap model, HttpServletRequest request, HttpSession httpsession) {
        model.addAttribute("typef", getTypesOfFlowers());
        model.addAttribute("order", new Order());
        model.addAttribute("orders", getOrders());
        return "user/check-order";
    }
    
    

    @RequestMapping(value = "kiem-tra-don-hang", method = RequestMethod.GET)
    public String kiemtra(ModelMap model, HttpServletRequest request, HttpSession httpsession,
            @RequestParam("phone") String phone) {
        Session session = factory.getCurrentSession();
        try {
            String hql = "FROM Order where numberphone='" + phone + "'";
            Query query = session.createQuery(hql);
            List<Order> list = query.list();
            model.addAttribute("checkorder", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("typef", getTypesOfFlowers());
        return "user/check-order";
    }

    @SuppressWarnings("unchecked")
    public List<Order> getOrders() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Order";
        Query query = session.createQuery(hql);
        List<Order> list = query.list();
        return list;
    }
    
    @ModelAttribute("typesofflowers")
    @SuppressWarnings("unchecked")
    public List<TypesOfFlower> getTypesOfFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM TypesOfFlower";
        Query query = session.createQuery(hql);
        List<TypesOfFlower> list = query.list();
        return list;
    }
}
