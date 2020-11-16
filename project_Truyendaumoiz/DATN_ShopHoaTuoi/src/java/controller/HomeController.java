package controller;

import entity.Flower;
import entity.TypesOfFlower;
import dao.FlowerDAO;

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

@Transactional
@Controller
@RequestMapping("/user/")
public class HomeController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("home")
    public String index(ModelMap model) {
        model.addAttribute("flower", new Flower());
	model.addAttribute("flowers", getFlowers());
        return "user/home";
    }
    
    
    @RequestMapping("product/{id}")
    public String detailProduct(ModelMap model, @PathVariable("id") int id){
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
