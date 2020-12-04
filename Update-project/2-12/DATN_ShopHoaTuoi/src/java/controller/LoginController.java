/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.User;

import javax.servlet.http.HttpSession;
import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Transactional
@Controller
@RequestMapping("/user/")
public class LoginController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("login")
    public String login() {

        return "user/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(ModelMap model,
            @RequestParam("id") String id,
            @RequestParam("password") String password,
            HttpSession httpsession) {
        Session session = factory.getCurrentSession();
        try {
            String hql = "FROM User where email='" + id + "'";
            Query query = session.createQuery(hql);
            User user = (User) query.list().get(0);
            if (user.getPassword().equals(password)) {
                httpsession.setAttribute("user", user);
                return "redirect:/user/home.htm";
            }else {
                model.addAttribute("message", "Sai mật khẩu");
            }
        } catch (Exception e) {
            System.out.println(e);
            model.addAttribute("message", e);
        }
        return "user/login";
    }

    @RequestMapping("logoff")
    public String logoff(HttpSession httpSession) {
        httpSession.removeAttribute("user");
        httpSession.removeAttribute("staff");
        return "redirect:/user/login.htm";
    }

}
