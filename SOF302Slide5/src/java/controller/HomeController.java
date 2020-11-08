package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.Company;
import org.springframework.beans.factory.annotation.Qualifier;

@Controller
@RequestMapping("/home/")
public class HomeController {
	@Autowired @Qualifier("petro")
	Company company;

	@RequestMapping("index")
	public String index(ModelMap model) {
		model.addAttribute("company", company);
		return "home/index";
	}
	
}
