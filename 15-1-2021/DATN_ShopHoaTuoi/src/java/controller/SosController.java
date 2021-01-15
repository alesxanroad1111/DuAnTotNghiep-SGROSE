/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Company;
import entity.Sos;
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
@RequestMapping("admin/")
public class SosController {
    @Autowired
    SessionFactory factory;

    @RequestMapping("Sos")
    public String Sos(ModelMap model) {
         model.addAttribute("Sos", new Sos());
//        model.addAttribute("Sos", getSoss());
        return "admin/Sos";
    }
        @SuppressWarnings("unchecked")
    public List<Sos> getSoss() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Company";
        Query query = session.createQuery(hql);
        List<Sos> list = query.list();
        return list;
    }

  

}
