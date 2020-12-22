package controller;

import entity.Flower;
import entity.TypesOfFlower;
import dao.FlowerDAO;
import entity.FlowerPromotionProgram;
import java.lang.reflect.Method;

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

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.CartModel;
import model.FlowerModel;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Transactional
@Controller
@RequestMapping("/user/")
public class HomeController {

    @Autowired
    SessionFactory factory;

    private List<Flower> products;
    CartModel cartmodel = new CartModel();

    @RequestMapping("home")
    public String index(ModelMap model, HttpSession httpsession) {
        model.addAttribute("flower", new Flower());
        model.addAttribute("flowers", getFlowers());
        httpsession.setAttribute("typef", getTypesOfFlowers());
        model.addAttribute("hoac", getFlowersCuoi(1,4));
        model.addAttribute("hoab", getFlowersBuon(1,4));
        model.addAttribute("hoacn", getFlowersChucMung(1,4));
        model.addAttribute("hoakt", getFlowersKhaiTruong(1,4));
        model.addAttribute("hoasn", getFlowersSinhNhat(1,4));
        model.put("products", getFlowers());
        return "user/home";
    }

    @RequestMapping("home/{id}")
    public String indexType(ModelMap model, @PathVariable("id")int id) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = "+id;
        Query query = session.createQuery(hql);
        List<Flower> list = query.list();
        model.addAttribute("flowertype", list);
        return "user/hometype";
    }
    
    @RequestMapping("product/{id}")
    public String detailProduct(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);
        model.addAttribute("flower", flower);
        model.put("products", getFlowers());
        return "user/product_details";
    }
    
    @RequestMapping("promotion/{id}")
    public String detailPromotion(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        FlowerPromotionProgram promotion = (FlowerPromotionProgram) session.get(FlowerPromotionProgram.class, id);
        model.addAttribute("p", promotion);

        return "user/promotion-detail";
    }

    @SuppressWarnings("unchecked")
    public List<Flower> getFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower";
        Query query = session.createQuery(hql);
        List<Flower> list = query.list();
        return list;
    }
    
    @SuppressWarnings("unchecked")
    public List<Flower> getFlowersfollowType(int id) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower where typeid = "+id;
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
    public List<Flower> getFlowersCuoi(Integer first,Integer count) {
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

    public List<Flower> getFlowersBuon(Integer first,Integer count) {
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

    
    public List<Flower> getFlowersChucMung(Integer first,Integer count) {
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

    public List<Flower> getFlowersKhaiTruong(Integer first,Integer count) {
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

    public List<Flower> getFlowersSinhNhat(Integer first,Integer count) {
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

    @ModelAttribute("typesofflowers")
    @SuppressWarnings("unchecked")
    public List<TypesOfFlower> getTypesOfFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM TypesOfFlower";
        Query query = session.createQuery(hql);
        List<TypesOfFlower> list = query.list();
        return list;
    }

    public List<Flower> findAll() {
        return this.products;
    }

}
