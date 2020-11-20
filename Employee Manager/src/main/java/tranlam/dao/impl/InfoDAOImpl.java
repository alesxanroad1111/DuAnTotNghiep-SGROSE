package tranlam.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tranlam.dao.InfoDAO;
import tranlam.model.Department;
import tranlam.model.EmployeeType;
import tranlam.model.Position;

@Repository
public class InfoDAOImpl implements InfoDAO {

	@Autowired
	SessionFactory sessionFactory;

	/**
	 * Lấy danh sách phòng ban
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getListDepartment() {
		Session session = sessionFactory.getCurrentSession();
		List<Department> list = session.createQuery("FROM Department").list();
		return list;
	}


	/**
	 * Lấy danh sách chức vụ
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Position> getListPosition() {
		Session session = sessionFactory.getCurrentSession();
		List<Position> list = session.createQuery("FROM Position").list();
		return list;
	}

	/**
	 * Lấy dánh sách loại nhân viên
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeType> getListEmployeeType() {
		Session session = sessionFactory.getCurrentSession();
		List<EmployeeType> list = session.createQuery("FROM EmployeeType").list();
		return list;
	}



}
