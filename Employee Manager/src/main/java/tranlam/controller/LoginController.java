package tranlam.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tranlam.model.Account;
import tranlam.service.AccountService;

@Transactional
@Controller
@RequestMapping(value = "/admin/login/")
public class LoginController {

	@Autowired
	AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String login(ModelMap model) {
		model.put("loginForm", new Account());
		return "login/index";
	}

	@RequestMapping(value = "login.htm")
	public String login(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("loginForm") Account acc, ModelMap model, BindingResult result) {
		if (acc.getEmail().trim().length() == 0) {
			result.rejectValue("email", "login.validate.email");
		} else if (accountService.checkIdEmail(acc.getEmail()) == 0) {
			result.rejectValue("email", "login.validate.checkEmail");
		} else if (acc.getPassword().trim().length() == 0) {
			result.rejectValue("password", "login.validate.password");
		} else if (accountService.checkPassword(acc.getPassword()) == 0) {
			result.rejectValue("password", "login.validate.checkPassword");
		}
		result.hasErrors();

		Account account = accountService.loginAccount(acc.getEmail(), acc.getPassword());
		if (account != null) {
			HttpSession session = request.getSession();
			session.setAttribute("account", account);
			if (request.getParameter("remember") != null) {
				Cookie ckEmail = new Cookie("email", acc.getEmail());
				ckEmail.setMaxAge(3600);
				response.addCookie(ckEmail);
				Cookie ckPass = new Cookie("password", acc.getPassword());
				ckPass.setMaxAge(3600);
				response.addCookie(ckPass);
				System.out.println("Cookie: " + acc.getEmail());
			}
			int rolse = account.getAccess();
			String res = null;
			switch (rolse) {
			case 1:
				res = "redirect:/home";
				break;
			case 2:
				res = "redirect:/admin/record/report";
				break;
			}
			System.out.println("ahihi" + account.getAccess());
			return res;
		} else {
			return "login/index";
		}

	}

	@RequestMapping(value = "logout.htm", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		// Gỡ bỏ phiên làm việc
		session.removeAttribute("account");
		// Gỡ bỏ cookie
		for (Cookie ck : request.getCookies()) {
			if (ck.getName().equalsIgnoreCase("email")) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			if (ck.getName().equalsIgnoreCase("password")) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
		}
		return "redirect:/admin/login/";
	}

}
