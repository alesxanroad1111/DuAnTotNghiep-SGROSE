package tranlam.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Department",schema="dbo", catalog = "EmployeeManager")
public class Department implements java.io.Serializable {

	private static final long serialVersionUID = -4035973148509052634L;
	private String id;
	private String nameDepartment;
	private Set<Employee> employees = new HashSet<Employee>(0);

	public Department() {
	}

	public Department(String id, String nameDepartment) {
		this.id = id;
		this.nameDepartment = nameDepartment;
	}

	public Department(String id, String nameDepartment, Set<Employee> employees) {
		this.id = id;
		this.nameDepartment = nameDepartment;
		this.employees = employees;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false, length = 12)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "NameDepartment", nullable = false)
	public String getNameDepartment() {
		return this.nameDepartment;
	}

	public void setNameDepartment(String nameDepartment) {
		this.nameDepartment = nameDepartment;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "department")
	public Set<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}


}
