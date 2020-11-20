package tranlam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tranlam.service.InfoService;

@Transactional
@Controller
@RequestMapping(value = "/admin/info/")
public class InfoController {

	@Autowired
	InfoService infoService;

	@RequestMapping(method = RequestMethod.GET)
	public String info(ModelMap model) {
		model.put("listInfoCV", infoService.getListPosition());
		model.put("listInfoLNV", infoService.getListEmployeeType());

		return "info/index";
	}

	@RequestMapping(value="department", method = RequestMethod.GET)
	public String infoPB(ModelMap model) {
		model.put("listInfoPB", infoService.getListDepartment());
		return "info/department";
	}

}
