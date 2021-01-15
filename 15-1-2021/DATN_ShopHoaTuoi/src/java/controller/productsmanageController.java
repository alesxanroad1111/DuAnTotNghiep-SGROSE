/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import entity.TypesOfFlower;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author truye
 */
@Transactional
@Controller
@RequestMapping("/admin/flower/")
public class productsmanageController {

    @Autowired
    SessionFactory factory;

    @Autowired
    ServletContext context;

    @RequestMapping("index")
    public String products(ModelMap model) {
        model.addAttribute("flower", new Flower());
        model.addAttribute("flowers", getFlowers());
        return "admin/flower/index";
    }

    @RequestMapping("update")
    public String insert(ModelMap model) {
        model.addAttribute("flower", new Flower());
        return "admin/flower/update";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("flower") Flower flower, BindingResult result, HttpSession httpsession, @RequestParam("image") MultipartFile image) throws IOException {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        if (flower.getName().trim().length() == 0 || flower.getAmount() == 0 || flower.getPrice() == 0 || flower.getNotes().trim().length() == 0) {
            model.addAttribute("message", "Vui lòng quay lại và nhập đầy đủ thông tin của hoa!");
        } else if (!flower.getName().matches("^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ"
                + "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ"
                + "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$")) {
            model.addAttribute("message", "Vui lòng nhập đúng kiểu dữ liệu!");
        } else {
            if (result.hasErrors()) {
                System.out.println("Result Error Occured" + result.getAllErrors());
            }

            try {

                String path = context.getRealPath("/images/hoa/" + image.getOriginalFilename());
                image.transferTo(new File(path));
                String images = image.getOriginalFilename();
                if (images != null && images.length() > 0) {
                    flower.setImage(images);
                }
                session.save(flower);
                t.commit();

                model.addAttribute("message", "them ok!");
                return "redirect:/admin/flower/index";
            } catch (Exception e) {
                t.rollback();
                e.printStackTrace();
                model.addAttribute("message", "Thêm mới thất bại !");
            } finally {
                session.close();
            }
        }
        model.addAttribute("flowers", getFlowers());
        return "admin/flower/update";
    }

    @RequestMapping("/edit/delete/{id}")
    public String delete(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);
        session.delete(flower);
        return "redirect:/admin/flower/index";

    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public String update(ModelMap model, @ModelAttribute("flower") Flower flower,  HttpSession httpsession,
            @RequestParam("image2")String image2) throws IOException {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            
                flower.setImage(image2);
            session.update(flower);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
            return "redirect:/admin/flower/index";
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("message", "Cập nhật thất bại !");
        model.addAttribute("flowers", getFlowers());
        return "admin/flower/edit";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET, params = "btnReset")
    public String reset(ModelMap model, Flower flower) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        {
            session.clear();
            t.commit();
        }
        model.addAttribute("flower", new Flower());
        model.addAttribute("flowers", getFlowers());
        return "admin/flower/edit";
    }

    @RequestMapping("/edit/show/{id}")
    public String edit(ModelMap model, @PathVariable("id") int id) {
        Session session = factory.getCurrentSession();
        Flower flower = (Flower) session.get(Flower.class, id);
        model.addAttribute("flower", flower);
        model.addAttribute("flowers", getFlowers());
        return "admin/flower/edit";
    }

//    
    @SuppressWarnings("unchecked")
    public List<Flower> getFlowers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Flower";
        Query query = session.createQuery(hql);
        List<Flower> list = query.list();
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
//    @RequestMapping(value="validate1", method=RequestMethod.POST)
//	public String validate1(ModelMap model,
//			@ModelAttribute("flowers") Flower Flower, BindingResult errors) {
//            if(Flower.getName().trim().length()==0){errors.rejectValue("name","flower","Vui lòng nhập tên hoa!");}
//		return "admin/productsmanage";
//        }	

}
