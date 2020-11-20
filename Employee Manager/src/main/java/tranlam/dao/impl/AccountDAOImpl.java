package tranlam.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tranlam.dao.AccountDAO;
import tranlam.model.Account;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	SessionFactory sessionFactory;

	// ==> Quản Lý Tài Khoản

	/**
	 * Thêm tài khoản
	 */
	@Override
	public void insertAccount(Account account) {
		Session session = sessionFactory.openSession();
		try {
			session.save(account);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}

	}

	/**
	 * Sửa tài khoản
	 */
	@Override
	public void editAccount(Account account) {
		Session session = sessionFactory.openSession();
		try {
			session.update(account);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}

	}

	/**
	 * Xóa tài khoản
	 */
	@Override
	public void deleteAccount(Account account) {
		Session session = sessionFactory.openSession();
		try {
			session.delete(account);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}

	}

	/**
	 * Lấy ID
	 */
	@Override
	public Account getEmailAccount(String email) {
		Session session = sessionFactory.openSession();
		try {
			Account account = (Account) session.get(Account.class, email);
			return account;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	/**
	 * Kiểm tra email đã tồn tại chưa
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int checkIdEmail(String email) {
		Session session = sessionFactory.openSession();
		List<Account> list = session.createQuery("FROM Account WHERE email = '" + email + "'").list();
		return list.size();
	}
	/**
	 * Kiểm tra mật khẩu có đúng không
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int checkPassword(String password) {
		Session session = sessionFactory.openSession();
		List<Account> list = session.createQuery("FROM Account WHERE password = '" + password + "'").list();
		return list.size();
	}

	/**
	 * Lấy danh sách tài khoản
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Account> getListAccount() {
		Session session = sessionFactory.openSession();
		try {
			List<Account> list = session.createQuery("FROM Account").list();
			return list;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	// ==> Đăng Nhập

	/**
	 * Kiểm tra Email tồn tại không
	 */
	@Override
	public boolean checkEmail(String Email) {
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("from Account where Email = :Email");
			query.setString("Email", Email);
			Account account = (Account) query.uniqueResult();
			return account != null;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return false;
	}

	/**
	 * Kiểm tra đăng nhập
	 */
	@Override
	public Account loginAccount(String Email, String Passowrd) {
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("from Account where Email = :Email and Password = :Password");
			query.setString("Email", Email);
			query.setString("Password", Passowrd);
			Account account = (Account) query.uniqueResult();
			return account;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	/**
	 * Tìm tài khoản
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Account> searchAccount(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Account> list = session.createQuery("FROM Account WHERE FullName LIKE '%" + search + "%'").list();
		return list;
	}

}
