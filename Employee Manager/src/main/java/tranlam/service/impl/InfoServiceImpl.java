package tranlam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tranlam.dao.InfoDAO;
import tranlam.model.Department;
import tranlam.model.EmployeeType;
import tranlam.model.Position;
import tranlam.service.InfoService;

@Service
public class InfoServiceImpl implements InfoService {

	@Autowired
	InfoDAO infoDAO;

	@Override
	public List<Department> getListDepartment() {
		return infoDAO.getListDepartment();
	}

	@Override
	public List<Position> getListPosition() {
		return infoDAO.getListPosition();
	}

	@Override
	public List<EmployeeType> getListEmployeeType() {
		return infoDAO.getListEmployeeType();
	}


}
