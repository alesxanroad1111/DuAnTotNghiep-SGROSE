package tranlam.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name = "Account", schema = "dbo", catalog = "EmployeeManager")
public class Account implements java.io.Serializable {

	private static final long serialVersionUID = 6148622553405549403L;
	@NotNull
	@Email
	private String email;
	private String password;
	private String fullName;
	private String address;
	private String numberPhone;
	private int access;

	public Account() {
	}

	public Account(String email, String password, String fullName, String address, String numberPhone, int access) {
		this.email = email;
		this.password = password;
		this.fullName = fullName;
		this.address = address;
		this.numberPhone = numberPhone;
		this.access = access;
	}

	@Id

	@Column(name = "Email", unique = true, nullable = false, length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Password", nullable = false, length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "FullName", nullable = false)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Column(name = "Address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "NumberPhone", nullable = false, length = 15)
	public String getNumberPhone() {
		return this.numberPhone;
	}

	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}

	@Column(name = "Access", nullable = false)
	public int getAccess() {
		return this.access;
	}

	public void setAccess(int access) {
		this.access = access;
	}

}
