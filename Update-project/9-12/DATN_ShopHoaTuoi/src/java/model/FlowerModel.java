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
            String sql = "select * from Flowers where id not in (SELECT flowerID FROM FlowerPromotionPrograms) and id = ?";
            String sqlpromotion = "select f.id, f.name,f.typeid, f.amount, ((f.price - p.TypePrice) * ((100 - p.typePercent)/100)) as Price, f.image, f.Notes, f.Createdtime, f.updatedtime From FlowerPromotionPrograms p inner join Flowers f on f.id=p.FlowerID where f.id = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            PreparedStatement ps2 = cn.prepareStatement(sqlpromotion);
            ps.setInt(1, productid);
            ps2.setInt(1, productid);
            ResultSet rs = ps.executeQuery();
            
            ResultSet rs2 = ps2.executeQuery();
            TypesOfFlower type = new TypesOfFlower();
            if (rs.next()) {
                product = new Flower(rs.getInt(1), rs.getString(2), type, rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getDate(8), rs.getDate(9));
            } else if(rs2.next()) {
                product = new Flower(rs2.getInt(1), rs2.getString(2), type, rs2.getInt(4), rs2.getInt(5), rs2.getString(6), rs2.getString(7), rs2.getDate(8), rs2.getDate(9));
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;

    }
    
}
