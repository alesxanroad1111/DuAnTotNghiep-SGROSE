/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Ispaid;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author truyen
 */
@Transactional
@Controller
public class IspaidController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("ispaid")
    public String ispaid(ModelMap model) {
        model.addAttribute("ispaid", new Ispaid());
        model.addAttribute("ispaids", getIspaids());
        return "admin";
    }
    @SuppressWarnings("unchecked")
    public List<Ispaid> getIspaids() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Ispaid";
        Query query = session.createQuery(hql);
        List<Ispaid> list = query.list();
        return list;
    }
}
