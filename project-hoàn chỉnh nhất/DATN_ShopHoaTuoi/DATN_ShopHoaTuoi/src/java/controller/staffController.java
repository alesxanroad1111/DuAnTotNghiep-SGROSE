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
import javax.servlet.http.HttpSession;

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
        return "admin/staff/update";
    }

//    @RequestMapping(value = "update", method = RequestMethod.POST)
//    public String validate1(ModelMap model,
//            @ModelAttribute("staff") Staff staff, BindingResult errors) {
//        if (staff.getName().trim().length() == 0) {
//            //1. nếu người dùng không  nhập name,(bỏ qua không nhập)===> thông báo lỗi "Vui lòng nhập họ tên !"
//            //errors.rejectValue("name", "student", "Vui lòng nhập họ tên !");
//            errors.rejectValue("name", "staff", "Vui lòng nhập tên NV !");
//        }
//        
//         if (staff.getEmail().trim().length() == 0) {
//        errors.rejectValue("email", "staff", "Vui lòng nhập email !");
//        }
//           if (staff.getPassword().trim().length() == 0) {
//        errors.rejectValue("password", "staff", "Vui lòng nhập password !");
//        }
//              if (staff.getAddress().trim().length() == 0) {
//        errors.rejectValue("adress", "staff", "Vui lòng nhập địa chỉ !");
//        }
////               if (staff.getPhone().length() == 0) {
////        errors.rejectValue("adress", "staff", "Vui lòng nhập địa chỉ !");
////        }
////         
//        return "admin/staff/edit"; // 6. hiện thị lại trang student1
//    }
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("staff") Staff staff, BindingResult result, @RequestParam("avatar") MultipartFile image,
            @RequestParam("birthday") String birthday) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        if(staff.getName().equals("") || staff.getEmail().equals("") || staff.getPassword().equals("")|| staff.getAddress().equals("")){
            model.addAttribute("message", "Vui lòng nhập đầy đủ thông tin của nhân viên!");
        } else if (!staff.getName().matches("^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ"
                + "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ"
                + "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$")) {
            model.addAttribute("message", "Vui lòng nhập đúng định dạng Họ Tên!");
        } else if (!staff.getEmail().matches("^[a-zA-Z][\\w-]+@([\\w]+\\.[\\w]+|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})$")) {
            model.addAttribute("message", "Vui lòng nhập đúng định dạng Email!");
        } else if (staff.getPassword().trim().length() < 6) {
            model.addAttribute("message", "Vui lòng nhập mật khẩu ít nhất 6 chữ số!");
        } else if (!birthday.matches("\\d{1,2}/\\d{1,2}/\\d{4}")) {
            model.addAttribute("message", "Vui lòng nhập đúng định dạng Ngày Sinh!");
        } else if (staff.getAddress().equals("")) {
            model.addAttribute("message", "Vui lòng nhập địa chỉ!");
        } else if (!staff.getPhone().matches("[0-9]{10}")) {
            model.addAttribute("message", "Vui lòng nhập đúng 10 số của Số Điện Thoại!");
        } else if(image.getOriginalFilename().equals("")){
            model.addAttribute("message", "Vui lòng chọn avatar!");
        }else {
            //        if (result.hasErrors()) {
//            System.out.println("Result Error Occured" + result.getAllErrors());
//        }
            try {

                String path = context.getRealPath("/images/avatar/" + image.getOriginalFilename());
                image.transferTo(new File(path));
                String avatar = image.getOriginalFilename();
                if (avatar != null && avatar.length() > 0) {
                    staff.setAvatar(avatar);
                }
                session.save(staff);
                t.commit();
                model.addAttribute("staffs", getStaffs());
                model.addAttribute("message", "them ok!");
                return "redirect:/admin/staff/index";
            } catch (Exception e) {
                t.rollback();
                model.addAttribute("message", "Vui lòng chọn avatar!");
            } finally {
                session.close();
            }
        }
        return "admin/staff/update";
    }

//    @RequestMapping(value = "edit",method = RequestMethod.GET, params = "btnInsert")
//    public String insertStaff(ModelMap model, @ModelAttribute("staff") Staff staff) {
//
//        Session session = factory.openSession();
//        Transaction t = session.beginTransaction();
//        try {
//            System.out.println(staff);
//            session.save(staff);
//            t.commit();
//            model.addAttribute("message", "Cập nhật thành công !");
//
//        } catch (Exception e) {
//            t.rollback();
//            e.printStackTrace();
//            model.addAttribute("message", "Thêm mới thất bại !");
//        } finally {
//            session.close();
//        }
//        model.addAttribute("staffs", getStaffs());
//        return "admin/staff/index";
//    }
    @RequestMapping(value = "edit", method = RequestMethod.GET, params = "btnUpdate")
    public String update(ModelMap model, @ModelAttribute("staff") Staff staff, HttpSession httpsession,
            @RequestParam("image2")String image2) throws IOException {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            staff.setAvatar(image2);
            session.update(staff);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
// return "redirect:/admin/staff/index";
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
        model.addAttribute("genders", getGenders());
        model.addAttribute("staffs", getStaffs());
        model.addAttribute("roles", getRoles());
        return "admin/staff/edit";
    }

    @RequestMapping("delete0/{id}")
    public String delete(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Staff staff = (Staff) session.get(Staff.class, id);
        session.delete(staff);
        return "redirect:/admin/staff/index";
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
