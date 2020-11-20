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
@Table(name = "Position",schema="dbo", catalog = "EmployeeManager")
public class Position implements java.io.Serializable {

	private static final long serialVersionUID = -7308207787879644402L;
	private String id;
	private String namePosition;
	private Set<Employee> employees = new HashSet<Employee>(0);

	public Position() {
	}

	public Position(String id, String namePosition) {
		this.id = id;
		this.namePosition = namePosition;
	}

	public Position(String id, String namePosition, Set<Employee> employees) {
		this.id = id;
		this.namePosition = namePosition;
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

	@Column(name = "NamePosition", nullable = false)
	public String getNamePosition() {
		return this.namePosition;
	}

	public void setNamePosition(String namePosition) {
		this.namePosition = namePosition;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "position")
	public Set<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}

}
