package model;

import entity.Flower;
import entity.TypesOfFlower;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FlowerModel {
    
    public FlowerModel(){
        
    }

    public Flower getProductByProductid(int productid) {
        Flower product = null;
        
        Connection cn = new MyConnect().getcn();
        if (cn == null) {
            // không kết nối được
            return null;
        }

        try {
            String sql = "select * from Flowers where Id = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, productid);
            ResultSet rs = ps.executeQuery();
            TypesOfFlower type = new TypesOfFlower();
            if (rs.next()) {
                product = new Flower(rs.getInt(1), rs.getString(2), type, rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getDate(8), rs.getDate(9));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;

    }
    
}
