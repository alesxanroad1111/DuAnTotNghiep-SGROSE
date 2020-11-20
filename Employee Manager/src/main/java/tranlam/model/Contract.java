package tranlam.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Contract", schema = "dbo", catalog = "EmployeeManager")
public class Contract implements java.io.Serializable {

	private static final long serialVersionUID = 1257684520050991519L;
	private String id;
	private Employee employee;
	private String nameContract;
	private Date startTime;
	private Date endTime;
	private Integer subsidize;
	private Double insurrance;
	@NotNull
	@Min(1000000)
	@Max(30000000)
	private Double salary;
	private Integer total;
	@NotNull
	private int status;

	public Contract() {
	}

	public Contract(Employee employee, String nameContract, Date startTime, int status) {
		this.employee = employee;
		this.nameContract = nameContract;
		this.startTime = startTime;
		this.status = status;
	}

	public Contract(Employee employee, String nameContract, Date startTime, Date endTime, Integer subsidize,
			Double insurrance, Double salary, Integer total, int status) {
		this.employee = employee;
		this.nameContract = nameContract;
		this.startTime = startTime;
		this.endTime = endTime;
		this.subsidize = subsidize;
		this.insurrance = insurrance;
		this.salary = salary;
		this.total = total;
		this.status = status;
	}

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "employee"))
	@Id
	@GeneratedValue(generator = "generator")

	@Column(name = "ID", unique = true, nullable = false, length = 15)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@OneToOne(fetch = FetchType.EAGER)
	@PrimaryKeyJoinColumn
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "NameContract", nullable = false)
	public String getNameContract() {
		return this.nameContract;
	}

	public void setNameContract(String nameContract) {
		this.nameContract = nameContract;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "StartTime", nullable = false, length = 23)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "EndTime", length = 23)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "Subsidize")
	public Integer getSubsidize() {
		return this.subsidize;
	}

	public void setSubsidize(Integer subsidize) {
		this.subsidize = subsidize;
	}

	@Column(name = "Insurrance", precision = 53, scale = 0)
	public Double getInsurrance() {
		return this.insurrance;
	}

	public void setInsurrance(Double insurrance) {
		this.insurrance = insurrance;
	}

	@Column(name = "Salary")
	public Double getSalary() {
		return this.salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	@Column(name = "Total")
	public Integer getTotal() {
		return this.total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	@Column(name = "Status", nullable = false)
	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
