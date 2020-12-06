package controller;

import entity.Flower;
import entity.TypesOfFlower;
import dao.FlowerDAO;
import entity.ReportFlower;
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
    public String index(ModelMap model) {

        model.addAttribute("flower", new Flower());
        model.addAttribute("flowers", getFlowers());
        model.addAttribute("typef", getTypesOfFlowers());
        model.addAttribute("hoac", getFlowersCuoi(1, 4));
        model.addAttribute("hoab", getFlowersBuon(1, 4));
        model.addAttribute("hoacn", getFlowersChucMung(1, 4));
        model.addAttribute("hoakt", getFlowersKhaiTruong(1, 4));
        model.addAttribute("hoasn", getFlowersSinhNhat(1, 4));
        model.put("products", getFlowers2(1,9));
        model.addAttribute("fl", getFlowerList());
        return "user/home";
    }

    public List<Flower> getFlowerList() {
        Session session = factory.openSession();
        Query query = session.createQuery("From Flower");
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Flower> fl = query.list();
        // total count
        String countQ = "SELECT count (f.id) from Flower f";
        Query countQuery = session.createQuery(countQ);
        Long countResults = (Long) countQuery.uniqueResult();
        // last page
        int pageSize = 5;
        int lastPageNumber = (int) ((countResults / pageSize) + 1);
        return fl;
    }

// public List<Flower> getFlowers(ModelMap model, @RequestParam("page") String getpage){
//        Session session = factory.getCurrentSession();
//        String hql_sum = "Select count(Id)FROM Flower";
//        Query query_sum = session.createQuery(hql_sum);
//        long tong = (long) query_sum.uniqueResult();
//
//        long pages = Integer.parseInt(getpage), maxResult = 8;
//        long indexrow = pages * maxResult - maxResult;
//        long totalpage = (long) Math.ceil((double) tong / maxResult);
//
//        String hql = "FROM Flower"; // lấy hết các tài khoản ra
//        Query query = session.createQuery(hql);
//        query.setFirstResult((int) indexrow);
//        query.setMaxResults((int) maxResult);
//        List<Flower> list = query.list();
//        
//        model.addAttribute("totalpage", totalpage);
//        model.addAttribute("pages", pages);
//        return list;
//    }
    @RequestMapping("product/{id}")
    public String detailProduct(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);
        model.addAttribute("flower", flower);

        return "user/product_details";
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
    public List<Flower> getFlowers2(Integer first, Integer count) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower";
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

//    public List getTotalFlower1() {
//
//        String HQL = "from Flower";
//        Session s = factory.getCurrentSession();
//        Query query = s.createQuery(HQL);
//        try {
//            return query.list().size();
//        } catch (Exception e) {
//        }
//        return 0;
//    }
    
    
}
