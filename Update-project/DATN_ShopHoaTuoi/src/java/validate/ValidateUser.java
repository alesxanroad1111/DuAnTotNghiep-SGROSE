/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validate;

import entity.User;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;



@Transactional
public class ValidateUser {
    
    @Autowired
    SessionFactory factory;
    
    public List<User> vaidateReg(String email) {
        Session session = factory.getCurrentSession();
        String hql = "FROM User where email = :email";
        
        Query query = session.createQuery(hql);
        query.setParameter("email", email);
        List<User> list = query.list();
        return list;
    }
    
}
