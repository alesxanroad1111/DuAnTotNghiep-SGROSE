/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Staff;
import entity.User;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
public class LoginController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("login")
    public String login() {

        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(ModelMap model,
            @RequestParam("id") String id,
            @RequestParam("password") String password,
            HttpSession httpsession) {
        Session session = factory.getCurrentSession();
        if (isNumeric(id)) {
            try {
                String hql = "FROM Staff where phone='" + id + "'";
                Query query = session.createQuery(hql);
                Staff staff = (Staff) query.list().get(0);
                if (staff.getPassword().equals(password)) {
                    httpsession.setAttribute("staff", staff);
                    httpsession.setAttribute("idstaff", staff.getId());
                    return "redirect:/admin/dashboardmanage.htm";
                } else {
                    model.addAttribute("message", "Sai tài khoản hoặc mật khẩu!");
                }
            } catch (Exception e) {
                System.out.println(e);
                model.addAttribute("message", e);
            }
        } else {
            try {
                String hql = "FROM User where email='" + id + "'";
                Query query = session.createQuery(hql);
                User user = (User) query.list().get(0);
                if (user.getPassword().equals(password)) {
                    httpsession.setAttribute("user", user);
                    httpsession.setAttribute("iduser", user.getId());
                    return "redirect:/user/home.htm";
                } else {
                    model.addAttribute("message", "Sai tài khoản hoặc mật khẩu!");
                }
            } catch (Exception e) {
                System.out.println(e);
                model.addAttribute("message", e);
            }
        }

        return "login";
    }

    public static boolean isNumeric(String str) {
        NumberFormat formatter = NumberFormat.getInstance();
        ParsePosition pos = new ParsePosition(0);
        formatter.parse(str, pos);
        return str.length() == pos.getIndex();
    }
    @RequestMapping("logoff")
    public String logoff(HttpSession httpSession) {
        httpSession.removeAttribute("user");
        return "redirect:/login.htm";
    }
    @RequestMapping("logoffStaff")
    public String logoffStaff(HttpSession httpSession) {
        httpSession.removeAttribute("staff");
        return "redirect:/login.htm";
    }

}
