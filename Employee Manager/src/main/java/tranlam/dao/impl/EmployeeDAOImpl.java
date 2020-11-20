package tranlam.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tranlam.dao.EmployeeDAO;
import tranlam.model.Employee;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	SessionFactory sessionFactory;

	/**
	 * Thêm nhân viên
	 */
	@Override
	public void insertEmployee(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		/* employee.setId(new Date().getTime()); */
		session.save(employee);

	}

	/**
	 * Sửa nhân viên
	 */
	@Override
	public void editEmployee(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		session.update(employee);
	}

	/**
	 * Xóa nhân viên
	 */
	@Override
	public void deleteEmployee(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(employee);
	}

	/**
	 * Lấy ID nhân viên
	 */
	@Override
	public Employee getIDEmployee(String id) {
		Session session = sessionFactory.getCurrentSession();
		Employee employee = (Employee) session.get(Employee.class, id);
		return employee;
	}

	/**
	 * Kiểm tra địa chỉ ID đã tồn tại chưa
	 */
	@Override
	@SuppressWarnings("unchecked")
	public int checkIDEmmployee(String id) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE id = '" + id + "'").list();
		return list.size();
	}

	/**
	 * Lấy danh sách nhân viên
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> getAllEmployee() {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee").list();
		return list;
	}

	/**
	 * Lấy nhân viên từ phòng ban
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> getEmplByDepart(String idDepart) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE department.id = '" + idDepart + "'").list();
		return list;
	}

	/**
	 * Tìm kiếm theo ID + Name nhân viên
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> searchByEmpl(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session
				.createQuery("FROM Employee WHERE id Like '%" + search + "%' OR nameEmployee LIKE '%" + search + "%'")
				.list();
		return list;
	}

	/**
	 * Tìm kiếm theo cả 2
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> searchByBoth(String search, String idDepart) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE ID LIKE '%" + search
				+ "%' OR nameEmployee LIKE '%" + search + "%' " + " AND department.id = '" + idDepart + "'").list();
		return list;
	}

	/**
	 * Phân trang nhân viên
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> loadEmplPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Employee");
		int result = 0;
		if (page.equals("1")) {
			result = 0;
		} else {
			String temp = String.valueOf(page) + "0";
			result = Integer.parseInt(temp) - 10;
		}
		query.setFirstResult(result);
		query.setMaxResults(10);
		return query.list();
	}

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public int getRowEmpl() {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee").list();
		int i = 0;
		for (Employee empl : list) {
			i++;
		}
		return i;
	}

}
