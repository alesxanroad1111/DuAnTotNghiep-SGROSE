/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Employee;
import com.google.gson.Gson;
import entity.Flower;
import entity.FlowerPromotionProgram;
import entity.TypesOfFlower;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Transactional
@Controller
public class ProductController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("home")
    public String Home(ModelMap model, HttpSession httpsession) {
        model.addAttribute("flower", new Flower());
        model.addAttribute("flowers", getFlowers(1,12));
        model.addAttribute("promotion", getFlowersPromotion());
        httpsession.setAttribute("httpflower", getFlowers2());
        httpsession.setAttribute("typef", getTypesOfFlowers());
        model.addAttribute("hoac", getFlowersCuoi(1, 4));
        model.addAttribute("hoab", getFlowersBuon(1, 4));
        model.addAttribute("hoacn", getFlowersChucMung(1, 4));
        model.addAttribute("hoakt", getFlowersKhaiTruong(1, 4));
        model.addAttribute("hoasn", getFlowersSinhNhat(1, 4));
        model.put("products", getFlowers3(1,9));
        return "home";
    }

    @RequestMapping(value = "field1", method = RequestMethod.GET)
    public @ResponseBody
    List<Flower> field1() {
        return factory.openSession()
                .createQuery("Select name FROM Flower")
                .list();
    }

//    @RequestMapping(value = "search", method = RequestMethod.GET)
//    @ResponseBody
//    public String getTagList(HttpServletRequest request, @RequestParam("txtsearch")String keyword) {
//        String name = request.getParameter("term");
//        Gson gson = new Gson();
//        
//        return gson.toJson(listFlowersByName(name));
//    }
//    public List<String> listFlowersByName(String keyword) {
//        List<String> list = null;
//        Session session = factory.openSession();
//        Transaction t = null;
//        try {
//            t = session.beginTransaction();
//            String hql = "Select name FROM Flower where name like "+keyword;
//            list = session.createQuery(hql).setMaxResults(10).list();
//            t.commit();
//            
//        } catch (Exception e) {
//            list = null;
//            if(t!=null){
//                t.rollback();
//            }
//            e.printStackTrace();
//        }
//
//        return list;
//    }
    @RequestMapping("product/{id}")
    public String detailProduct(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);
        model.addAttribute("flower", flower);
        model.put("products", getFlowers3(1,9));
        return "product_details";
    }
    @RequestMapping("promotion/{id}")
    public String detailPromotion(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        FlowerPromotionProgram promotion = (FlowerPromotionProgram) session.get(FlowerPromotionProgram.class, id);
        model.addAttribute("promotion", promotion);

        return "promotion-detail";
    }


    @RequestMapping("home/{id}")
    public String indexType(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = " + id;
        Query query = session.createQuery(hql);
        List<Flower> list = query.list();
        model.addAttribute("flowertype", list);
        return "hometype";
    }
//

    @SuppressWarnings("unchecked")
    public List<Flower> getFlowersfollowType(int id) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = " + id;
        Query query = session.createQuery(hql);
        List<Flower> list = query.list();
        return list;
    }

    ////////////////////////select flower theo mã///////////////////////////
    public List<Flower> getFlowersCuoi1() {
        Session session = factory.getCurrentSession();
        String sql = "FROM Flower where typeid = 1";
        Query query = session.createQuery(sql);
        List<Flower> list = query.list();
        return list;
    }

    public List<Flower> getFlowersBuon1() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = 2";
        Query query = session.createQuery(hql);

        List<Flower> list = query.list();
        return list;
    }

    public List<Flower> getFlowersChucMung1() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = 3";
        Query query = session.createQuery(hql);

        List<Flower> list = query.list();
        return list;
    }

    public List<Flower> getFlowersKhaiTruong1() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = 4";
        Query query = session.createQuery(hql);

        List<Flower> list = query.list();
        return list;
    }

    public List<Flower> getFlowersSinhNhat1() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = 5";
        Query query = session.createQuery(hql);

        List<Flower> list = query.list();
        return list;
    }

    ////////////////////////select flower theo mã flower limit 4////////////////////////////
    public List<Flower> getFlowersCuoi(Integer first, Integer count) {
        Session session = factory.getCurrentSession();
        String sql = "FROM Flower where typeid = 1";
        Query query = session.createQuery(sql);
        if (first != null) {
            query.setFirstResult(first);
        }
        if (count != null) {
            query.setMaxResults(count);
        }
        List<Flower> list = query.list();
        return list;
    }

    public List<Flower> getFlowersBuon(Integer first, Integer count) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = 2";
        Query query = session.createQuery(hql);
        if (first != null) {
            query.setFirstResult(first);
        }
        if (count != null) {
            query.setMaxResults(count);
        }
        List<Flower> list = query.list();
        return list;
    }

    public List<Flower> getFlowersChucMung(Integer first, Integer count) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = 3";
        Query query = session.createQuery(hql);
        if (first != null) {
            query.setFirstResult(first);
        }
        if (count != null) {
            query.setMaxResults(count);
        }
        List<Flower> list = query.list();
        return list;
    }

    public List<Flower> getFlowersKhaiTruong(Integer first, Integer count) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = 4";
        Query query = session.createQuery(hql);
        if (first != null) {
            query.setFirstResult(first);
        }
        if (count != null) {
            query.setMaxResults(count);
        }
        List<Flower> list = query.list();
        return list;
    }

    public List<Flower> getFlowersSinhNhat(Integer first, Integer count) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = 5";
        Query query = session.createQuery(hql);
        if (first != null) {
            query.setFirstResult(first);
        }
        if (count != null) {
            query.setMaxResults(count);
        }
        List<Flower> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<FlowerPromotionProgram> getFlowersPromotion() {
        Session session = factory.getCurrentSession();
        String hql ="FROM FlowerPromotionProgram";
        Query query = session.createQuery(hql);
        List<FlowerPromotionProgram> list = query.list();
        return list;
    }
    
    @SuppressWarnings("unchecked")
    public List<Flower> getFlowers(Integer first, Integer count) {
        Session session = factory.getCurrentSession();
        String hql ="FROM Flower fl WHERE fl.id NOT IN(SELECT p.flowerId FROM FlowerPromotionProgram p) order by fl.createdtime desc";
        Query query = session.createQuery(hql);
        if (first != null) {
            query.setFirstResult(first);
        }
        if (count != null) {
            query.setMaxResults(count);
        }
        List<Flower> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<Flower> getFlowers2() {
        Session session = factory.getCurrentSession();

        String hql = "FROM Flower fl WHERE fl.id NOT IN(SELECT p.flowerId FROM FlowerPromotionProgram p)";
        Query query = session.createQuery(hql);

        List<Flower> list = query.list();
        return list;
    }
    
    @SuppressWarnings("unchecked")
    public List<Flower> getFlowers3(Integer first, Integer count) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower fl WHERE fl.id NOT IN(SELECT p.flowerId FROM FlowerPromotionProgram p)";
        Query query = session.createQuery(hql);
        if (first != null) {
            query.setFirstResult(first);
        }
        if (count != null) {
            query.setMaxResults(count);
        }
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
