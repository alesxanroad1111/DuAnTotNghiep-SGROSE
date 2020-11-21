package components;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailer2")
public class Mailer2 {
	@Autowired
	JavaMailSender mailer;
	
	public void send(String to,  String subject, String body) {
		String from = "phungsts@gmail.com";
		this.send(from, to, subject, body);
	}
	
	public void send(String from, String to,  String subject, String body) {
		this.send(from, to, "", "", subject, body, "");
	}
	
	public void send(String from, String to, String cc, String bcc, 
			String subject, String body, String attachments) {
		try{
			MimeMessage mail =mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body, true);
			
			if(cc.length() > 0){
				cc = cc.trim().replace(";", ",");
				helper.setCc(cc);
			}
			if(bcc.length() > 0){
				bcc = bcc.trim().replace(";", ",");
				helper.setBcc(bcc);
			}
			if(attachments.length() > 0){
				String[] paths = attachments.split("[,; ]+");
				for(String path : paths){
					path = path.replace("/", "\\");
					String fileName = path.substring(1 + path.lastIndexOf("\\"));
					helper.addAttachment(fileName, new File(path));
				}
			}
			mailer.send(mail);
		}
		catch(Exception ex){
			throw new RuntimeException(ex);
		}
	}
}
