package controller;

//import entity.Flower;

import entity.Staff;
import entity.User;
import java.util.List;
import javax.servlet.ServletContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Transactional
@Controller
@RequestMapping("/admin/staff")
public class staffController {

    @Autowired
    SessionFactory factory;
    
    
    @RequestMapping("index")
    public String staffs(ModelMap model) {
        model.addAttribute("staff", new Staff());
	model.addAttribute("staffs", getStaffs());
        return "admin/staff/index";
    }
    @RequestMapping("update")
    public String insert(ModelMap model) {
        model.addAttribute("staff", new Staff());
        return "admin/staff/update";
    }
    
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("staff") Staff staff) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(staff);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công !");
            return "redirect:/admin/staff/index.htm";
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("staffs", getStaffs());
        return "admin/staff/update";
    }
    
    @RequestMapping(value = "edit",method = RequestMethod.GET, params = "btnInsert")
    public String insertStaff(ModelMap model, @ModelAttribute("staff") Staff staff) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            System.out.println(staff);
            session.save(staff);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("staffs", getStaffs());
        return "admin/staff/index.htm";
    }
    
    @RequestMapping("delete0/{id}")
	public String delete(ModelMap model, @PathVariable("id") int id) {
		Session session = factory.getCurrentSession();
		Staff staff = (Staff) session.get(Staff.class, id);
		session.delete(staff);
		return "redirect:/admin/staff/index.htm";
        }
    
    @RequestMapping(value = "edit",method = RequestMethod.GET, params = "btnUpdate")
    public String update(ModelMap model, @ModelAttribute("staff") Staff staff) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
//            System.out.println(staff);
            session.update(staff);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("staffs", getStaffs());
        return "admin/staff/index";
    }
    
    @RequestMapping(value = "edit", method = RequestMethod.GET, params = "btnReset")
    public String reset1(ModelMap model, Staff staff) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        {
            session.clear();
            t.commit();
        }
        model.addAttribute("staff", new Staff());
        model.addAttribute("staffs", getStaffs());
        return "admin/staff/edit";
    }
    
     @RequestMapping("edit0/{id}")
    public String edit1(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Staff staff = (Staff) session.get(Staff.class, id);
        model.addAttribute("staff", staff);
        model.addAttribute("staffs", getStaffs());
        return "admin/staff/edit";
    }
    
    
    @SuppressWarnings("unchecked")
    public List<Staff> getStaffs() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Staff";
        Query query = session.createQuery(hql);
        List<Staff> list = query.list();
        return list;
    }
}
