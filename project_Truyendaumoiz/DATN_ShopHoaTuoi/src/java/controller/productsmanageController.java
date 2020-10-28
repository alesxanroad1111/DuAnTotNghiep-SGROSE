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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
     @RequestMapping(params = "btnInsert")
    public String insert(ModelMap model, @ModelAttribute("flower") Flower flower) {
        System.out.println("in");
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(flower);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("flowers", getFlowers());
        return "admin/productsmanage";
    }

    @RequestMapping(params = "btnUpdate")
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

    @RequestMapping(params = "btnDelete")
    public String delete(ModelMap model, Flower flower) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(flower);
            t.commit();
            model.addAttribute("message", "Xóa thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Xóa thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("flower", new Flower());
        model.addAttribute("flowers", getFlowers());
        return "admin/productsmanage";
    }

    @RequestMapping("{id}")
    public String edit(ModelMap model, @PathVariable("id") String id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);

        model.addAttribute("flower", flower);
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
    @ModelAttribute("typesofflowers")
    @SuppressWarnings("unchecked")
    public List<TypesOfFlower> getTypesOfFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM TypesOfFlower";
        Query query = session.createQuery(hql);
        List<TypesOfFlower> list = query.list();
        return list;
    }
//    @RequestMapping("producsmanage")
//    public String product(ModelMap model, @RequestParam("page") String getpage) {
//     
//        Session session = factory.getCurrentSession();
//        String hql_sum = "Select count(ID)FROM Flower ";
//        Query query_sum = session.createQuery(hql_sum);
//        long tong = (long) query_sum.uniqueResult();
//
//        long pages = Integer.parseInt(getpage), maxResult = 8;
//        long indexrow = pages * maxResult - maxResult;
//        long totalpage = (long) Math.ceil((double) tong / maxResult);
//
//        String hql = "from Flower"; // lấy hết các sản phẩm
//        Query query = session.createQuery(hql);
//        query.setFirstResult((int) indexrow);
//        query.setMaxResults((int) maxResult);
//        List<Flower> list = query.list();
//        model.addAttribute("flower", list); // lấy danh sách hoa ra list đưa vào thuộc tính dưới cột
//        model.addAttribute("totalpage", totalpage);
//        model.addAttribute("pages", pages);
//        return "admin/productsmanage";
//    }

//    //1. trang insert hiện thị lên đầu tiên
//    @RequestMapping(value = "insert", method = RequestMethod.GET)
//    public String insert(ModelMap model) {
//        model.addAttribute("flower", new Flower());
//        return "admin/productsmanage";
//    }
//
//    //2. khi click insert thì chạy hàm này
//    @RequestMapping(value = "insert", method = RequestMethod.POST)
//    public String insert(ModelMap model, @ModelAttribute("depart") Depart depart) {
//        Session session = factory.openSession();
//        Transaction t = session.beginTransaction();
//        try {
//            session.save(depart); // 1. thêm 1 tài khoản vào
//            t.commit();  // 2. commit nếu thêm thành công
//            model.addAttribute("message", "Thêm mới thành công !");
//        } catch (Exception e) {
//            t.rollback();  // 3. rollback nếu thêm thất bại
//            model.addAttribute("message", "Thêm mới thất bại !");
//        } finally {
//            session.close();
//        }      
//        return "redirect:index.htm?page=1"; //4. qua trang index hiện các tài khoản ra
//    }
//
//    @RequestMapping("delete")
//    public String delete(ModelMap model, @RequestParam("departID") String departID) {
//        Session session = factory.getCurrentSession();
//        Depart depart = (Depart) session.get(Depart.class, departID);
//        session.delete(depart);       
//        return "redirect:index.htm?page=1";
//    }
}
