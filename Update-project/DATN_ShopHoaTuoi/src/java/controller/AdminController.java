/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import entity.Order;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.engine.query.spi.sql.NativeSQLQueryReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author truye
 */
@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("dashboardmanage")
    public String dashboard(ModelMap model) {

        return "admin/dashboardmanage";
    }

    @ModelAttribute(value = "totalbill")
    public int getToltalBill() {
        String HQL = "FROM OrdersDetail";
        Session s = factory.getCurrentSession();
        Query query = s.createQuery(HQL);
        try {
            return query.list().size();
        } catch (Exception e) {
            return 0;
        }
    }

    @ModelAttribute(value = "totalflower")
    public int getTotalFlower() {

        String HQL = "from Flower";
        Session s = factory.getCurrentSession();
        Query query = s.createQuery(HQL);
        try {
            return query.list().size();
        } catch (Exception e) {
        }
        return 0;
    }
    @ModelAttribute(value="totalstaff")
    public int getTotalStaff(){
        String HQL = "From Staff";
        Session s = factory.getCurrentSession();
        Query query = s.createQuery(HQL);
        try {
            return query.list().size();
        } catch (Exception e) {
        }
        return 0;
    }
}
