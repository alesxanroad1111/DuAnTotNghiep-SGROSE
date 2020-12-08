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
public class TypesOfFlowerController {

    @Autowired
    SessionFactory factory;

//
//    @RequestMapping("home")
//    public String index(ModelMap model) {
//        model.addAttribute("flower", new Flower());
//        model.addAttribute("flowers", getFlowers());
//        model.addAttribute("typef", getTypesOfFlowers());
//        model.addAttribute("hoac", getFlowersCuoi(1, 4));
//        model.addAttribute("hoab", getFlowersBuon(1, 4));
//        model.addAttribute("hoacn", getFlowersChucMung(1, 4));
//        model.addAttribute("hoakt", getFlowersKhaiTruong(1, 4));
//        model.addAttribute("hoasn", getFlowersSinhNhat(1, 4));
//        model.put("products", getFlowers());
//        return "home";
//    }
//    
//    @SuppressWarnings("unchecked")
//    public List<Flower> getFlowers() {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower";
//        Query query = session.createQuery(hql);
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    @RequestMapping("home/{id}")
//    public String indexType(ModelMap model, @PathVariable("id") int id) {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = " + id;
//        Query query = session.createQuery(hql);
//        List<Flower> list = query.list();
//        model.addAttribute("flowertype", list);
//        return "hometype";
//    }
////
//
//    @SuppressWarnings("unchecked")
//    public List<Flower> getFlowersfollowType(int id) {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = " + id;
//        Query query = session.createQuery(hql);
//        List<Flower> list = query.list();
//        return list;
//    }
//    
//    ////////////////////////select flower theo mã///////////////////////////
//    public List<Flower> getFlowersCuoi1() {
//        Session session = factory.getCurrentSession();
//        String sql = "FROM Flower where typeid = 1";
//        Query query = session.createQuery(sql);
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    public List<Flower> getFlowersBuon1() {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = 2";
//        Query query = session.createQuery(hql);
//        
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    public List<Flower> getFlowersChucMung1() {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = 3";
//        Query query = session.createQuery(hql);
//        
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    public List<Flower> getFlowersKhaiTruong1() {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = 4";
//        Query query = session.createQuery(hql);
//        
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    public List<Flower> getFlowersSinhNhat1() {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = 5";
//        Query query = session.createQuery(hql);
//        
//        List<Flower> list = query.list();
//        return list;
//    }
//    ////////////////////////select flower theo mã flower limit 4////////////////////////////
//    public List<Flower> getFlowersCuoi(Integer first,Integer count) {
//        Session session = factory.getCurrentSession();
//        String sql = "FROM Flower where typeid = 1";
//        Query query = session.createQuery(sql);
//        if (first != null) {
//            query.setFirstResult(first);
//        }
//        if (count != null) {
//            query.setMaxResults(count);
//        }
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    public List<Flower> getFlowersBuon(Integer first,Integer count) {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = 2";
//        Query query = session.createQuery(hql);
//        if (first != null) {
//            query.setFirstResult(first);
//        }
//        if (count != null) {
//            query.setMaxResults(count);
//        }
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    public List<Flower> getFlowersChucMung(Integer first,Integer count) {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = 3";
//        Query query = session.createQuery(hql);
//        if (first != null) {
//            query.setFirstResult(first);
//        }
//        if (count != null) {
//            query.setMaxResults(count);
//        }
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    public List<Flower> getFlowersKhaiTruong(Integer first,Integer count) {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = 4";
//        Query query = session.createQuery(hql);
//        if (first != null) {
//            query.setFirstResult(first);
//        }
//        if (count != null) {
//            query.setMaxResults(count);
//        }
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    public List<Flower> getFlowersSinhNhat(Integer first,Integer count) {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Flower where typeid = 5";
//        Query query = session.createQuery(hql);
//        if (first != null) {
//            query.setFirstResult(first);
//        }
//        if (count != null) {
//            query.setMaxResults(count);
//        }
//        List<Flower> list = query.list();
//        return list;
//    }
//
//    @ModelAttribute("typesofflowers")
//    @SuppressWarnings("unchecked")
//    public List<TypesOfFlower> getTypesOfFlowers() {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM TypesOfFlower";
//        Query query = session.createQuery(hql);
//        List<TypesOfFlower> list = query.list();
//        return list;
//    }

}
