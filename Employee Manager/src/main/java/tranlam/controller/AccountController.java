package tranlam.controller;

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

import tranlam.model.Account;
import tranlam.service.AccountService;

@Transactional
@Controller
@RequestMapping(value = "/admin/account/")
public class AccountController {

	@Autowired
	AccountService accountService;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String viewIndex(ModelMap model) {
		model.put("listAccount", accountService.getListAccount());
		return "account/index";
	}

	// Mở Form tạo dữ liệu
	@RequestMapping(value = "add-acc.htm", method = RequestMethod.GET)
	public String fromAdd(ModelMap model) {
		model.put("account", new Account());
		model.put("listAccount", accountService.getListAccount());
		return "account/add-acc";
	}

	// Mở Form sửa dữ liệu
	@RequestMapping(value = "edit-acc/{email}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable(value = "email") String email) {
		model.put("account", accountService.getEmailAccount(email));
		model.put("listAccount", accountService.getListAccount());
		return "account/edit-acc";
	}

	// Sửa dữ liệu
	@RequestMapping(value = "edit-acc/{email}.htm", method = RequestMethod.POST)
	public String editAcc(ModelMap model, @PathVariable(value = "email") String email,
			@ModelAttribute(value = "account") Account account, BindingResult error) {

		/*
		 * if (account.getEmail().trim().length() == 0) {
		 * error.rejectValue("email", "account", "Hãy điền địa chỉ email !"); }
		 * else if (account.getEmail().indexOf(" ") > 0) {
		 * error.rejectValue("email", "account",
		 * "Email không được chứa khoảng trống !"); } else if
		 * (!account.getEmail().endsWith("@gmail.com")) {
		 * error.rejectValue("email", "account",
		 * "Email phải có đuôi là @gmail.com"); } else if
		 * (accountService.checkIdEmail(account.getEmail()) > 0) {
		 * error.rejectValue("email", "account",
		 * "Địa chỉ email này đã tồn tại !"); }
		 * 
		 * if (account.getPassword().trim().length() == 0) {
		 * error.rejectValue("password", "account",
		 * "Hãy điền mật khẩu của bạn !"); }
		 */
		if (account.getFullName().trim().length() == 0) {
			error.rejectValue("fullName", "account", "Hãy điền đầy đủ họ tên của bạn !");
		}
		if (account.getAddress().trim().length() == 0) {
			error.rejectValue("address", "account", "Hãy điền địa chỉ của bạn !");
		}
		if (account.getNumberPhone().trim().length() == 0) {
			error.rejectValue("numberPhone", "account", "Hãy điền địa chỉ số điện thoại của bạn !");
		}
		if (account.getAccess() == 0) {
			error.rejectValue("access", "account", "Hãy chọn quyền của tài khoản !");
		}

		if (error.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
			model.put("listAccount", accountService.getListAccount());
			return "account/edit-acc";
		} else {
			accountService.editAccount(account);
			model.put("listAccount", accountService.getListAccount());
		}
		return "redirect:/admin/account/";
	}

	// Lưu dữ liệu
	@RequestMapping(value = "save-acc.htm", method = RequestMethod.POST)
	public String saveAcc(ModelMap model, @ModelAttribute(value = "account") Account account, BindingResult error) {
		if (account.getEmail().trim().length() == 0) {
			error.rejectValue("email", "account", "Hãy điền địa chỉ email !");
		} else if (account.getEmail().indexOf(" ") > 0) {
			error.rejectValue("email", "account", "Email không được chứa khoảng trống !");
		} else if (!account.getEmail().endsWith("@gmail.com")) {
			error.rejectValue("email", "account", "Email phải có đuôi là @gmail.com");
		} else if (accountService.checkIdEmail(account.getEmail()) > 0) {
			error.rejectValue("email", "account", "Địa chỉ email này đã tồn tại !");
		}

		if (account.getPassword().trim().length() == 0) {
			error.rejectValue("password", "account", "Hãy điền mật khẩu của bạn !");
		}
		if (account.getFullName().trim().length() == 0) {
			error.rejectValue("fullName", "account", "Hãy điền đầy đủ họ tên của bạn !");
		}
		if (account.getAddress().trim().length() == 0) {
			error.rejectValue("address", "account", "Hãy điền địa chỉ của bạn !");
		}
		if (account.getNumberPhone().trim().length() == 0) {
			error.rejectValue("numberPhone", "account", "Hãy điền địa chỉ số điện thoại của bạn !");
		}
		if (account.getAccess() == 0) {
			error.rejectValue("access", "account", "Hãy chọn quyền của tài khoản !");
		}

		if (error.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
			model.put("listAccount", accountService.getListAccount());
			return "account/add-acc";
		} else {
			accountService.insertAccount(account);
			model.put("listAccount", accountService.getListAccount());
		}

		return "redirect:/admin/account/";
	}

	// reset password
	@RequestMapping(value = "reset-acc/{email}.htm", method = RequestMethod.GET)
	public String formReset(ModelMap model, @PathVariable(value = "email") String email,
			@ModelAttribute(value = "account") Account account) {
		account = accountService.getEmailAccount(email);
		account.setPassword("123");
		account.getAccess();
		account.getAddress();
		account.getFullName();
		accountService.editAccount(account);
		model.put("listAccount", accountService.getListAccount());
		return "account/index";
	}

	// form đổi mật khẩu
	@RequestMapping(value = "FormeditPass/{email}.htm", method = RequestMethod.GET)
	public String formEditPass(ModelMap model, @PathVariable(value = "email") String email) {
		model.put("account", accountService.getEmailAccount(email));
		model.put("listAccount", accountService.getListAccount());
		return "account/edit-pass";
	}

	// đổi mật khẩu
	@RequestMapping(value = "editPass/{email}.htm", method = RequestMethod.POST)
	public String editPass(ModelMap model, @PathVariable(value = "email") String email,
			@ModelAttribute(value = "account") Account account1, BindingResult error) {
		if (account1.getEmail().trim().length() == 0) {
			error.rejectValue("email", "account", "Hãy điền địa chỉ email !");
		}
		if (account1.getPassword().trim().length() == 0) {
			error.rejectValue("password", "account", "Hãy điền mật khẩu của bạn !");
		}
		Account account = accountService.getEmailAccount(email);
		account.setPassword(account1.getPassword());
		account.getEmail();
		account.getAccess();
		account.getAddress();
		account.getFullName();
		System.out.println(account.getPassword());
		accountService.editAccount(account);
		model.put("listAccount", accountService.getListAccount());

		return "account/index";
	}

	// Xóa dữ liệu
	@RequestMapping(value = "delete-acc/{email}.htm", method = RequestMethod.GET)
	public String deleteAcc(ModelMap model, @PathVariable(value = "email") String email,
			@ModelAttribute(value = "account") Account account) {
		accountService.deleteAccount(account);
		model.put("listAccount", accountService.getListAccount());
		return "redirect:/admin/account/";
	}

	// Tìm kiếm tài khoản
	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String search(ModelMap model, @RequestParam("search") String search) {
		model.addAttribute("listAccount", accountService.searchAccount(search));
		return "account/index";
	}

}
