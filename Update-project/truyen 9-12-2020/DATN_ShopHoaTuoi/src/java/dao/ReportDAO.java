/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Report;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

/**
 *
 * @author truyen
 */
public class ReportDAO {


    
    
        public static List<Report> showFlower(){
        try {
            Connection con = new myConnection().getConnect();
            String sql = "select c.Name as [Group],sum(p.Price * p.Amount) as sum, sum(p.Amount) as count, min(p.Price) as Min, max(p.Price) as Max, AVG(p.Price) as Avg From Flowers as p inner join TypesOfFlowers as c on p.TypeId = c.Id Group  by c.Name";
            
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            List<Report> list = new ArrayList<Report>();
            while(rs.next()){
                String group = rs.getString(1);
                double sum = rs.getDouble(2);
                double avg = rs.getDouble(3);
                double min = rs.getDouble(4);
                double max = rs.getDouble(5);
                int count = rs.getInt(6);
                Report rip = new Report();
                list.add(rip);
            }
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
