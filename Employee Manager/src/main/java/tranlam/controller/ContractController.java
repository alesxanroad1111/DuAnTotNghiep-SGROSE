package tranlam.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tranlam.model.Contract;
import tranlam.model.Department;
import tranlam.model.Employee;
import tranlam.service.ContractService;
import tranlam.service.EmployeeService;
import tranlam.validator.ContractValidator;

@Transactional
@Controller
@RequestMapping(value = "/admin/contract/")
public class ContractController {

	@Autowired
	ContractService contractService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	SessionFactory sessionFactory;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("contract", new Contract());
		model.addAttribute("listDepartment", getDepartment());
		model.addAttribute("listContract", contractService.getAllContract());
		if (contractService.getRowContract() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listContract", contractService.loadContractPage("1"));
			} else {
				model.addAttribute("listContract", contractService.loadContractPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(contractService.getRowContract()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("contract", new Contract());
			model.addAttribute("listContract", contractService.getAllContract());
			model.addAttribute("listDepartment", getDepartment());
		}
		return "contract/index";
	}

	// Form thêm hợp đồng
	@RequestMapping(value = "add-contract.htm", method = RequestMethod.GET)
	public String formAdd(ModelMap model) {
		model.addAttribute("contract", new Contract());
		model.addAttribute("listContract", contractService.getAllContract());
		model.addAttribute("listDepartment", getDepartment());
		return "contract/add-contract";
	}

	// Form sửa hợp đồng
	@RequestMapping(value = "edit-contract/{id}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("contract", contractService.getIDContract(id));
		model.addAttribute("listContract", contractService.getAllContract());
		model.addAttribute("listDepartment", getDepartment());
		return "contract/edit-contract";
	}

	// Lưu dữ liệu
	@RequestMapping(value = "save-contract.htm", method = RequestMethod.POST)
	public String saveContract(ModelMap model, @ModelAttribute("contract") @Valid Contract contract,
			BindingResult result) {
		ContractValidator contrVali = new ContractValidator();
		contrVali.validate(contract, result);
		if (result.hasErrors()) {
			model.addAttribute("listContract", contractService.getAllContract());
			model.addAttribute("listDepartment", getDepartment());
			return "contract/add-contract";
		} else {
			contractService.insertContract(contract);
			/*
			 * SendMail.sendMail(contract.getEmployee().getEmail(),
			 * "Xin Chào, Thành Viên: " +
			 * contract.getEmployee().getNameEmployee(),
			 * "Bạn đã là thành viên chính thức của Công Ty HBF" +
			 * "\nLoại Hợp Đồng: " + contract.getNameContract() +
			 * "\nNgày Bắt Đầu: " + contract.getStartTime() + "\nTrợ Cấp: " +
			 * contract.getSubsidize() + "\nLương: " + contract.getSalary());
			 */
			model.addAttribute("listContract", contractService.getAllContract());
			model.addAttribute("listDepartment", getDepartment());
		}
		return "redirect:/admin/contract/";

	}

	// Sửa dữ liệu
	@RequestMapping(value = "edit-contract/{id}.htm", method = RequestMethod.POST)
	public String editContract(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute("contract") @Valid Contract contract, BindingResult result) {
		ContractValidator contrVali = new ContractValidator();
		contrVali.validate(contract, result);
		if (result.hasErrors()) {
			model.addAttribute("listContract", contractService.getAllContract());
			return "contract/edit-contract";
		} else {
			contractService.editContract(contract);
			model.addAttribute("listContract", contractService.getAllContract());
		}
		return "redirect:/admin/contract/";

	}

	// Xóa dữ liệu
	@RequestMapping(value = "delete-contract/{id}.htm", method = RequestMethod.GET)
	public String deleteContract(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute("contract") Contract contract) {
		Employee employee = new Employee();
		contractService.deleteContract(contract);
		employeeService.deleteEmployee(employee);
		model.addAttribute("listContract", contractService.getAllContract());
		return "redirect:/admin/contract/";
	}

	// Tìm kiếm
	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String searchContract(ModelMap model, @RequestParam("search") String search,
			@RequestParam("filter") String filter) {
		if (search.equals("") && filter.equals("")) {
			model.addAttribute("listContract", contractService.getAllContract());
		} else if (search.equals("")) {
			model.addAttribute("listContract", contractService.loadContractByDepart(filter));
		} else if (filter.equals("")) {
			model.addAttribute("listContract", contractService.searchContract(search));
		} else {
			model.addAttribute("listContract", contractService.searchByBoth(search, filter));
		}
		model.addAttribute("listDepartment", getDepartment());
		return "contract/index";
	}

	// Lọc
	@RequestMapping(value = "filter.htm", method = RequestMethod.GET)
	public String filterContract(ModelMap model, @RequestParam("filter") String filter) {
		model.addAttribute("listContract", contractService.filterContract(filter));
		model.addAttribute("listDepartment", getDepartment());
		return "contract/index";
	}

	// Reset Status
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "reset-status/{id}.htm", method = RequestMethod.GET)
	public String resetContract(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute("contract") Contract contract) {
		contract = contractService.getIDContract(id);
		Date date = new Date();
		if (contract.getStatus() == 1 && contract.getNameContract().equals("HD Khong Xac Dinh Thoi Han")) {
			contract.setStatus(1);
			contract.setEndTime(null);
		} else if (contract.getStatus() == 1 && contract.getNameContract().equals("HD Xac Dinh Thoi Han")) {
			int year = 120;
			contract.setStatus(2);
			contract.setEndTime(new Date(year, date.getMonth(), date.getDate()));
		} else if (contract.getStatus() == 1 && contract.getNameContract().equals("HD Theo Mua Vu")) {
			int year = 119;
			contract.setStatus(2);
			contract.setEndTime(new Date(year, date.getMonth(), date.getDate()));
		} else {
			contract.setStatus(1);
		}
		contractService.editContract(contract);
		model.addAttribute("listContract", contractService.getAllContract());
		return "redirect:/admin/contract/";

	}

	// Load nhân viên từ phòng ban
	@RequestMapping(value = "loadEmpl.htm")
	public String loadEmployee(ModelMap model, @RequestParam("load") String load) {
		model.put("contract", new Contract());
		model.addAttribute("listEmployee", contractService.loadEmplByDepart(load));
		model.addAttribute("listContract", contractService.getAllContract());
		model.addAttribute("listDepartment", getDepartment());
		return "contract/add-contract";
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("employee")
	public List<Employee> getEmployee() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Employee").list();
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("department")
	public List<Department> getDepartment() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Department").list();
	}
}
