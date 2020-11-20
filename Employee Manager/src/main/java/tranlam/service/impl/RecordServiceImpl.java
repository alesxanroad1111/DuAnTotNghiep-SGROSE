package tranlam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tranlam.dao.RecordDAO;
import tranlam.model.Employee;
import tranlam.model.Record;
import tranlam.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService {

	@Autowired
	RecordDAO recordDAO;

	/**
	 * Thêm bản ghi
	 */
	@Override
	public void insertRecord(Record record) {
		recordDAO.insertRecord(record);
	}

	/**
	 * Sửa bản ghi
	 */
	@Override
	public void editRecord(Record record) {
		recordDAO.editRecord(record);
	}

	/**
	 * Xóa bản ghi
	 */
	@Override
	public void deleteRecord(Record record) {
		recordDAO.deleteRecord(record);
	}

	/**
	 * Lấy ID Bản ghi
	 */
	@Override
	public Record getIDRecord(int id) {
		return recordDAO.getIDRecord(id);
	}

	/**
	 * Kiểm tra bản ghi
	 */
	@Override
	public int checkIDRecord(int id) {
		return recordDAO.checkIDRecord(id);
	}

	/**
	 * Lấy tất cả các bản ghi
	 */
	@Override
	public List<Record> getAllRecord() {
		return recordDAO.getAllRecord();
	}

	/**
	 * Lấy nhân viên từ phòng ban
	 */
	@Override
	public List<Employee> loadEmplByDepart(String id) {
		return recordDAO.loadEmplByDepart(id);
	}

	/**
	 * Phân trang record
	 */
	@Override
	public List<Record> loadRecrodPage(String page) {
		return recordDAO.loadRecrodPage(page);
	}

	@Override
	public int getRowRecord() {
		return recordDAO.getRowRecord();
	}

	/**
	 * Báo cáo thành tích
	 */
	public List<Object[]> reportRecord() {
		return recordDAO.reportRecord();
	}

	/**
	 * Load Bảng Xếp Hàng
	 */
	public int getRows(String month) {
		return recordDAO.getRows(month);
	}

	/**
	 * Tìm kiếm
	 */

	public List<Record> searchRecord(String search) {
		return recordDAO.searchRecord(search);
	}

	/**
	 * Tìm kiếm theo cả 2
	 */
	public List<Record> searchByBoth(String search, String idDepart) {
		return recordDAO.searchByBoth(search, idDepart);
	}

	/**
	 * Lấy nhân viên từ phòng ban
	 */
	public List<Record> loadRecordByDepart(String idDepart) {
		return recordDAO.loadRecordByDepart(idDepart);
	}
}
