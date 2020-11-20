package tranlam.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Record", schema = "dbo", catalog = "EmployeeManager")
public class Record implements java.io.Serializable {

	private static final long serialVersionUID = 7671967873228270783L;
	private Integer id;
	private Employee employee;
	private boolean type;
	private int price;
	private String reason;
	private Date dateWrite;

	public Record() {
	}

	public Record(Integer id, Employee employee, boolean type) {
		this.id = id;
		this.employee = employee;
		this.type = type;
	}

	public Record(Integer id, Employee employee, boolean type, String reason, int price, Date dateWrite) {
		this.id = id;
		this.employee = employee;
		this.type = type;
		this.reason = reason;
		this.price = price;
		this.dateWrite = dateWrite;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ID_Employee", nullable = false)
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "Type", nullable = false)
	public boolean isType() {
		return this.type;
	}

	public void setType(boolean type) {
		this.type = type;
	}

	@Column(name = "Reason")
	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Column(name = "Price")
	public int getPrice() {
		return this.price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "DateWrite", length = 23)
	public Date getDateWrite() {
		return this.dateWrite;
	}

	public void setDateWrite(Date dateWrite) {
		this.dateWrite = dateWrite;
	}

}
