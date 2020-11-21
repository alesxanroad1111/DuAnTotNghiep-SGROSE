package controller;

import bean.Mailer;
import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.ServletContext;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/mailer2/")
public class Mailer2Controller {
	@Autowired
	Mailer mailer;
	
	@RequestMapping("form")
	public String index() {
		return "mailer/form2";
	}
    
	@Autowired
	ServletContext context;
	
	@RequestMapping("send")
	public String send2(ModelMap model, 
			@RequestParam("from") String from,
			@RequestParam("to") String to,
			@RequestParam("subject") String subject,
			@RequestParam("body") String body,
			@RequestParam("attach") MultipartFile attach) {
		try {
                    String fileName = attach.getOriginalFilename();
                    String path = context.getRealPath("/images/" + fileName);
                    attach.transferTo(new File(path));
                    mailer.send(from, to, subject, body, path, fileName);
                    model.addAttribute("message", "Gửi email thành công !");
                } catch (Exception e) {
                    model.addAttribute("message", "Gửi email thất bại !");
                }
                return "mailer/form2";
	}

}
