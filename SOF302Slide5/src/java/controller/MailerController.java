package controller;


import bean.Mailer;
import java.io.File;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/mailer/")
public class MailerController {
	@Autowired
	JavaMailSender mailer;
	
	@RequestMapping("form")
	public String index() {
		return "mailer/form";
	}
	@RequestMapping("form2")
	public String index2() {
		return "mailer/form2";
	}
	@RequestMapping("send")
	public String send(ModelMap model, 
			@RequestParam("from") String from,
			@RequestParam("to") String to,
			@RequestParam("subject") String subject,
			@RequestParam("body") String body) {
		try{
			// Tạo mail
			MimeMessage mail =mailer.createMimeMessage();
			// Sử dụng lớp trợ giúp
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body, true);

			// Gửi mail
			mailer.send(mail);
			
			model.addAttribute("message", "Gửi email thành công !");
		}
		catch(Exception ex){
			model.addAttribute("message", "Gửi email thất bại !");
		}
		return "mailer/form";
	}
	
	//==========ATTACH FILE==========//
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("send2")
	public String send2(ModelMap model, 
			@RequestParam("from") String from,
			@RequestParam("to") String to,
			@RequestParam("subject") String subject,
			@RequestParam("body") String body,
			@RequestParam("attach") MultipartFile attach) {
		try{
			// Tạo mail
			MimeMessage mail =mailer.createMimeMessage();
			// Sử dụng lớp trợ giúp
			//MimeMessageHelper helper = new MimeMessageHelper(mail);
                        MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body, true);

			if(!attach.isEmpty()){
				String path = context.getRealPath("/images/"+attach.getOriginalFilename());
                                attach.transferTo(new File(path));
				helper.addAttachment(attach.getOriginalFilename(), new File(path));                       
			}
			// Gửi mail
			mailer.send(mail);			
			model.addAttribute("message", "Gửi email thành công !");
		}
		catch(Exception ex){
			model.addAttribute("message", "Gửi email thất bại !");
		}
		return "mailer/form2";
	}


}

