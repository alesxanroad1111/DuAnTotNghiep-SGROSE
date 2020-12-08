/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import entity.TypesOfFlower;
import java.util.List;
import javax.persistence.EntityManager;
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

@Transactional
@Controller
public class ProductController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("home")
    public String Home(ModelMap model) {
        model.addAttribute("flower", new Flower());
        model.addAttribute("flowers", getFlowers());
        return "home";
    }

    @RequestMapping("product/{id}")
    public String detailProduct(ModelMap model, @PathVariable("id") String id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);
        model.addAttribute("flower", flower);

        return "product_details";
    }

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
//        return "flower";
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
//        return "flower";
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
//        model.addAttribute("student", new Flower());
//        model.addAttribute("flowers", getFlowers());
//        return "flower";
//    }
//
//    @RequestMapping("{id}")
//    public String edit(ModelMap model, @PathVariable("id") Integer id) {
//        Session session = factory.getCurrentSession();
//        Flower flower = (Flower) session.get(Flower.class, id);
//
//        model.addAttribute("flower", flower);
//        model.addAttribute("flowers", getFlowers());
//        return "flower";
//    }

    @SuppressWarnings("unchecked")
    public List<Flower> getFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "from Flower";
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

}
