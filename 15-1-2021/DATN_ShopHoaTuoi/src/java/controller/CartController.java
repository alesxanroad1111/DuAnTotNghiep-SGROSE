/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.ItemBean;
import entity.Flower;
import entity.Ispaid;
import entity.Order;
import entity.OrderStatus;
import entity.OrdersDetail;
import entity.TypesOfFlower;
import entity.User;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartModel;
import model.OrderModel;
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
import org.springframework.web.bind.annotation.RequestParam;

@Transactional
@Controller
@RequestMapping("/user/")
public class CartController {

    @Autowired
    SessionFactory factory;

    CartModel cartmodel = new CartModel();
    OrderModel omodel = new OrderModel();

    /////////////Giỏ Hàng//////////////
    @RequestMapping("cart")
    public String cart(ModelMap model, HttpServletRequest request) {
        String yeucau = request.getParameter("yeucau");
        if (yeucau.equals("deleteall")) {
            cartmodel.removeAllProduct();
        }
        request.setAttribute("giohang", cartmodel.getListItems());
        request.setAttribute("total", cartmodel.getTotal());
        return "user/cart";
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

    /////////////Checkouts//////////////
    @RequestMapping(value = "checkouts")
    public String checkouts(ModelMap model, HttpServletRequest request, HttpSession httpsession) {
        if (httpsession.getAttribute("user") == null) {
            model.addAttribute("nameuser", "Bạn đã có tài khoản?");
        }
        model.addAttribute("order", new Order());
        model.addAttribute("message", "Vui lòng sử dụng Tài Khoản và Thanh toán để dễ dàng truy cập vào lịch sử đơn đặt hàng của bạn hoặc sử dụng Thanh toán với tư cách Khách.");
        request.setAttribute("giohang", cartmodel.getListItems());
        request.setAttribute("total", cartmodel.getTotal());
        return "user/check_out";
    }

    @RequestMapping(value = "order-success")
    public String orderSuccess(ModelMap model, HttpServletRequest request, HttpSession httpsession) {
        request.setAttribute("giohang", cartmodel.getListItems());
        request.setAttribute("total", cartmodel.getTotal());
        return "user/order-success";
    }

    //////////////////////GIỎ HÀNG////////////////////
    @RequestMapping(value = "buy/{id}", method = RequestMethod.GET)
    public String GetFlower(ModelMap model, HttpServletRequest request, HttpSession httpsession, @PathVariable("id") String id) {
        String yeucau = request.getParameter("yeucau");
        int masp = 0;
        if (id != null) {
            masp = Integer.parseInt(id);
        }
        if (yeucau.equals("muasp")) {
            cartmodel.addProduct(masp); // thêm vào giỏ hàng
        } else if (yeucau.equals("bosp")) {
            cartmodel.removeProduct(masp);
        } else if (yeucau.equals("plus")) {
            cartmodel.plusProduct(masp);
        } else if (yeucau.equals("minus")) {
            cartmodel.minusProduct(masp);
        }

        request.setAttribute("giohang", cartmodel.getListItems());
        request.setAttribute("total", cartmodel.getTotal());

        return "user/cart";
    }

    //////////////////CHECKOUTS//////////////////////////
    @RequestMapping(value = "dat-hang-thanh-cong", method = RequestMethod.POST)
    public String checkouts(ModelMap model, HttpServletResponse resp, HttpSession httpsession, HttpServletRequest request, @ModelAttribute("order") Order order) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        if (order.getName().trim().length() == 0 || order.getNumberphone().trim().length() == 0 || order.getEmail().trim().length() == 0 || order.getAddress().trim().length() == 0) {
            model.addAttribute("dathang", "Đặt Hàng Thất Bại!");
            model.addAttribute("message", "Vui lòng quay lại và nhập đầy đủ thông tin của bạn!");
        } else if (order.getName().matches("[0-9]")) {
            model.addAttribute("dathang", "Đặt Hàng Thất Bại!");
            model.addAttribute("message", "Vui lòng quay lại và nhập đúng định dạng Họ Tên!");
        } else if (order.getNumberphone().trim().length() == 0 || !order.getNumberphone().matches("[0-9]{10}")) {
            model.addAttribute("dathang", "Đặt Hàng Thất Bại!");
            model.addAttribute("message", "Vui lòng quay lại và nhập đúng số điện thoại!");
        } else if (!order.getEmail().matches("^[a-zA-Z][\\w-]+@([\\w]+\\.[\\w]+|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})$")) {
            model.addAttribute("dathang", "Đặt Hàng Thất Bại!");
            model.addAttribute("message", "Sai định dạng email! Vui lòng quay lại và nhập đúng địa chỉ email!");
        } else {
            dathang(model, resp, httpsession, request, order);
            model.addAttribute("dathang", "Đặt Hàng Thành Công!");
        }

        return "user/order-success";
    }

    public String dathang(ModelMap model, HttpServletResponse resp, HttpSession httpsession, HttpServletRequest request, @ModelAttribute("order") Order order) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        OrderStatus ors = new OrderStatus(1);
        Ispaid isp = new Ispaid(1);
        double Total = cartmodel.getTotal();
        OrderModel thanhtoan = new OrderModel();
        Order idorder = new Order(thanhtoan.getId_Lastest());
        model.addAttribute("idorder", idorder);
        model.addAttribute("ispaid", "Chưa thanh toán");
        model.addAttribute("satus", "Đang chờ lấy hàng");
        model.addAttribute("total", cartmodel.getTotal());
        if (httpsession.getAttribute("user") == null) {

            order.setTotalmoney(Total);
            order.setStatus(ors);
            order.setIspaid(isp);
            session.save(order);
            model.addAttribute("dulieuorder", order);
            t.commit();
            ///orderdetail
            Isorderdetail();

        } else {

            String Id = httpsession.getAttribute("iduser").toString();
            int IdUConvert = Integer.parseInt(Id);
            User user = new User(IdUConvert);
            ///order
            order.setUserid(user);
            order.setTotalmoney(Total);
            order.setStatus(ors);
            order.setIspaid(isp);
            session.save(order);
            model.addAttribute("dulieuorder", order);
            t.commit();
            ///orderdetail
            Isorderdetail();

        }

        return "redirect:/user/home";
    }

    public String Isorderdetail() {
        OrdersDetail ordd = new OrdersDetail();
        ArrayList<ItemBean> cart = cartmodel.getListItems();
        OrderModel thanhtoan = new OrderModel();
        Order idorder = new Order(thanhtoan.getId_Lastest());

        for (ItemBean i : cart) {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            Flower idfl = new Flower(i.getProduct().getId());
            ordd.setOrderid(idorder);
            ordd.setFlowerId(idfl);
            ordd.setPrice(i.getProduct().getPrice());
            ordd.setAmount(i.getQuantity());
            ordd.setTotalprice(i.getProduct().getPrice() * i.getQuantity());
            session.save(ordd);
            t.commit();
        }

        cartmodel.removeAllProduct();
        return "redirect:/user/home";
    }

    ////////////////////SHOW/////////////////////////
    @SuppressWarnings("unchecker")
    public List<OrdersDetail> getOrdersDetails() {
        Session session = factory.getCurrentSession();
        String hql = "FROM OrdersDetail";
        Query query = session.createQuery(hql);
        List<OrdersDetail> list = query.list();
        return list;
    }

    @ModelAttribute("orders")
    @SuppressWarnings("unchecker")
    public List<Order> getOrders() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Order";
        Query query = session.createQuery(hql);
        List<Order> list = query.list();
        return list;
    }

}
