/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ReportFlower;
import entity.ReportOrder;
import java.util.List;
import javassist.bytecode.stackmap.TypeData.ClassName;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author truyen
 */
@Transactional
@Controller
@RequestMapping("/admin/")
public class ReportController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("report")
    public String report(ModelMap model) {
        model.addAttribute("report", new ReportFlower());
        model.addAttribute("reports", callSP());
        model.addAttribute("reportorder", new ReportOrder());
        model.addAttribute("reportorders", callOrd());
        return "admin/report";
    }
    @RequestMapping("reportChart")
    public String report1(ModelMap model) {
        model.addAttribute("report", new ReportFlower());
        model.addAttribute("reports", callSP());
        model.addAttribute("reportorder", new ReportOrder());
        model.addAttribute("reportorders", callOrd());
        return "admin/reportChart";
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
