/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.DiscountProgram;
import entity.Flower;
import entity.FlowerPromotionProgram;
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
 * @author truyen
 */
@Transactional
@Controller
@RequestMapping("/admin/promotion/")
public class FlowerPromotionController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("index")
    public String promotion(ModelMap model) {
        model.addAttribute("promotion", new FlowerPromotionProgram());
        model.addAttribute("promotions", getPromotions());
        return "admin/promotion/index";
    }
    @RequestMapping("update")
    public String insert(ModelMap model) {
        model.addAttribute("promotion", new FlowerPromotionProgram());
        return "admin/promotion/update";
    }

    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String insert(ModelMap model, @ModelAttribute("promotion") FlowerPromotionProgram promotion) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(promotion);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công !");
            return "redirect:/admin/promotion/index";
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("promotion", getPromotions());
        return "admin/promotion/update";
    }
    
    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String edit(ModelMap model, @ModelAttribute("promotion") FlowerPromotionProgram promotion) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(promotion);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
            return "redirect:/admin/promotion/index";
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("promotion", getPromotions());
        return "admin/promotion/edit";
    }
      @RequestMapping("/show/delete/{id}")
    public String delete(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        FlowerPromotionProgram promotion = (FlowerPromotionProgram) session.get(FlowerPromotionProgram.class, id);
        session.delete(promotion);
        return "redirect:/admin/promotion/index";

    }

        @RequestMapping("/show/view/{id}")
    public String show(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        FlowerPromotionProgram promotion = (FlowerPromotionProgram) session.get(FlowerPromotionProgram.class, id);
        model.addAttribute("promotion", promotion);
        model.addAttribute("promotions", getPromotions());
        return "admin/promotion/edit";
    }

    
    @SuppressWarnings("unchecked")
    public List<FlowerPromotionProgram> getPromotions() {
        Session session = factory.getCurrentSession();
        String hql = "FROM FlowerPromotionProgram";
        Query query = session.createQuery(hql);
        List<FlowerPromotionProgram> list = query.list();
        return list;
    }
    @ModelAttribute("Flowers")
    @SuppressWarnings("unchecked")
    public List<Flower> getFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower";
        Query query = session.createQuery(hql);
        List<Flower> list = query.list();
        return list;
    }
    @ModelAttribute("DiscountPrograms")
    @SuppressWarnings("unchecked")
    public List<DiscountProgram> getDiscountPrograms() {
        Session session = factory.getCurrentSession();
        String hql = "FROM DiscountProgram";
        Query query = session.createQuery(hql);
        List<DiscountProgram> list = query.list();
        return list;
    }

}
