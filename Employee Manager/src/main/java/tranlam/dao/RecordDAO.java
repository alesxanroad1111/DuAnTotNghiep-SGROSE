package tranlam.dao;

import java.util.List;

import tranlam.model.Employee;
import tranlam.model.Record;

public interface RecordDAO {

	/**
	 * Thêm bản ghi
	 * 
	 * @param record
	 */
	public void insertRecord(Record record);

	/**
	 * Sửa bản ghi
	 * 
	 * @param record
	 */
	public void editRecord(Record record);

	/**
	 * Xóa bản ghi
	 * 
	 * @param record
	 */
	public void deleteRecord(Record record);

	/**
	 * Lấy mã bản ghi
	 * 
	 * @param id
	 * @return
	 */
	public Record getIDRecord(int id);

	/**
	 * Kiểm tra có trùng id không
	 * 
	 * @param id
	 * @return
	 */
	public int checkIDRecord(int id);

	/**
	 * Lấy tất cả bản ghi
	 * 
	 * @return
	 */
	public List<Record> getAllRecord();

	/**
	 * load Nhân viên từ Phòng Ban
	 * 
	 * @param id
	 * @return
	 */
	public List<Employee> loadEmplByDepart(String id);

	/**
	 * Phân trang cho bản ghi
	 * 
	 * @param page
	 * @return
	 */
	public List<Record> loadRecrodPage(String page);

	public int getRowRecord();

	/**
	 * Báo cáo thành thích
	 * 
	 * @return
	 */
	public List<Object[]> reportRecord();

	/**
	 * Load bảng xếp hạng
	 * 
	 * @param month
	 * @return
	 */
	public int getRows(String month);

	/**
	 * Tìm kiếm Bản ghi
	 * 
	 * @param search
	 * @return
	 */
	public List<Record> searchRecord(String search);
	
	/**
	 * Tìm kiếm theo cả 2
	 * @param search
	 * @param idDepart
	 * @return
	 */
	public List<Record> searchByBoth(String search, String idDepart);

	/**
	 * Load bản ghi từ phòng ban
	 * 
	 * @param idDepart
	 * @return
	 */
	public List<Record> loadRecordByDepart(String idDepart);

}
