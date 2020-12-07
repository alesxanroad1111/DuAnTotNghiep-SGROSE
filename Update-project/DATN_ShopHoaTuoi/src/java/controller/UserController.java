/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import entity.Flower;
import entity.Gender;
import entity.User;
import entity.Active;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Transactional
@Controller
@RequestMapping(value = "/admin/user/")
public class UserController {

    @Autowired
    SessionFactory factory;
     @Autowired
    ServletContext context;

    @RequestMapping("index")
    public String users(ModelMap model){
        model.addAttribute("user", new User());
        model.addAttribute("users", getUsers());
        model.addAttribute("genders", getGenders());
         model.addAttribute("Actives", getActives());
        return "admin/user/index";
    }
    @RequestMapping("update")
    public String insert(ModelMap model) {
        model.addAttribute("user", new User());
        return "admin/user/update";
    }
    
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("user") User user, BindingResult result, @RequestParam("avatar") MultipartFile image) throws IOException {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        if (result.hasErrors()) {
            System.out.println("Result Error Occured" + result.getAllErrors());
        }
        try {
            
            String path = context.getRealPath("/images/avatar/" + image.getOriginalFilename());
            image.transferTo(new File(path));
            String avatar = image.getOriginalFilename();
            if (avatar != null && avatar.length() > 0) {
                user.setAvatar(avatar);
            }
            session.save(user);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công !");
            return "redirect:/admin/user/index.htm";
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("users", getUsers());
        return "admin/user/update";
    }
    
    @RequestMapping(value = "edit",method = RequestMethod.GET, params = "btnInsert")
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
        return "admin/user/index.htm";
    }
    
    @RequestMapping("delete2/{id}")
	public String deleteUser(ModelMap model, @PathVariable("id") int id) {
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, id);
		session.delete(user);
		return "redirect:/admin/user/index.htm";
               
	}

    @RequestMapping(value = "edit",method = RequestMethod.GET, params = "btnUpdate")
    public String updateUser(ModelMap model, @ModelAttribute("user") User user) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(user);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
            return "redirect:/admin/user/index.htm";
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("users", getUsers());
        return "admin/user/edit";
    }


    @RequestMapping(value = "edit",method = RequestMethod.GET, params = "btnReset")
    public String resetUser(ModelMap model, User user) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        {
            session.clear();
            t.commit();
        }
        model.addAttribute("user", new User());
        model.addAttribute("users", getUsers());
        return "admin/user/edit";
    }

    @RequestMapping("edit/{id}")
    public String editUser(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        User user = (User) session.get(User.class, id);
        model.addAttribute("user", user);
        model.addAttribute("users", getUsers());
        model.addAttribute("genders", getGenders());
         model.addAttribute("actives", getActives());
        return "admin/user/edit";
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
     public List<Active> getActives() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Active";
        Query query = session.createQuery(hql);
        List<Active> list = query.list();
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
