package tranlam.dao;

import java.util.List;

import tranlam.model.Department;
import tranlam.model.EmployeeType;
import tranlam.model.Position;


public interface InfoDAO {

	/**
	 * Lấy danh sách phòng ban
	 * 
	 * @return
	 */
	public List<Department> getListDepartment();

	/**
	 * Lấy danh sách chức vụ
	 * 
	 * @return
	 */
	public List<Position> getListPosition();

	/**
	 * Lấy danh sách loại nhân viên
	 * 
	 * @return
	 */
	public List<EmployeeType> getListEmployeeType();

	
}
