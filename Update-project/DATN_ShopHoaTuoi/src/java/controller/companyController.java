/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Company;
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
public class companyController {
    @Autowired
    SessionFactory factory;

    @RequestMapping("company")
    public String company(ModelMap model) {
         model.addAttribute("company", new Company());
        model.addAttribute("companys", getCompanys());
        return "admin/company";
    }
        @SuppressWarnings("unchecked")
    public List<Company> getCompanys() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Company";
        Query query = session.createQuery(hql);
        List<Company> list = query.list();
        return list;
    }

}
