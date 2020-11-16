/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.TypesOfFlower;
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
 * @author truye
 */
@Transactional
@Controller
@RequestMapping("/admin")
public class TypesOfFlowerController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("/typesofflowermng")
    public String index(ModelMap model) {
        model.addAttribute("typesofflower", new TypesOfFlower());
        model.addAttribute("typesofflowers", getTypesOfFlowers());
        return "admin/typesofflowermng";
    }

    @SuppressWarnings("unchecked")
    public List<TypesOfFlower> getTypesOfFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM TypesOfFlower";
        Query query = session.createQuery(hql);
        List<TypesOfFlower> list = query.list();
        return list;
    }
}
