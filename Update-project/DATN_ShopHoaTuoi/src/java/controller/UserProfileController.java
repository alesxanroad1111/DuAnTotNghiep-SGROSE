/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.OrdersDetails;
import entity.Gender;
import entity.OrdersDetail;
import entity.TypesOfFlower;
import entity.User;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.DateHelper;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
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

/**
 *
 * @author DiemNgonTrai
 */
@Transactional
@Controller
@RequestMapping("/user/")
public class UserProfileController {

    @Autowired
    SessionFactory factory;

    @Autowired
    ServletContext context;

    @RequestMapping("profile/{id}")
    public String profile(ModelMap model, HttpSession httpsession) {
        Session session = factory.getCurrentSession();
        int id = Integer.parseInt(httpsession.getAttribute("iduser").toString());
        User user = (User) session.get(User.class, id);
        model.addAttribute("userr", user);
        model.addAttribute("users", getUsers());
        model.addAttribute("typef", getTypesOfFlowers());
        return "user/profile";
    }

    @RequestMapping("purchased")
    public String purchased(ModelMap model, HttpSession httpsession) {
        Session session = factory.getCurrentSession();
        int id = Integer.parseInt(httpsession.getAttribute("iduser").toString());
        User user = (User) session.get(User.class, id);
        model.addAttribute("purchase", getPurchase(id));
        model.addAttribute("waitforship", getPurchaseWaitForShipping(id));
        model.addAttribute("shipping", getPurchaseShipping(id));
        model.addAttribute("claimed", getPurchaseClaimed(id));
        return "user/purchased";
    }

    @RequestMapping("changepassword")
    public String changepassword(ModelMap model, HttpSession httpsession) {

//        user.setPassword(password);
//        session.update(user);
//        t.commit();
        return "user/changepassword";
    }

    @RequestMapping("change-password")
    public String changepassword(ModelMap model, HttpSession httpsession,
            @RequestParam("password")String oldpass,
            @RequestParam("repassword")String newpass,
            @RequestParam("confirmpassword")String confirmpass) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        int id = Integer.parseInt(httpsession.getAttribute("iduser").toString());
        User user = (User) session.get(User.class, id);
        if(oldpass.trim().length()<6){
            model.addAttribute("messgae", "Mật khẩu cũ phải trên 6 ký tự!");
        } else if(newpass.trim().length()<6){
            model.addAttribute("messgae", "Mật khẩu mới phải trên 6 ký tự!");
        } else if(confirmpass.trim().length()<6){
            model.addAttribute("messgae", "Xác nhận Mật khẩu phải trên 6 ký tự!");
        } else if (!oldpass.equals(user.getPassword())) {
            model.addAttribute("messgae", "Mật khẩu không chính xác!");
        } else if (!confirmpass.equals(newpass)) {
            model.addAttribute("message", "Xác nhận mật khẩu không chính xác!");
        } else if (oldpass.equals(user.getPassword()) && confirmpass.equals(newpass)) {

            try {
                user.setPassword(newpass);
                session.update(user);
                t.commit();
                model.addAttribute("message", "Cập nhật thành công!");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return "user/changepassword";
    }

    @RequestMapping(value = "update-your-profile", method = RequestMethod.POST)
    public String updateProfile(ModelMap model, HttpSession httpsession, @ModelAttribute("userr") User user, BindingResult result, @RequestParam("avatar") MultipartFile image,
            @RequestParam("birthday") String birthday,
            @RequestParam("avatar2") String avatar2) throws IOException {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        if (result.hasErrors()) {
            System.out.println("Result Error Occured" + result.getAllErrors());
        }
        int id = Integer.parseInt(httpsession.getAttribute("iduser").toString());
        if (!user.getName().matches("^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ"
                + "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ"
                + "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$")) {
            model.addAttribute("message", "Vui lòng nhập đúng định dạng Họ Tên!");
        } else if (!birthday.matches("\\d{1,2}/\\d{1,2}/\\d{4}")) {
            model.addAttribute("message", "Vui lòng nhập đúng định dạng Ngày Sinh!");
        } else {
            try {
                String path = context.getRealPath("/images/avatar/" + image.getOriginalFilename());
                if (!image.getOriginalFilename().equals("")) {
                    image.transferTo(new File(path));
                }

                String images = image.getOriginalFilename();
                if (images != null && images.length() > 0) {
                    user.setAvatar(images);
                } else {
                    user.setAvatar(avatar2);
                }
                session.update(user);
                t.commit();
                User user2 = (User) session.get(User.class, id);
                httpsession.setAttribute("user", user2);
                model.addAttribute("message", "Cập Nhật Thành Công!");
            } catch (Exception e) {
                t.rollback();
                e.printStackTrace();
                model.addAttribute("message", "Cập Nhật thất bại!");
            } finally {
                session.close();
            }
        }

        return "user/profile";
    }

//    @RequestMapping("register")
//    public String register(ModelMap model){
//        model.addAttribute("user", new User());
//        model.addAttribute("users", getUsers());
//        return "user/register";
//    }
//    @RequestMapping(value = "reg", method = RequestMethod.GET)
//    public String reg(ModelMap model, @ModelAttribute("user") User user){
//        Session session = factory.openSession();
//        Transaction t = session.beginTransaction();
//        try {
//            session.save(user);
//            t.commit();
//            model.addAttribute("message", "Đăng Ký Thành Công!");
//            return "redirect:/login";
//        } catch (Exception e) {
//            t.rollback();
//            e.printStackTrace();
//            model.addAttribute("message", "Thêm mới thất bại!");
//        } finally {
//            session.close();
//        }
//        return "user/register";
//    }
    @ModelAttribute("genders")
    @SuppressWarnings("unchecked")
    public List<Gender> getGenders() {
        Session session = factory.openSession();
        String hql = "FROM Gender";
        Query query = session.createQuery(hql);
        List<Gender> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM User";
        Query query = session.createQuery(hql);
        List<User> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<OrdersDetail> getPurchase(Integer id) {
        Session session = factory.getCurrentSession();
        String hql = "FROM OrdersDetail " + "where orderid.userid = " + id;
        Query query = session.createQuery(hql);
        List<OrdersDetail> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<OrdersDetail> getPurchaseWaitForShipping(Integer id) {
        Session session = factory.getCurrentSession();
        String hql = "FROM OrdersDetail " + "where orderid.status = 1 and orderid.userid = " + id;
        Query query = session.createQuery(hql);
        List<OrdersDetail> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<OrdersDetail> getPurchaseShipping(Integer id) {
        Session session = factory.getCurrentSession();
        String hql = "FROM OrdersDetail " + "where orderid.status = 2 and orderid.userid = " + id;
        Query query = session.createQuery(hql);
        List<OrdersDetail> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<OrdersDetail> getPurchaseClaimed(Integer id) {
        Session session = factory.getCurrentSession();
        String hql = "FROM OrdersDetail " + "where orderid.status = 3 and orderid.userid = " + id;
        Query query = session.createQuery(hql);
        List<OrdersDetail> list = query.list();
        return list;
    }

    @ModelAttribute("typesofflowers")
    @SuppressWarnings("unchecked")
    public List<TypesOfFlower> getTypesOfFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM TypesOfFlower";
        Query query = session.createQuery(hql);
        List<TypesOfFlower> list = query.list();
        return list;
    }
}
