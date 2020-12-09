/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author DiemNgonTrai
 */
@Entity
@Table(name = "Genders")
public class Gender {
    @Id
    @GeneratedValue
    private int id;
    private String name;
    
    @OneToMany(mappedBy = "gender", fetch = FetchType.EAGER)
    private Collection<User> users;
    
    @OneToMany(mappedBy = "gender", fetch = FetchType.EAGER)
    private Collection<Staff> staffs;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Collection<User> getUsers() {
        return users;
    }

    public void setUsers(Collection<User> users) {
        this.users = users;
    }

    public Collection<Staff> getStaffs() {
        return staffs;
    }

    public void setStaffs(Collection<Staff> staffs) {
        this.staffs = staffs;
    }
    
    
}
