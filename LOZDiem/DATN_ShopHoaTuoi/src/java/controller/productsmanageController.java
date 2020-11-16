/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import entity.TypesOfFlower;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author truye
 */
@Transactional
@Controller
@RequestMapping("/admin/")
public class productsmanageController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("productsmanage")
    public String products(ModelMap model) {
        model.addAttribute("flower", new Flower());
        model.addAttribute("flowers", getFlowers());
        return "admin/productsmanage";
    }

    @RequestMapping(value = "productsmanage", method = RequestMethod.GET, params = "btnInsert")
    public String insert(ModelMap model, @ModelAttribute("flower") Flower flower) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {

            session.save(flower);
            t.commit();
            model.addAttribute("message", "Thêm thành công!");

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("flowers", getFlowers());
        return "admin/productsmanage";
    }

    @RequestMapping("delete/{id}")
    public String delete(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);
        session.delete(flower);
        return "redirect:/admin/productsmanage.htm";

    }

    @RequestMapping(value = "productsmanage", method = RequestMethod.GET, params = "btnUpdate")
    public String update(ModelMap model, @ModelAttribute("flower") Flower flower) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(flower);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("flowers", getFlowers());
        return "admin/productsmanage";
    }

    @RequestMapping(value = "productsmanage", method = RequestMethod.GET, params = "btnReset")
    public String reset(ModelMap model, Flower flower) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        {
            session.clear();
            t.commit();
        }
        model.addAttribute("flower", new Flower());
        model.addAttribute("flowers", getFlowers());
        return "admin/productsmanage";
    }

    @RequestMapping("show/{id}")
    public String edit(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);
        model.addAttribute("flower", flower);
        model.addAttribute("flowers", getFlowers());
        return "admin/productsmanage";
    }

//    
    @SuppressWarnings("unchecked")
    public List<Flower> getFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower";
        Query query = session.createQuery(hql);
        List<Flower> list = query.list();
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
//    @RequestMapping(value="validate1", method=RequestMethod.POST)
//	public String validate1(ModelMap model,
//			@ModelAttribute("flowers") Flower Flower, BindingResult errors) {
//            if(Flower.getName().trim().length()==0){errors.rejectValue("name","flower","Vui lòng nhập tên hoa!");}
//		return "admin/productsmanage";
//        }	

}
