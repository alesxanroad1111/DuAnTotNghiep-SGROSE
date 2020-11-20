package tranlam.controller;

import java.text.SimpleDateFormat;
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

import tranlam.model.Department;
import tranlam.model.Record;
import tranlam.service.RecordService;
import tranlam.validator.RecordValidator;

@Transactional
@Controller
@RequestMapping(value = "/admin/record/")
public class RecordController {

	@Autowired
	RecordService recordService;
	@Autowired
	SessionFactory sessionFactory;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String viewIndex(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("listRecord", recordService.getAllRecord());
		if (recordService.getRowRecord() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listRecord", recordService.loadRecrodPage("1"));
			} else {
				model.addAttribute("listRecord", recordService.loadRecrodPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(recordService.getRowRecord()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listRecord", recordService.getAllRecord());
		}
		model.addAttribute("listDepartment", getDepartment());
		return "record/index";
	}

	// Mở Form tạo dữ liệu
	@RequestMapping(value = "add-record.htm", method = RequestMethod.GET)
	public String fromAdd(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("record", new Record());
		model.addAttribute("listRecord", recordService.getAllRecord());
		model.addAttribute("listDepartment", getDepartment());
		if (recordService.getRowRecord() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listRecord", recordService.loadRecrodPage("1"));
			} else {
				model.addAttribute("listRecord", recordService.loadRecrodPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(recordService.getRowRecord()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("record", new Record());
			model.addAttribute("listRecord", recordService.getAllRecord());
			model.addAttribute("listDepartment", getDepartment());
		}
		return "record/add-record";
	}

	// Mở Form sửa dữ liệu
	@RequestMapping(value = "edit-record/{id}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable(value = "id") Integer id, HttpServletRequest request,
			HttpServletResponse response) {
		model.put("record", recordService.getIDRecord(id));
		model.addAttribute("listRecord", recordService.getAllRecord());
		if (recordService.getRowRecord() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listRecord", recordService.loadRecrodPage("1"));
			} else {
				model.addAttribute("listRecord", recordService.loadRecrodPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(recordService.getRowRecord()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.put("record", recordService.getIDRecord(id));
			model.addAttribute("listRecord", recordService.getAllRecord());
		}
		return "record/edit-record";
	}

	// Sửa dữ liệu
	@RequestMapping(value = "edit-record/{id}.htm", method = RequestMethod.POST)
	public String editAcc(ModelMap model, @PathVariable(value = "id") Integer id,
			@ModelAttribute(value = "record") @Valid Record record, BindingResult result) {
		RecordValidator recordVali = new RecordValidator();
		recordVali.validate(record, result);

		if (result.hasErrors()) {
			model.addAttribute("listRecord", recordService.getAllRecord());
			return "record/edit-record";
		} else {
			recordService.editRecord(record);
			model.put("listRecord", recordService.getAllRecord());
		}
		return "redirect:/admin/record/";
	}

	// Lưu dữ liệu
	@RequestMapping(value = "save-record.htm", method = RequestMethod.POST)
	public String saveAcc(ModelMap model, @ModelAttribute(value = "record") @Valid Record record,
			BindingResult result) {
		RecordValidator recordVali = new RecordValidator();
		recordVali.validate(record, result);
		if (result.hasErrors()) {
			model.addAttribute("listRecord", recordService.getAllRecord());
			model.addAttribute("listDepartment", getDepartment());
			return "record/add-record";
		} else {
			recordService.insertRecord(record);
			model.put("listRecord", recordService.getAllRecord());
		}
		return "redirect:/admin/record/";
	}

	// Xóa dữ liệu
	@RequestMapping(value = "delete-record/{id}.htm", method = RequestMethod.GET)
	public String deleteAcc(ModelMap model, @PathVariable(value = "id") Integer id,
			@ModelAttribute(value = "record") Record record) {
		recordService.deleteRecord(record);
		model.put("listRecord", recordService.getAllRecord());
		return "redirect:/admin/record/";
	}

	// Load nhân viên từ phòng ban
	@RequestMapping(value = "loadEmpl.htm")
	public String loadEmployee(ModelMap model, @RequestParam("load") String load) {
		model.put("record", new Record());
		model.addAttribute("listEmployee", recordService.loadEmplByDepart(load));
		model.addAttribute("listRecord", recordService.getAllRecord());
		model.addAttribute("listDepartment", getDepartment());
		return "record/add-record";
	}

	// Show báo cáo
	@RequestMapping(value = "report")
	public String report(ModelMap model) {
		String currentMonth = new SimpleDateFormat("MM/yyyy").format(new Date());
		model.addAttribute("bxh", recordService.getRows(currentMonth));
		model.addAttribute("arrays", recordService.reportRecord());
		return "record/report";
	}

	// Tìm kiếm bản ghi

	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String search(ModelMap model, @RequestParam("search") String search, @RequestParam("filter") String filter) {
		if (search.equals("") && filter.equals("")) {
			model.addAttribute("listRecord", recordService.getAllRecord());
		} else if (search.equals("")) {
			model.addAttribute("listRecord", recordService.loadRecordByDepart(filter));
		} else if (filter.equals("")) {
			model.addAttribute("listRecord", recordService.searchRecord(search));
		} else {
			model.addAttribute("listRecord", recordService.searchByBoth(search, filter));
		}
		model.addAttribute("listDepartment", getDepartment());
		return "record/index";
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("department")
	public List<Department> getDepartment() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Department").list();
	}
}
