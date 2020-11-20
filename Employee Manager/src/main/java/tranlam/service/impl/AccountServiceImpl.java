package tranlam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tranlam.dao.AccountDAO;
import tranlam.model.Account;
import tranlam.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDAO accountDAO;

	/**
	 * Gọi insert từ lớp DAO
	 */
	@Override
	public void insertAccount(Account account) {
		accountDAO.insertAccount(account);

	}

	/**
	 * Gọi update từ lớp DAO
	 */
	@Override
	public void editAccount(Account account) {
		accountDAO.editAccount(account);

	}

	/**
	 * Gọi delete từ lớp DAO
	 */
	@Override
	public void deleteAccount(Account account) {
		accountDAO.deleteAccount(account);

	}

	/**
	 * Kiểm tra địa chỉ email đã tồn tại chưa
	 */
	@Override
	public int checkIdEmail(String email) {
		return accountDAO.checkIdEmail(email);
	}

	/**
	 * Kiểm tra địa chỉ email đã tồn tại chưa
	 */
	@Override
	public int checkPassword(String password) {
		return accountDAO.checkPassword(password);
	}

	/**
	 * Lấy IDAccount từ lớp DAO
	 */
	@Override
	public Account getEmailAccount(String email) {
		return accountDAO.getEmailAccount(email);
	}

	/**
	 * Lấy List<Account> từ lớp DAO
	 */
	@Override
	public List<Account> getListAccount() {
		return accountDAO.getListAccount();
	}

	/**
	 * Gọi phương thức check email từ lớp DAO
	 */
	@Override
	public boolean checkEmail(String Email) {
		return accountDAO.checkEmail(Email);
	}

	/**
	 * Gọi phương thức loginAccount từ lớp DAO
	 */
	@Override
	public Account loginAccount(String Email, String Passowrd) {
		return accountDAO.loginAccount(Email, Passowrd);
	}

	/**
	 * Tìm kiếm tài khoản
	 */
	public List<Account> searchAccount(String search) {
		return accountDAO.searchAccount(search);
	}

}
