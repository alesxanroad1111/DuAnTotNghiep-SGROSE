package tranlam.service;

import java.util.List;

import tranlam.model.Contract;
import tranlam.model.Employee;

public interface ContractService {

	/**
	 * Hàm Thêm Hợp Đồng
	 * 
	 * @param contract
	 */
	public void insertContract(Contract contract);

	/**
	 * Hàm Sửa Hợp Đồng
	 * 
	 * @param contract
	 */
	public void editContract(Contract contract);

	/**
	 * Hàm Xóa Hợp Đồng
	 * 
	 * @param contract
	 */
	public void deleteContract(Contract contract);

	/**
	 * Lấy Mã Hợp Đồng
	 * 
	 * @param id
	 */
	public Contract getIDContract(String id);

	/**
	 * Kiểm tra id
	 * 
	 * @param id
	 * @return
	 */
	public int checkIDContract(String id);

	/**
	 * Lấy Tất Cả Hợp Đồng
	 * 
	 * @return
	 */
	public List<Contract> getAllContract();

	/**
	 * Tìm kiếm hợp đồng
	 * 
	 * @param search
	 * @return
	 */
	public List<Contract> searchContract(String search);

	/**
	 * Tìm kiếm theo cả 2
	 * 
	 * @param search
	 * @param idDepart
	 * @return
	 */
	public List<Contract> searchByBoth(String search, String idDepart);

	/**
	 * Load hợp đồng theo phòng ban
	 * 
	 * @param idDepart
	 * @return
	 */
	public List<Contract> loadContractByDepart(String idDepart);

	/**
	 * Lọc hợp đồng
	 * 
	 * @param nameContract
	 * @return
	 */
	public List<Contract> filterContract(String status);

	/**
	 * Lấy nhân viên từ phòng ban
	 * 
	 * @param id
	 * @return
	 */
	public List<Employee> loadEmplByDepart(String id);

	/**
	 * Phân trang hợp đồng
	 * 
	 * @param page
	 * @return
	 */
	public List<Contract> loadContractPage(String page);

	public int getRowContract();

}
