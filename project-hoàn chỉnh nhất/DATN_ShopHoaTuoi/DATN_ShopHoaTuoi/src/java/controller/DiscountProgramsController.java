/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.DiscountProgram;
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
@RequestMapping("/admin/program/")
public class DiscountProgramsController {
    @Autowired
    SessionFactory factory;

    @RequestMapping("index")
    public String program(ModelMap model) {
        model.addAttribute("programs", getPrograms());
        return "admin/program/index";
    }
    
    @RequestMapping("insert")
    public String insert(ModelMap model) {
        model.addAttribute("program", new DiscountProgram());
        return "admin/program/insert";
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String insert(ModelMap model, @ModelAttribute("program") DiscountProgram program) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(program);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công !");
            return "redirect:/admin/program/index";
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("programs", getPrograms());
        return "admin/program/insert";
    }
     @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String edit(ModelMap model, @ModelAttribute("program") DiscountProgram program) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(program);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
            return "redirect:/admin/program/index";
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("programs", getPrograms());
        return "admin/program/edit";
    }
       @RequestMapping("/show/delete/{id}")
    public String delete(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        DiscountProgram program = (DiscountProgram) session.get(DiscountProgram.class, id);
        session.delete(program);
        return "redirect:/admin/program/index";

    }

        @RequestMapping("/show/view/{id}")
    public String show(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        DiscountProgram program = (DiscountProgram) session.get(DiscountProgram.class, id);
        model.addAttribute("program", program);
        model.addAttribute("programs", getPrograms());
        return "admin/program/edit";
    }

    
    @SuppressWarnings("unchecked")
    public List<DiscountProgram> getPrograms() {
        Session session = factory.getCurrentSession();
        String hql = "FROM DiscountProgram";
        Query query = session.createQuery(hql);
        List<DiscountProgram> list = query.list();
        return list;
    }
}
