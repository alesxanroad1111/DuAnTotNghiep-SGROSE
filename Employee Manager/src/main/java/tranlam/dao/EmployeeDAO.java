package tranlam.dao;

import java.util.List;

import tranlam.model.Employee;

public interface EmployeeDAO {

	public void insertEmployee(Employee employee);

	
	public void editEmployee(Employee employee);

	
	public void deleteEmployee(Employee employee);

	
	public Employee getIDEmployee(String id);

	
	public int checkIDEmmployee(String id);

	
	public List<Employee> getAllEmployee();

	
	public List<Employee> getEmplByDepart(String idDepart);

	
	public List<Employee> searchByEmpl(String search);

	
	public List<Employee> searchByBoth(String search, String idDepart);

	
	public List<Employee> loadEmplPage(String page);
	
	public int getRowEmpl();

}
