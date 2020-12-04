package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/")
public class OrderController {
	@RequestMapping("checkout")
	public String checkout() {
		return "order/index";
	}
	@RequestMapping("list")
	public String list() {
		return "order/index";
	}
	@RequestMapping("detail")
	public String detail() {
		return "order/index";
	}
}
