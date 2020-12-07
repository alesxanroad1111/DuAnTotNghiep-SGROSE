package controller;

//import entity.Flower;
import entity.Gender;
import entity.Order;
import entity.Role;
import entity.Staff;
import java.io.File;
import java.io.IOException;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Transactional
@Controller
@RequestMapping("/admin/staff/")
public class staffController {

    @Autowired
    SessionFactory factory;
    @Autowired
    ServletContext context;
    
    @RequestMapping("index")
    public String staffs(ModelMap model) {
        model.addAttribute("staff", new Staff());
	model.addAttribute("staffs", getStaffs());
        model.addAttribute("roles", getRoles());
        return "admin/staff/index";
    }
    @RequestMapping("update")
    public String insert(ModelMap model) {
        model.addAttribute("staff", new Staff());
        model.addAttribute("genders", getGenders());
        model.addAttribute("roles", getRoles());
        return "admin/staff/update";
    }
    
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("staff") Staff staff, BindingResult result, @RequestParam("avatar") MultipartFile image) throws IOException {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        if (result.hasErrors()) {
            System.out.println("Result Error Occured" + result.getAllErrors());
        }
        try {
            
            String path = context.getRealPath("/images/avatar/" + image.getOriginalFilename());
            image.transferTo(new File(path));
            String avatar = image.getOriginalFilename();
            System.out.println(avatar);
                staff.setAvatar(avatar);
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
    
    @RequestMapping(value = "edit",method = RequestMethod.GET, params = "btnUpdate")
    public String update(ModelMap model, @ModelAttribute("staff") Staff staff) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
       
            session.update(staff);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
// return "redirect:/admin/staff/index.htm";
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
         model.addAttribute("roles", getRoles());
        return "admin/staff/edit";
    }
    @RequestMapping("delete0/{id}")
	public String delete(ModelMap model, @PathVariable("id") int id) {
		Session session = factory.getCurrentSession();
		Staff staff = (Staff) session.get(Staff.class, id);
		session.delete(staff);
		return "redirect:/admin/staff/index.htm";
        }
    
        @ModelAttribute("genders")
    @SuppressWarnings("unchecked")
    public List<Gender> getGenders() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Gender";
        Query query = session.createQuery(hql);
        List<Gender> list = query.list();
        return list;
    }
    @ModelAttribute("roles")
    @SuppressWarnings("unchecked")
    public List<Role> getRoles() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Role";
        Query query = session.createQuery(hql);
        List<Role> list = query.list();
        return list;
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
