package tranlam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tranlam.dao.EmployeeDAO;
import tranlam.model.Employee;
import tranlam.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDAO employeeDAO;

	/**
	 * Gọi insert từ lớp DAO
	 */
	@Override
	public void insertEmployee(Employee employee) {
		employeeDAO.insertEmployee(employee);

	}

	/**
	 * Gọi edit từ lớp DAO
	 */
	@Override
	public void editEmployee(Employee employee) {
		employeeDAO.editEmployee(employee);

	}

	/**
	 * Gọi delete từ lớp DAO
	 */
	@Override
	public void deleteEmployee(Employee employee) {
		employeeDAO.deleteEmployee(employee);

	}

	/**
	 * Lấy ID từ lớp DAO
	 */
	@Override
	public Employee getIDEmployee(String id) {
		return employeeDAO.getIDEmployee(id);
	}

	/**
	 * Kiểm tra ID
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public int checkIdEmployee(String id) {
		return employeeDAO.checkIDEmmployee(id);
	}

	/**
	 * Lấy List<Employee> từ lớp DAO
	 */
	@Override
	public List<Employee> getAllEmployee() {
		return employeeDAO.getAllEmployee();
	}

	/**
	 * Lấy nhân viên từ phòng ban
	 */
	public List<Employee> getEmplByDepart(String idDepart) {
		return employeeDAO.getEmplByDepart(idDepart);
	}

	/**
	 * Tìm kiếm theo tên và mã nhân viên
	 */
	public List<Employee> searchByEmpl(String search) {
		return employeeDAO.searchByEmpl(search);
	}

	/**
	 * Tìm kiếm theo cả 2
	 */
	public List<Employee> searchByBoth(String search, String idDepart) {
		return employeeDAO.searchByBoth(search, idDepart);
	}

	/**
	 * Phân trang cho nhân viên
	 */
	@Override
	public List<Employee> loadEmplPage(String page) {
		return employeeDAO.loadEmplPage(page);
	}

	@Override
	public int getRowEmpl() {
		return employeeDAO.getRowEmpl();
	}

}
