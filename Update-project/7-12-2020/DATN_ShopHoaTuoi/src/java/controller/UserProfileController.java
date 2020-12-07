/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Gender;
import entity.TypesOfFlower;
import entity.User;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.DateHelper;
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
 * @author DiemNgonTrai
 */
@Transactional
@Controller
@RequestMapping("/user/")
public class UserProfileController {
    
    @Autowired
    SessionFactory factory;
    
    
    @RequestMapping("profile/{id}")
    public String profile(ModelMap model, HttpSession httpsession){
        Session session = factory.getCurrentSession();
        int id = Integer.parseInt(httpsession.getAttribute("iduser").toString());
        User user = (User) session.get(User.class, id);
        model.addAttribute("userr", user);
        model.addAttribute("users", getUsers());
        return "user/profile";
    }
    @RequestMapping(value = "update-your-profile", method = RequestMethod.POST)
    public String updateProfile(ModelMap model, HttpSession httpsession, @ModelAttribute("userr") User user,
            @RequestParam("birthday")Date birthday){
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        int id = Integer.parseInt(httpsession.getAttribute("iduser").toString());
        try {
            
            user.setBirthday(birthday);
            session.update(user);
            t.commit();
            User user2 = (User) session.get(User.class, id);
            httpsession.setAttribute("user", user2);
            model.addAttribute("message", "Cập Nhật Thành Công!");
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Cập Nhật thất bại!");
        } finally {
            session.close();
        }
        return "user/profile";
    }
    

    @ModelAttribute("genders")
    @SuppressWarnings("unchecked")
    public List<Gender> getGenders() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Gender";
        Query query = session.createQuery(hql);
        List<Gender> list = query.list();
        return list;
    }
    
    @SuppressWarnings("unchecked")
    public List<User> getUsers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM User";
        Query query = session.createQuery(hql);
        List<User> list = query.list();
        return list;
    }
}
