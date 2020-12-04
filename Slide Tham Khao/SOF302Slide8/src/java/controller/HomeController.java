package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home/")
public class HomeController {
	@RequestMapping("index")
	public String index() {
		System.out.println("HomeController.index()");
		return "home/index";
	}
	@RequestMapping("about")
	public String about() {
		System.out.println("HomeController.about()");
		return "home/index";
	}
	@RequestMapping("contact")
	public String contact() {
		System.out.println("HomeController.contact()");
		return "home/index";
	}
}


