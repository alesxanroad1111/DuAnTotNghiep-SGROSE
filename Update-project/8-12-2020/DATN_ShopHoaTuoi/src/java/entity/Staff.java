/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author truye
 */
@Entity
@Table(name = "Staffs")
public class Staff {
    @Id
    @GeneratedValue
//    @NotEmpty
    private int id;
    
 @Size(min=10, message = "Vui lòng nhập tên nhân viên!")
    private String name;
 @Size(min=0, message = "Vui lòng nhập email!")
 @Email(message = "Vui lòng nhập email!")
    private String email;
 @Size(min=1, message = "Vui lòng nhập mật khẩu!")
    private String password;
 @NotNull(message = "Vui lòng nhập ngày sinh!")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="MM/dd/yyyy")
    private Date birthday;
 
     @Size(min=1, message = "Vui lòng nhập địa chỉ!")
    private String address;
    private String avatar;


    
    @ManyToOne
    @JoinColumn(name = "gender")
 @NotNull(message = "Vui lòng nhập giới tính!")
    private Gender gender;
    @GeneratedValue
//@Size(min=10, message = "Vui lòng nhập số điện thoại!")
 
    @NotBlank(message = "Vui lòng nhập số điện thoại!")
    private String phone;
    
    @ManyToOne
    @JoinColumn(name = "role")
@NotNull( message = "Vui lòng nhập vai trò!")
    private Role role;
    
    @Generated(GenerationTime.ALWAYS)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="MM/dd/yyyy")
    private Date createdtime;
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="MM/dd/yyyy")
    @UpdateTimestamp
    private Date updatedtime;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Date getCreatedtime() {
        return createdtime;
    }

    public void setCreatedtime(Date createdtime) {
        this.createdtime = createdtime;
    }

    public Date getUpdatedtime() {
        return updatedtime;
    }

    public void setUpdatedtime(Date updatedtime) {
        this.updatedtime = updatedtime;
    }

    

   
    
}
