package tranlam.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tranlam.dao.RecordDAO;
import tranlam.model.Employee;
import tranlam.model.Record;

@Repository
public class RecordDAOImpl implements RecordDAO {

	@Autowired
	SessionFactory sessionFactory;

	/**
	 * Thêm bản ghi
	 */
	@Override
	public void insertRecord(Record record) {
		Session session = sessionFactory.getCurrentSession();
		record.setDateWrite(new Date());
		session.save(record);
	}

	/**
	 * Sửa bản ghi
	 */
	@Override
	public void editRecord(Record record) {
		Session session = sessionFactory.getCurrentSession();
		session.update(record);
	}

	/**
	 * Xóa bản ghi
	 */
	@Override
	public void deleteRecord(Record record) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(record);
	}

	/**
	 * Lấy ID bản ghi
	 */
	@Override
	public Record getIDRecord(int id) {
		Session session = sessionFactory.getCurrentSession();
		Record record = (Record) session.get(Record.class, id);
		return record;
	}

	/**
	 * Kiểm tra địa chỉ ID đã tồn tại chưa
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int checkIDRecord(int id) {
		Session session = sessionFactory.getCurrentSession();
		List<Record> list = session.createQuery("FROM Record WHERE id ='" + id + "'").list();
		return list.size();
	}

	/**
	 * Lấy danh sách Bàn Ghi
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Record> getAllRecord() {
		Session session = sessionFactory.getCurrentSession();
		List<Record> list = session.createQuery("FROM Record").list();
		return list;
	}

	/**
	 * Lấy Nhân Viên từ Phòng Ban
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> loadEmplByDepart(String id) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE department.id = '" + id + "'").list();
		return list;
	}

	/**
	 * Phân trang cho Bản Ghi
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Record> loadRecrodPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Record");
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
	public int getRowRecord() {
		Session session = sessionFactory.getCurrentSession();
		List<Record> list = session.createQuery("FROM Record").list();
		int i = 0;
		for (Record record : list) {
			i++;
		}
		return i;
	}

	/**
	 * Báo cáo thành tích
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> reportRecord() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT hieu.employee.id, hieu.employee.nameEmployee, "
				+ "SUM(case when hieu.type=1 then 1 else 0 end)," + "SUM(case when hieu.type=0 then 1 else 0 end),"
				+ "SUM(hieu.price)" + "FROM Record hieu " + "GROUP BY hieu.employee.id, hieu.employee.nameEmployee";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public int getRows(String month) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT hieu.employee.id, hieu.employee.nameEmployee, "
				+ "SUM(CASE WHEN hieu.type = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN hieu.type = 0 THEN 1 ELSE 0 END),"
				+ "SUM(CASE WHEN TYPE = 1 THEN 1 ELSE 0 END) - SUM(CASE WHEN TYPE = 0 THEN 1 ELSE 0 END) AS TONGKET "
				+ "FROM Record hieu WHERE dateWrite LIKE '" + month + "%' "
				+ "GROUP BY hieu.employee.id, hieu.employee.nameEmployee " + "ORDER BY TONGKET DESC";
		List<Object[]> list = session.createQuery(hql).list();
		int i = 0;
		for (Object[] hieu : list) {
			i++;
		}
		return i;
	}

	/**
	 * Tìm kiếm
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Record> searchRecord(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Record> list = session.createQuery("FROM Record WHERE employee.id LIKE '%" + search
				+ "%'  or price LIKE '%" + search + "%' or employee.nameEmployee LIKE '%" + search
				+ "%' or reason LIKE '%" + search + "%' or dateWrite LIKE '%" + search + "%'").list();
		return list;
	}

	/**
	 * Tìm kiếm cả 2
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Record> searchByBoth(String search, String idDepart) {
		Session session = sessionFactory.getCurrentSession();
		List<Record> list = session.createQuery("FROM Record WHERE employee.id LIKE '%" + search
				+ "%'  or price LIKE '%" + search + "%' or employee.nameEmployee LIKE '%" + search
				+ "%' or reason LIKE '%" + search + "%' or dateWrite LIKE '%" + search
				+ "%' AND employee.department.id LIKE '%" + idDepart + "%'").list();
		return list;
	}

	/**
	 * Lọc Phòng Ban
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Record> loadRecordByDepart(String idDepart) {
		Session session = sessionFactory.getCurrentSession();
		List<Record> list = session.createQuery("FROM Record Where employee.department.id = '" + idDepart + "'").list();
		return list;

	}

}
