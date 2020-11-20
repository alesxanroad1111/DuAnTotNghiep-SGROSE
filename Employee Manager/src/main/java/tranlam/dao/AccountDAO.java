package tranlam.dao;

import java.util.List;

import tranlam.model.Account;

public interface AccountDAO {

	// ==> Quản Lý Tài Khoản

	/**
	 * Thêm tài khoản
	 * 
	 * @param account
	 */
	public void insertAccount(Account account);

	/**
	 * Sửa tài khoản
	 * 
	 * @param account
	 */
	public void editAccount(Account account);

	/**
	 * Xóa tài khoản
	 * 
	 * @param account
	 */
	public void deleteAccount(Account account);

	/**
	 * Load ID tài khoản
	 * 
	 * @param email
	 * @return
	 */
	public Account getEmailAccount(String email);

	
	
	/**
	 * Kiểm tra email tồn tại chưa
	 * 
	 * @param email
	 * @return
	 */
	public int checkIdEmail(String email);

	/**
	 * Kiểm tra mật khẩu có đúng không
	 * 
	 * @param password
	 * @return
	 */
	public int checkPassword(String password);

	/**
	 * Load danh sách tài khoản
	 * 
	 * @return
	 */
	public List<Account> getListAccount();

	// ==> Đăng Nhập

	/**
	 * Kiểm tra địa chỉ Email đã tồn tại hay chưa
	 * 
	 * @param Email
	 * @return
	 */
	public boolean checkEmail(String Email);

	/**
	 * Kiểm tra đăng nhập
	 * 
	 * @param Email
	 * @param Passowrd
	 * @return
	 */
	public Account loginAccount(String Email, String Passowrd);

	/**
	 * Tìm kiếm tài khoản
	 * 
	 * @param NameEmployee
	 * @return
	 */
	public List<Account> searchAccount(String search);
}
