/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.User;
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

@Transactional
@Controller
@RequestMapping(value = "/admin/")
public class UserController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("usersmanage")
    public String users(ModelMap model){
        model.addAttribute("user", new User());
        model.addAttribute("users", getUsers());
        return "admin/usersmanage";
    }
    
    @RequestMapping(value = "usersmanage",method = RequestMethod.GET, params = "btnInsert")
    public String insertUser(ModelMap model, @ModelAttribute("user") User user) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            System.out.println(user);
            session.save(user);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("users", getUsers());
        return "admin/usersmanage";
    }
    
    @RequestMapping("delete2/{id}")
	public String deleteUser(ModelMap model, @PathVariable("id") int id) {
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, id);
		session.delete(user);
		return "redirect:/admin/usersmanage.htm";
               
	}

    @RequestMapping(value = "usersmanage",method = RequestMethod.GET, params = "btnUpdate")
    public String updateUser(ModelMap model, @ModelAttribute("user") User user) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(user);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("users", getUsers());
        return "admin/usersmanage";
    }


    @RequestMapping(value = "usersmanage",method = RequestMethod.GET, params = "btnReset")
    public String resetUser(ModelMap model, User user) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        {
            session.clear();
            t.commit();
        }
        model.addAttribute("user", new User());
        model.addAttribute("users", getUsers());
        return "admin/usersmanage";
    }

    @RequestMapping("views/{id}")
    public String editUser(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        User user = (User) session.get(User.class, id);
        model.addAttribute("user", user);
        model.addAttribute("users", getUsers());
        return "admin/usersmanage";
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
