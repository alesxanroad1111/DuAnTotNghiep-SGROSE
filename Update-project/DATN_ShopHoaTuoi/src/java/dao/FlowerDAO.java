
package dao;

import entity.Flower;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class FlowerDAO {
    
//    public static List<Flower> showFlower(String tenhoa){
//        try {
//            Connection con = new myConnection().getConnect();
//            String sql = "select top 6 Name, Price, Image from Flowers";
//            if(tenhoa.length() > 0){
//                sql += " where Name like '%"+tenhoa+"%'";
//            }
//            Statement stm = con.createStatement();
//            ResultSet rs = stm.executeQuery(sql);
//            List<Flower> list = new ArrayList<Flower>();
//            while(rs.next()){
//                String name = rs.getString(1);
//                double price = rs.getDouble(2);
//                String image = rs.getString(3);
//                Flower fl = new Flower(name, price, image);
//                list.add(fl);
//            }
//            return list;
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
    
}
