/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import entity.Order;
import entity.ReportFlower;
import entity.ReportOrder;
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
//
//    @Autowired
//    ReportDAO rdao;

    @RequestMapping("dashboardmanage")
    public String dashboard(ModelMap model) {
//        model.addAttribute("thongkef", getReportF());
        model.addAttribute("report", new ReportFlower());
        model.addAttribute("reports", callSP());
        model.addAttribute("reportorder", new ReportOrder());
        model.addAttribute("reportorders", callOrd());

        return "admin/dashboardmanage";
    }

//    @RequestMapping("report")
//    public String report(ModelMap model) {
//        model.addAttribute("items", rdao.getProductReport());
//        return "Report";
//    }
//
//    public List<Flower> getReportF() {
//        String HQL = "FROM Flower group by typeid";
//        Session s = factory.getCurrentSession();
//        Query query = s.createQuery(HQL);
//        List<Flower> list = query.list();
//        return list;
//    }
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

    @ModelAttribute(value = "totalstaff")
    public int getTotalStaff() {
        String HQL = "From Staff";
        Session s = factory.getCurrentSession();
        Query query = s.createQuery(HQL);
        try {
            return query.list().size();
        } catch (Exception e) {
        }
        return 0;
    }
     @ModelAttribute(value = "totalcompany")
    public int getTotalCompany() {
        String HQL = "From Company";
        Session s = factory.getCurrentSession();
        Query query = s.createQuery(HQL);
        try {
            return query.list().size();
        } catch (Exception e) {
        }
        return 0;
    }

    @RequestMapping("getreport")
    public String getReportFlower(ModelMap model) {
        return "admin/dashboardmanage";
    }

    @ModelAttribute(value = "reportFlower")
    public List<ReportFlower> callSP() {
        List<ReportFlower> rpFlower;
        Session session = factory.getCurrentSession();
        Query query = session.createSQLQuery("SELECT\n"
                + "	c.Name as [Group],\n"
                + "	sum(p.Price * p.Amount) as sum,\n"
                + "	sum(p.Amount) as count,\n"
                + "	min(p.Price) as Min,\n"
                + "	max(p.Price) as Max,\n"
                + "	AVG(p.Price) as Avg\n"
                + "	From Flowers as p\n"
                + "	inner join TypesOfFlowers as c\n"
                + "	on p.TypeId = c.Id\n"
                + "	Group  by c.Name").addEntity(ReportFlower.class);
        rpFlower = query.list();
        for (int i = 0; i < rpFlower.size(); i++) {
            ReportFlower rf = (ReportFlower) rpFlower.get(i);
//            System.out.println(rf.toString());
        }
        return rpFlower;
    }

    @ModelAttribute(value = "reportFlower")
    public List<ReportOrder> callOrd() {
        List<ReportOrder> rpOrder;
        Session session = factory.getCurrentSession();
        Query query = session.createSQLQuery("select \n"
                + "	o.Createdtime as [group],\n"
                + "	max(o.Amount) as max,\n"
                + "	min(o.Amount) as min,\n"
                + "	sum(o.Amount) as count,\n"
                + "	 sum(o.Totalprice) as sum\n"
                + "	  from OrdersDetails o join Flowers f on  f.Id = o.FlowerId\n"
                + "	 WHERE Month(o.Createdtime) = MONTH(o.Createdtime)\n"
                + "	 Group  by o.Createdtime").addEntity(ReportOrder.class);
        rpOrder = query.list();
        for (int i = 0; i < rpOrder.size(); i++) {
            ReportOrder rf = (ReportOrder) rpOrder.get(i);
        }
        return rpOrder;
    }
}
