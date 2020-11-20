package tranlam.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Employee", schema = "dbo", catalog = "EmployeeManager")
public class Employee implements java.io.Serializable {

	private static final long serialVersionUID = -4965352642343985L;
	@NotEmpty
	private String id;
	private Department department;
	private EmployeeType employeeType;
	private Position position;
	private String nameEmployee;
	@NotNull
	private int gender;
	private String photo;
	private String address;
	@Email
	private String email;
	private String numberPhone;
	@NotNull
	private Date birthday;
	private Contract contract;
	private Set<Record> records = new HashSet<Record>(0);

	public Employee() {
	}

	public Employee(String id, Department department, EmployeeType employeeType, Position position, String nameEmployee,
			int gender, String address, String email, String numberPhone, Date birthday) {
		this.id = id;
		this.department = department;
		this.employeeType = employeeType;
		this.position = position;
		this.nameEmployee = nameEmployee;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.numberPhone = numberPhone;
		this.birthday = birthday;
	}

	public Employee(String id, Department department, EmployeeType employeeType, Position position, String nameEmployee,
			int gender, String photo, String address, String email, String numberPhone, Date birthday,
			Contract contract, Set<Record> records) {
		this.id = id;
		this.department = department;
		this.employeeType = employeeType;
		this.position = position;
		this.nameEmployee = nameEmployee;
		this.gender = gender;
		this.photo = photo;
		this.address = address;
		this.email = email;
		this.numberPhone = numberPhone;
		this.birthday = birthday;
		this.contract = contract;
		this.records = records;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false, length = 15)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ID_Department", nullable = false)
	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ID_EmployeeType", nullable = false)
	public EmployeeType getEmployeeType() {
		return this.employeeType;
	}

	public void setEmployeeType(EmployeeType employeeType) {
		this.employeeType = employeeType;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ID_Position", nullable = false)
	public Position getPosition() {
		return this.position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	@Column(name = "NameEmployee", nullable = false)
	public String getNameEmployee() {
		return this.nameEmployee;
	}

	public void setNameEmployee(String nameEmployee) {
		this.nameEmployee = nameEmployee;
	}

	@Column(name = "Gender", nullable = false)
	public int getGender() {
		return this.gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	@Column(name = "Photo")
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name = "Address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "Email", nullable = false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "NumberPhone", nullable = false)
	public String getNumberPhone() {
		return this.numberPhone;
	}

	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "Birthday", nullable = false, length = 23)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@OneToOne(fetch = FetchType.EAGER, mappedBy = "employee")
	public Contract getContract() {
		return this.contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "employee")
	public Set<Record> getRecords() {
		return this.records;
	}

	public void setRecords(Set<Record> records) {
		this.records = records;
	}

	public String setId(long time) {
		return null;
	}

}
