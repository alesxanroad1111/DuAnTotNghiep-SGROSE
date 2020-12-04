package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user/")
public class UserController {
	@RequestMapping("login")
	public String login() {
		return "user/login";
	}
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(ModelMap model, 
			@RequestParam("id") String id,
			@RequestParam("password") String password,
			HttpSession session) {
		if(id.equals("fpt") && password.equals("poly")){
			session.setAttribute("user", id);
			model.addAttribute("message", "Đăng nhập thành công !");
                        
		}
		else{
			model.addAttribute("message", "Sai thông tin đăng nhập !");
		}
		return "user/login";
	}
	
	@RequestMapping("logoff")
	public String logoff() {
		return "user/index";
	}
	@RequestMapping("register")
	public String register() {
		return "user/index";
	}
	@RequestMapping("activate")
	public String activate() {
		return "user/index";
	}
	@RequestMapping("forgot-password")
	public String forgot() {
		return "user/index";
	}
	@RequestMapping("change-password")
	public String change() {
		return "user/index";
	}
	@RequestMapping("edit-profile")
	public String edit() {
		return "user/index";
	}
}
