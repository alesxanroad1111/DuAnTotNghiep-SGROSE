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
        model.put("products", getFlowers());
        return "user/home";
    }

    @RequestMapping("product/{id}")
    public String detailProduct(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);
        model.addAttribute("flower", flower);

        return "user/product_details";
    }
    
    @RequestMapping(value = "buy/{id}")
    public String GetFlower(ModelMap model,HttpServletRequest request, HttpSession httpsession, @PathVariable("id") String id) {
        String yeucau = request.getParameter("yeucau");
        int masp = 0;
        if (id != null) {
            masp = Integer.parseInt(id);
        }
        if (yeucau.equals("muasp")) {
            cartmodel.addProduct(masp); // thêm vào giỏ hàng
        } else if (yeucau.equals("bosp")) {
            cartmodel.removeProduct(masp);
        }
        request.setAttribute("giohang", cartmodel.getListItems());
        request.setAttribute("total", cartmodel.getTotal());
        

        return "user/cart";
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

    public List<Flower> findAll() {
        return this.products;
    }

    
}
