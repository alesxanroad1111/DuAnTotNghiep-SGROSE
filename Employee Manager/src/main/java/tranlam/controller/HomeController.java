package tranlam.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tranlam.service.EmployeeService;

@Transactional
@Controller
public class HomeController {

	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	EmployeeService employeeService;

	// Trang chủ
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "home")
	public String home(ModelMap model, HttpServletRequest request) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT hieuboy.employee.id, hieuboy.employee.nameEmployee, "
				+ "SUM(CASE WHEN hieuboy.type = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN hieuboy.type = 0 THEN 1 ELSE 0 END),"
				+ "SUM(CASE WHEN type = 1 THEN 1 ELSE 0 END) - SUM(CASE WHEN type = 0 THEN 1 ELSE 0 END),"
				+ "SUM(hieuboy.price) AS Tongket "
				+ "FROM Record hieuboy GROUP BY hieuboy.employee.id, hieuboy.employee.nameEmployee "
				+ "ORDER BY Tongket DESC";
		List<Object[]> list = session.createQuery(hql).list();
		model.addAttribute("employee", employeeService.getAllEmployee());
		model.addAttribute("employee", list);
		return "index";
	}

	// Xem Chi Tiết
	@RequestMapping(value = "home/detail/{id}.htm", method = RequestMethod.GET)
	public String detailEmpl(ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("employee", employeeService.getIDEmployee(id));
		return "employee/detail";
	}
}
