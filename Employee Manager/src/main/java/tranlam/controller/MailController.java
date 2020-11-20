package tranlam.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/admin/email/")
public class MailController {

	@Autowired
	JavaMailSender mailer;

	@RequestMapping(method = RequestMethod.GET)
	public String form(ModelMap model) {
		return "mail/form";
	}

	@RequestMapping(value = "send.htm", method = RequestMethod.POST)
	public String send(ModelMap model, @RequestParam("from") String from, @RequestParam("to") String to,
			@RequestParam("subject") String subject, @RequestParam("body") String body) {
		try {
			// Tạo mail
			MimeMessage mail = mailer.createMimeMessage();
			// Sử dụng lớp trợ giúp
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body, true);

			// Gửi Mail
			mailer.send(mail);
			model.addAttribute("message", "Gửi Mail thành công");
		} catch (Exception ex) {
			model.addAttribute("message", "Gửi Mail thất bại");
		}
		return "mail/form";
	}

}
