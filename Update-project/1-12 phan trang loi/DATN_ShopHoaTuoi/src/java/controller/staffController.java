package controller;

import entity.Staff;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping("/admin//")
public class staffController {

    @Autowired
    SessionFactory factory;
    
    @RequestMapping("staffmanage")
    public String staffs(ModelMap model) {
        model.addAttribute("staff", new Staff());
	model.addAttribute("staffs", getStaffs());
        return "admin/staffmanage";
    }
    
//     @RequestMapping("{id}")
//    public String edit1(ModelMap model, @PathVariable("id") int id) {
//        Session session = factory.getCurrentSession();
//        Staff staff = (Staff) session.get(Staff.class, id);
//        model.addAttribute("staff", staff);
//        model.addAttribute("staffs", getStaffs());
//        return "admin/staffmanage";
//    }
    
    @SuppressWarnings("unchecked")
    public List<Staff> getStaffs() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Staff";
        Query query = session.createQuery(hql);
        List<Staff> list = query.list();
        return list;
    }
}
