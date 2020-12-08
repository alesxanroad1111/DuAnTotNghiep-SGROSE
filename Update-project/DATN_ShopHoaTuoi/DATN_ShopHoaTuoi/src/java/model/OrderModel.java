/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import bean.ItemBean;
import entity.Flower;
import entity.Order;
import entity.OrdersDetail;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;


@Transactional
public class OrderModel {
    
    @Autowired
    SessionFactory factory;
    

    CartModel cartmodel = new CartModel();
    
    public OrderModel(){}
    
    public int buyFlower(int userid, String address, int totalmoney, String name, String numberphone){
        int kq = 0;
        int status = 1;
        int ispaid = 1;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        String createdtime = dateFormat.format(cal.getTime());
        Connection cn = new MyConnect().getcn();
        if (cn == null) {
            return -1;
        }
        try {
            String sql = "insert into Orders(UserId, Address, TotalMoney, Status, Ispaid,Createdtime, Name, NumberPhone) values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2, address);
            ps.setInt(3, totalmoney);
            ps.setInt(4, status);
            ps.setInt(5, ispaid);
            ps.setDate(6, Date.valueOf(createdtime));
            ps.setString(7, name);
            ps.setString(8, numberphone);
            
            kq = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    
    public int buyFlowerGuest(String address, int totalmoney, String name, String numberphone){
        int kq = 0;
        int status = 1;
        int ispaid = 1;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        String createdtime = dateFormat.format(cal.getTime());
        Connection cn = new MyConnect().getcn();
        if (cn == null) {
            return -1;
        }
        try {
            String sql = "insert into Orders(Address, TotalMoney, Status, Ispaid,Createdtime, Name, NumberPhone) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, address);
            ps.setInt(2, totalmoney);
            ps.setInt(3, status);
            ps.setInt(4, ispaid);
            ps.setDate(5, Date.valueOf(createdtime));
            ps.setString(6, name);
            ps.setString(7, numberphone);
            
            kq = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    
    public int getId_Lastest() {
        int idLastest = 0;
        Connection cn = new MyConnect().getcn();
        if (cn == null) {
            return -1;
        }
        try {
            String sql = "Select max(Id) from Orders";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                idLastest = rs.getInt(1);
            }
            ps.close();
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return idLastest;
    }
    
    

}
