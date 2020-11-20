package tranlam.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tranlam.model.Contract;
import tranlam.model.Department;
import tranlam.model.Employee;
import tranlam.model.EmployeeType;
import tranlam.model.Position;
import tranlam.other.SendMail;
import tranlam.service.ContractService;
import tranlam.service.EmployeeService;
import tranlam.validator.ContractValidator;
import tranlam.validator.EmployeeValidator;;

@Transactional
@Controller
@RequestMapping(value = "/admin/employee/")
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	@Autowired
	ContractService contractService;
	@Autowired
	SessionFactory sessionFactory;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("listEmployee", employeeService.getAllEmployee());
		model.addAttribute("listDepartment", getDepartment());
		if (employeeService.getRowEmpl() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listEmployee", employeeService.loadEmplPage("1"));
			} else {
				model.addAttribute("listEmployee", employeeService.loadEmplPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(employeeService.getRowEmpl()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
			model.addAttribute("listDepartment", getDepartment());
		}
		return "employee/index";

	}

	// Form thêm nhân viên
	@RequestMapping(value = "add-empl.htm", method = RequestMethod.GET)
	public String formAdd(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("employee", new Employee());
		model.addAttribute("listEmployee", employeeService.getAllEmployee());
		if (employeeService.getRowEmpl() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listEmployee", employeeService.loadEmplPage("1"));
			} else {
				model.addAttribute("listEmployee", employeeService.loadEmplPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(employeeService.getRowEmpl()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("employee", new Employee());
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
		}
		return "employee/add-empl";
	}

	// Form sửa nhân viên
	@RequestMapping(value = "edit-empl/{id}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("employee", employeeService.getIDEmployee(id));
		return "employee/edit-empl";
	}

	// Lưu dữ liệu
	@RequestMapping(value = "save-empl.htm", method = RequestMethod.POST)
	public String saveEmpl(ModelMap model, @ModelAttribute(value = "employee") @Validated Employee employee,
			BindingResult result) {
		EmployeeValidator empVali = new EmployeeValidator();
		empVali.validate(employee, result);

		if (employee.getId() == null) {
			result.reject("id");
		} else if (employeeService.checkIdEmployee(employee.getId()) > 0) {
			result.rejectValue("id", "message.id");
		}

		if (result.hasErrors()) {
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
			return "employee/add-empl";
		} else {
			employeeService.insertEmployee(employee);
			SendMail.sendMail(employee.getEmail(), "Xin Chào, Thành Viên: " + employee.getNameEmployee(),
					"Bạn đã là thành viên chính thức của Công Ty HBF" + "\nĐịa Chỉ Email: " + employee.getEmail()
							+ "\nĐịa Chỉ: " + employee.getAddress() + "\nSố Điện Thoại: " + employee.getNumberPhone()
							+ "\nNgày Sinh: " + employee.getBirthday() + "\nLoại Nhân Viên: "
							+ employee.getEmployeeType().getNameEmployeeType() + "\nPhòng Ban: "
							+ employee.getDepartment().getNameDepartment() + "\nChức Vụ: "
							+ employee.getPosition().getNamePosition());

			model.addAttribute("listEmployee", employeeService.getAllEmployee());

		}
		return "redirect:/admin/contract/add-contract.htm";

	}

	// Sửa dữ liệu
	@RequestMapping(value = "edit-empl/{id}.htm", method = RequestMethod.POST)
	public String editEmpl(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute(value = "employee") @Validated Employee employee, BindingResult result) {
		EmployeeValidator emplVali = new EmployeeValidator();
		emplVali.validate(employee, result);
		if (result.hasErrors()) {
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
			return "employee/edit-empl";
		} else {
			employeeService.editEmployee(employee);
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
		}
		return "redirect:/admin/employee/";
	}

	// Xóa dữ liệu
	@RequestMapping(value = "delete-empl/{id}.htm", method = RequestMethod.GET)
	public String deleteEmpl(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute(value = "employee") Employee employee) {
		Contract contract = new Contract();
		contractService.deleteContract(contract);
		employeeService.deleteEmployee(employee);
		model.addAttribute("listEmployee", employeeService.getAllEmployee());
		return "redirect:/admin/employee/";
	}

	// Xem Chi Tiết
	@RequestMapping(value = "detail/{id}.htm", method = RequestMethod.GET)
	public String detailEmpl(ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("employee", employeeService.getIDEmployee(id));
		return "employee/detail";
	}

	// Lọc Nhân Viên
	@RequestMapping(value = "filter.htm", method = RequestMethod.GET)
	public String filterEmployee(ModelMap model, @RequestParam("NV") String byNV, @RequestParam("PB") String byPB) {
		if (byNV.equals("") && byPB.equals("")) {
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
		} else if (byNV.equals("")) {
			model.addAttribute("listEmployee", employeeService.getEmplByDepart(byPB));
		} else if (byPB.equals("")) {
			model.addAttribute("listEmployee", employeeService.searchByEmpl(byNV));
		} else {
			model.addAttribute("listEmployee", employeeService.searchByBoth(byNV, byPB));
		}
		model.addAttribute("listDepartment", getDepartment());
		return "employee/index";
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("employeeType")
	public List<EmployeeType> getEmployeeType() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM EmployeeType").list();
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("department")
	public List<Department> getDepartment() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Department").list();
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("position")
	public List<Position> getPosition() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Position").list();
	}

	// Form thêm nhân viên
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String test(ModelMap model) {
		Employee employee = new Employee();
		Contract contract = new Contract();
		model.addAttribute("employee", employee);
		model.addAttribute("contract", contract);
		model.addAttribute("listContract", contractService.getAllContract());
		model.addAttribute("listEmployee", employeeService.getAllEmployee());
		return "employee/test";
	}

	// lưu nhân viên
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(ModelMap model, @ModelAttribute(value = "employee") Employee employee,
			@ModelAttribute(value = "contract") Contract contract, BindingResult result) {
		EmployeeValidator empVali = new EmployeeValidator();
		empVali.validate(employee, result);
		ContractValidator contrVali = new ContractValidator();
		contrVali.validate(contract, result);
		if (result.hasErrors()) {
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
			model.addAttribute("listContract", contractService.getAllContract());
			return "employee/test";
		} else {
			contract.setEmployee(employee);
			employee.setContract(contract);
			employeeService.insertEmployee(employee);
			contractService.insertContract(contract);
			model.addAttribute("listContract", contractService.getAllContract());
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
		}
		return "redirect:/admin/employee/";

	}

}
