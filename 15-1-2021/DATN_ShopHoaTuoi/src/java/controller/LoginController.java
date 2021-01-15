/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Mailer;
import entity.Active;
import entity.Gender;
import entity.Staff;
import entity.User;
import java.io.BufferedWriter;
import java.io.File;
import java.io.OutputStreamWriter;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletContext;

import javax.servlet.http.HttpSession;
import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import validate.ValidateUser;

@Transactional
@Controller
public class LoginController {

    @Autowired
    Mailer mailer;

    @Autowired
    SessionFactory factory;

    @RequestMapping("login")
    public String login() {

        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(ModelMap model,
            @RequestParam("id") String id,
            @RequestParam("password") String password,
            HttpSession httpsession) {
        Session session = factory.getCurrentSession();
        if (isNumeric(id)) {
            try {
                String hql = "FROM Staff where phone='" + id + "'";
                Query query = session.createQuery(hql);
                Staff staff = (Staff) query.list().get(0);
                if (staff.getPassword().equals(password)) {
                    httpsession.setAttribute("staff", staff);
                    httpsession.setAttribute("idstaff", staff.getId());
                    httpsession.setAttribute("rolestaff", staff.getRole().getId());
                    System.out.println(httpsession.getAttribute("rolestaff"));
                    return "redirect:/admin/dashboardmanage";
                } else if (staff.getPassword().trim().length() == 0 || staff.getPhone().trim().length() == 0) {
                    model.addAttribute("message", "Vui lòng nhập tài khoản và mật khẩu!");
                } else {
                    model.addAttribute("message", "Sai tài khoản hoặc mật khẩu!");
                }
            } catch (Exception e) {
                System.out.println(e);
                model.addAttribute("message", "Tài khoản không tồn tại!");
            }
        } else {
            try {
                String hql = "FROM User where email='" + id + "'";
                Query query = session.createQuery(hql);
                User user = (User) query.list().get(0);
                if (user.getIsactive().getId() == 2) {
                    model.addAttribute("message", "Tài khoản của bạn đã bị khóa!");
                } else if (user.getIsactive().getId() == 3) {
                    model.addAttribute("message", "Tài khoản của bạn chưa được xác minh!");
                } else if (user.getPassword().equals(password)) {
                    httpsession.setAttribute("user", user);
                    httpsession.setAttribute("iduser", user.getId());
                    return "redirect:/home";
                } else if (user.getPassword().trim().length() == 0 || user.getEmail().trim().length() == 0) {
                    model.addAttribute("message", "Vui lòng nhập tài khoản và mật khẩu!");
                } else {
                    model.addAttribute("message", "Sai tài khoản hoặc mật khẩu!");
                }
            } catch (Exception e) {
                System.out.println(e);
                model.addAttribute("message", "Tài khoản không tồn tại!");
            }
        }

        return "login";
    }

    @RequestMapping("verify-account")
    public String verify() {

        return "verify-account";
    }

    @RequestMapping(value = "verify-account2", method = RequestMethod.POST)
    public String verify(ModelMap model, HttpSession httpsession,
            @RequestParam("code") String code) {
        String email = httpsession.getAttribute("verifyemail").toString();

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {

            String hql = "FROM User where email ='" + email + "'";
            Query query = session.createQuery(hql);
            User user = (User) query.list().get(0);
            System.out.println("Verify code: " + user.getVerifyCode());
            if (code.equals("")) {
                model.addAttribute("message", "Vui lòng nhập mã xác minh!");
            } else if (code.trim().length() < 6) {
                model.addAttribute("message", "Vui lòng nhập mã xác minh đủ 6 số!");
            } else if (user.getIsactive().getId() == 1) {
                model.addAttribute("message", "Tài khoản của bạn đã được xác minh!");
            } else if (user.getIsactive().getId() == 2) {
                model.addAttribute("message", "Tài khoản của bạn đã bị khóa! Không thể xác minh!");
            } else if (user.getVerifyCode().equals(code)) {
                try {
                    Active avt = new Active(1);
                    user.setIsactive(avt);
                    session.update(user);
                    t.commit();
                    
                    httpsession.removeAttribute("verifyemail");
                    model.addAttribute("message", "Kích hoạt thành công!");
                    return "redirect:/login";

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                model.addAttribute("message", "Mã xác minh không hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "verify-account";
    }

    //@Autowired
    //Mailer mailer;
    @RequestMapping("register")
    public String register(ModelMap model) {
        model.addAttribute("user", new User());
        model.addAttribute("users", getUsers());
        return "register";
    }

    @RequestMapping(value = "verify-account2", params = "btnResend", method = RequestMethod.POST)
    public String resendmail(ModelMap model, HttpSession httpsession) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            String code = "";
            Random random = new Random();
            for (int i = 0; i < 6; i++) {
                int r = random.nextInt(9); // randomly give a number each time (0-9)
                code = code + r; //Put together the random numbers every time
            }
            String from = "nhophuonhxa@gmail.com";
            String subject = "XÁC NHẬN TÀI KHOẢN SG-ROSE";
            String to = httpsession.getAttribute("verifyemail").toString();

            String hql = "FROM User where email ='" + to + "'";
            Query query = session.createQuery(hql);
            User user = (User) query.list().get(0);
            System.out.println("Verify code: " + user.getVerifyCode());

            String body = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><html data-editor-version=\"2\" class=\"sg-campaigns\" xmlns=\"http://www.w3.org/1999/xhtml\"><head>\n"
                    + "	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n"
                    + "	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1\">\n"
                    + "\n"
                    + "	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\">\n"
                    + "\n"
                    + "	<style type=\"text/css\">\n"
                    + "		body, p, div {\n"
                    + "			font-family: inherit;\n"
                    + "			font-size: 14px;\n"
                    + "		}\n"
                    + "		body {\n"
                    + "			color: #000000;\n"
                    + "		}\n"
                    + "		body a {\n"
                    + "			color: #1188E6;\n"
                    + "			text-decoration: none;\n"
                    + "		}\n"
                    + "		p { margin: 0; padding: 0; }\n"
                    + "		table.wrapper {\n"
                    + "			width:100% !important;\n"
                    + "			table-layout: fixed;\n"
                    + "			-webkit-font-smoothing: antialiased;\n"
                    + "			-webkit-text-size-adjust: 100%;\n"
                    + "			-moz-text-size-adjust: 100%;\n"
                    + "			-ms-text-size-adjust: 100%;\n"
                    + "		}\n"
                    + "		img.max-width {\n"
                    + "			max-width: 100% !important;\n"
                    + "		}\n"
                    + "		.column.of-2 {\n"
                    + "			width: 50%;\n"
                    + "		}\n"
                    + "		.column.of-3 {\n"
                    + "			width: 33.333%;\n"
                    + "		}\n"
                    + "		.column.of-4 {\n"
                    + "			width: 25%;\n"
                    + "		}\n"
                    + "		@media screen and (max-width:480px) {\n"
                    + "			.preheader .rightColumnContent,\n"
                    + "			.footer .rightColumnContent {\n"
                    + "				text-align: left !important;\n"
                    + "			}\n"
                    + "			.preheader .rightColumnContent div,\n"
                    + "			.preheader .rightColumnContent span,\n"
                    + "			.footer .rightColumnContent div,\n"
                    + "			.footer .rightColumnContent span {\n"
                    + "				text-align: left !important;\n"
                    + "			}\n"
                    + "			.preheader .rightColumnContent,\n"
                    + "			.preheader .leftColumnContent {\n"
                    + "				font-size: 80% !important;\n"
                    + "				padding: 5px 0;\n"
                    + "			}\n"
                    + "			table.wrapper-mobile {\n"
                    + "				width: 100% !important;\n"
                    + "				table-layout: fixed;\n"
                    + "			}\n"
                    + "			img.max-width {\n"
                    + "				height: auto !important;\n"
                    + "				max-width: 100% !important;\n"
                    + "			}\n"
                    + "			a.bulletproof-button {\n"
                    + "				display: block !important;\n"
                    + "				width: auto !important;\n"
                    + "				font-size: 80%;\n"
                    + "				padding-left: 0 !important;\n"
                    + "				padding-right: 0 !important;\n"
                    + "			}\n"
                    + "			.columns {\n"
                    + "				width: 100% !important;\n"
                    + "			}\n"
                    + "			.column {\n"
                    + "				display: block !important;\n"
                    + "				width: 100% !important;\n"
                    + "				padding-left: 0 !important;\n"
                    + "				padding-right: 0 !important;\n"
                    + "				margin-left: 0 !important;\n"
                    + "				margin-right: 0 !important;\n"
                    + "			}\n"
                    + "		}\n"
                    + "	</style>\n"
                    + "	<!--user entered Head Start--><link href=\"https://fonts.googleapis.com/css?family=Muli&display=swap\" rel=\"stylesheet\"><style>\n"
                    + "		body {font-family: 'Muli', sans-serif;}\n"
                    + "	</style><!--End Head user entered-->\n"
                    + "</head>\n"
                    + "<body>\n"
                    + "	<center class=\"wrapper\" data-link-color=\"#1188E6\" data-body-style=\"font-size:14px; font-family:inherit; color:#000000; background-color:#FFFFFF;\">\n"
                    + "		<div class=\"webkit\">\n"
                    + "			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" class=\"wrapper\" bgcolor=\"#FFFFFF\">\n"
                    + "				<tbody><tr>\n"
                    + "					<td valign=\"top\" bgcolor=\"#FFFFFF\" width=\"100%\">\n"
                    + "						<table width=\"100%\" role=\"content-container\" class=\"outer\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                    + "							<tbody><tr>\n"
                    + "								<td width=\"100%\">\n"
                    + "									<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                    + "										<tbody><tr>\n"
                    + "											<td>\n"
                    + "                            <!--[if mso]>\n"
                    + "    <center>\n"
                    + "    <table><tr><td width=\"600\">\n"
                    + "    <![endif]-->\n"
                    + "    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%; max-width:600px;\" align=\"center\">\n"
                    + "    	<tbody><tr>\n"
                    + "    		<td role=\"modules-container\" style=\"padding:0px 0px 0px 0px; color:#000000; text-align:left;\" bgcolor=\"#FFFFFF\" width=\"100%\" align=\"left\"><table class=\"module preheader preheader-hide\" role=\"module\" data-type=\"preheader\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0;\">\n"
                    + "    			<tbody><tr>\n"
                    + "    				<td role=\"module-content\">\n"
                    + "    					<p></p>\n"
                    + "    				</td>\n"
                    + "    			</tr>\n"
                    + "    		</tbody></table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"100%\" role=\"module\" data-type=\"columns\" style=\"padding:30px 20px 30px 20px;\" bgcolor=\"#f6f6f6\">\n"
                    + "    			<tbody>\n"
                    + "    				<tr role=\"module-content\">\n"
                    + "    					<td height=\"100%\" valign=\"top\">\n"
                    + "    						<table class=\"column\" width=\"540\" style=\"width:540px; border-spacing:0; border-collapse:collapse; margin:0px 10px 0px 10px;\" cellpadding=\"0\" cellspacing=\"0\" align=\"left\" border=\"0\" bgcolor=\"\">\n"
                    + "    							<tbody>\n"
                    + "    								<tr>\n"
                    + "    									<td style=\"padding:0px;margin:0px;border-spacing:0;\"><table class=\"wrapper\" role=\"module\" data-type=\"image\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"72aac1ba-9036-4a77-b9d5-9a60d9b05cba\">\n"
                    + "\n"
                    + "    									</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"331cde94-eb45-45dc-8852-b7dbeb9101d7\">\n"
                    + "    										<tbody>\n"
                    + "    											<tr>\n"
                    + "    												<td style=\"padding:0px 0px 20px 0px;\" role=\"module-content\" bgcolor=\"\">\n"
                    + "    												</td>\n"
                    + "    											</tr>\n"
                    + "    										</tbody>\n"
                    + "    									</table><table class=\"wrapper\" role=\"module\" data-type=\"image\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"d8508015-a2cb-488c-9877-d46adf313282\">\n"
                    + "    										<tbody>\n"
                    + "    											<tr>\n"
                    + "    												<td style=\"font-size:6px; line-height:10px; padding:0px 0px 0px 0px;\" valign=\"top\" align=\"center\">\n"
                    + "    													<img class=\"max-width\" border=\"0\" style=\"display:block; color:#000000; text-decoration:none; font-family:Helvetica, arial, sans-serif; font-size:16px;\" width=\"200\" height=\"80\" alt=\"\" data-proportionally-constrained=\"true\" data-responsive=\"false\" src=\"https://lh3.googleusercontent.com/DNdRvWVyuCXFR1Kry3ifLyC53jN0IlnvUgVo1KkTX9iiSaW_i_s7o2ONcd2f04sJc_yxjdmAhNZp4mTAKGXq-afopPhAWg75l65oG5HKE9sF3hh4Ko__IYlojEbwe4aBOL9ks4xHcw=w2400\" height=\"33\">\n"
                    + "    												</td>\n"
                    + "    											</tr>\n"
                    + "    										</tbody>\n"
                    + "    									</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"27716fe9-ee64-4a64-94f9-a4f28bc172a0\">\n"
                    + "    										<tbody>\n"
                    + "    											<tr>\n"
                    + "    												<td style=\"padding:0px 0px 30px 0px;\" role=\"module-content\" bgcolor=\"\">\n"
                    + "    												</td>\n"
                    + "    											</tr>\n"
                    + "    										</tbody>\n"
                    + "    									</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"948e3f3f-5214-4721-a90e-625a47b1c957\" data-mc-module-version=\"2019-10-22\">\n"
                    + "    										<tbody>\n"
                    + "    											<tr>\n"
                    + "    												<td style=\"padding:50px 30px 18px 30px; line-height:36px; text-align:inherit; background-color:#ffffff;\" height=\"100%\" valign=\"top\" bgcolor=\"#ffffff\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"font-size: 43px\">Cảm ơn đã Đăng Ký, <span style=\"color: black; font-size: 20px\">" + to + "</span>&nbsp;</span></div><div></div></div></td>\n"
                    + "    											</tr>\n"
                    + "    										</tbody>\n"
                    + "    									</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"a10dcb57-ad22-4f4d-b765-1d427dfddb4e\" data-mc-module-version=\"2019-10-22\">\n"
                    + "    										<tbody>\n"
                    + "    											<tr>\n"
                    + "    												<td style=\"padding:18px 30px 18px 30px; line-height:22px; text-align:inherit; background-color:#ffffff;\" height=\"100%\" valign=\"top\" bgcolor=\"#ffffff\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"font-size: 18px\">Vui lòng xác minh địa chỉ email của bạn để có quyền truy cập vào</span><span style=\"color: #000000; font-size: 18px; font-family: arial,helvetica,sans-serif\"> trang web SG-ROSE của chúng tôi và thỏa mãn nhu cầu mua sắm của bạn</span><span style=\"font-size: 18px\">.</span></div>\n"
                    + "    													<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffbe00; font-size: 18px\"><strong>Xin cảm ơn!&nbsp;</strong></span></div><div></div></div></td>\n"
                    + "    												</tr>\n"
                    + "    											</tbody>\n"
                    + "    										</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"7770fdab-634a-4f62-a277-1c66b2646d8d\">\n"
                    + "    											<tbody>\n"
                    + "    												<tr>\n"
                    + "    													<td style=\"padding:0px 0px 20px 0px;\" role=\"module-content\" bgcolor=\"#ffffff\">\n"
                    + "    													</td>\n"
                    + "    												</tr>\n"
                    + "    											</tbody>\n"
                    + "    										</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"d050540f-4672-4f31-80d9-b395dc08abe1\">\n"
                    + "    											<tbody>\n"
                    + "    												<tr>\n"
                    + "    													<td align=\"center\" bgcolor=\"#ffffff\" class=\"outer-td\" style=\"padding:0px 0px 0px 0px;\">\n"
                    + "    														<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                    + "    															<tbody>\n"
                    + "    																<tr>\n"
                    + "    																	<td align=\"center\" bgcolor=\"#ffbe00\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\">\n"
                    + "    																		<a style=\"background-color:#ffbe00; border:1px solid #ffbe00; border-color:#ffbe00; border-radius:0px; border-width:1px; color:#000000; display:inline-block; font-size:14px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:12px 40px 12px 40px; text-align:center; text-decoration:none; border-style:solid; font-family:inherit;\" target=\"_blank\">" + code + "</a>\n"
                    + "    																	</td>\n"
                    + "    																</tr>\n"
                    + "    															</tbody>\n"
                    + "    														</table>\n"
                    + "    													</td>\n"
                    + "    												</tr>\n"
                    + "    											</tbody>\n"
                    + "    										</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"7770fdab-634a-4f62-a277-1c66b2646d8d.1\">\n"
                    + "    											<tbody>\n"
                    + "    												<tr>\n"
                    + "    													<td style=\"padding:0px 0px 50px 0px;\" role=\"module-content\" bgcolor=\"#ffffff\">\n"
                    + "    													</td>\n"
                    + "    												</tr>\n"
                    + "    											</tbody>\n"
                    + "    										</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"a265ebb9-ab9c-43e8-9009-54d6151b1600\" data-mc-module-version=\"2019-10-22\">\n"
                    + "    											<tbody>\n"
                    + "    												<tr>\n"
                    + "    													<td style=\"padding:50px 30px 50px 30px; line-height:22px; text-align:inherit; background-color:#6e6e6e;\" height=\"100%\" valign=\"top\" bgcolor=\"#6e6e6e\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\"><strong>Tôi phải làm gì tiếp theo:</strong></span></div>\n"
                    + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                    + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">1. Sao chép Mã Xác Minh gồm 6 số ở phía trên.</span></div>\n"
                    + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                    + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">2. Quay lại Website SG-ROSE và dán Mã Xác Minh vào ô xác minh.</span></div>\n"
                    + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                    + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">3. Nhấn vào Button Xác Minh để kích hoạt tài khoản của bạn.</span></div>\n"
                    + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                    + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">Bạn cần giúp đỡ? Nhóm hỗ trợ chúng tôi luôn luôn</span></div>\n"
                    + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">sẵn sàng để giúp bạn!&nbsp;</span></div><div></div></div></td>\n"
                    + "    													</tr>\n"
                    + "    												</tbody>\n"
                    + "    											</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"d050540f-4672-4f31-80d9-b395dc08abe1.1\">\n"
                    + "    												<tbody>\n"
                    + "    													<tr>\n"
                    + "    														<td align=\"center\" bgcolor=\"#6e6e6e\" class=\"outer-td\" style=\"padding:0px 0px 0px 0px;\">\n"
                    + "    															<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                    + "    																<tbody>\n"
                    + "    																	<tr>\n"
                    + "    																		<td align=\"center\" bgcolor=\"#ffbe00\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\">\n"
                    + "    																			<a href=\"\" style=\"background-color:#ffbe00; border:1px solid #ffbe00; border-color:#ffbe00; border-radius:0px; border-width:1px; color:#000000; display:inline-block; font-size:14px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:12px 40px 12px 40px; text-align:center; text-decoration:none; border-style:solid; font-family:inherit;\" target=\"_blank\">Liên Hệ Hỗ Trợ</a>\n"
                    + "    																		</td>\n"
                    + "    																	</tr>\n"
                    + "    																</tbody>\n"
                    + "    															</table>\n"
                    + "    														</td>\n"
                    + "    													</tr>\n"
                    + "    												</tbody>\n"
                    + "    											</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"c37cc5b7-79f4-4ac8-b825-9645974c984e\">\n"
                    + "    												<tbody>\n"
                    + "    													<tr>\n"
                    + "    														<td style=\"padding:0px 0px 30px 0px;\" role=\"module-content\" bgcolor=\"6E6E6E\">\n"
                    + "    														</td>\n"
                    + "    													</tr>\n"
                    + "    												</tbody>\n"
                    + "    											</table></td>\n"
                    + "    										</tr>\n"
                    + "    									</tbody>\n"
                    + "    								</table>\n"
                    + "\n"
                    + "    							</td>\n"
                    + "    						</tr>\n"
                    + "    					</tbody>\n"
                    + "    				</table><div data-role=\"module-unsubscribe\" class=\"module\" role=\"module\" data-type=\"unsubscribe\" style=\"color:#444444; font-size:12px; line-height:20px; padding:16px 16px 16px 16px; text-align:Center;\" data-muid=\"4e838cf3-9892-4a6d-94d6-170e474d21e5\">\n"
                    + "    					<div class=\"Unsubscribe--addressLine\"><p class=\"Unsubscribe--senderName\" style=\"font-size:12px; line-height:20px;\">Được gửi từ SG-ROSE</p><p style=\"font-size:12px; line-height:20px;\"><span class=\"Unsubscribe--senderAddress\">Công viên phần mềm, Toà nhà Innovation lô 24</span>, <span class=\"Unsubscribe--senderCity\">Q. 12</span>, <span class=\"Unsubscribe--senderState\">Tp. HCM</span> <span class=\"Unsubscribe--senderZip\"></span></p></div>\n"
                    + "    					<p style=\"font-size:12px; line-height:20px;\"><a class=\"Unsubscribe--unsubscribeLink\" href=\"{{{unsubscribe}}}\" target=\"_blank\" style=\"\">© SG-Rose Inc</a> - <a href=\"{{{unsubscribe_preferences}}}\" target=\"_blank\" class=\"Unsubscribe--unsubscribePreferences\" style=\"\">2020 All rights reserved.</a></p>\n"
                    + "    				</div><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"550f60a9-c478-496c-b705-077cf7b1ba9a\">\n"
                    + "    					<tbody>\n"
                    + "    						<tr>\n"
                    + "    							<td align=\"center\" bgcolor=\"\" class=\"outer-td\" style=\"padding:0px 0px 20px 0px;\">\n"
                    + "    								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                    + "    									<tbody>\n"
                    + "    										<tr>\n"
                    + "    											<td align=\"center\" bgcolor=\"#f5f8fd\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\"><a href=\"https://sendgrid.com/\" style=\"background-color:#f5f8fd; border:1px solid #f5f8fd; border-color:#f5f8fd; border-radius:25px; border-width:1px; color:#a8b9d5; display:inline-block; font-size:10px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:5px 18px 5px 18px; text-align:center; text-decoration:none; border-style:solid; font-family:helvetica,sans-serif;\" target=\"_blank\">♥ Made with in SG-ROSE</a></td>\n"
                    + "    										</tr>\n"
                    + "    									</tbody>\n"
                    + "    								</table>\n"
                    + "    							</td>\n"
                    + "    						</tr>\n"
                    + "    					</tbody>\n"
                    + "    				</table></td>\n"
                    + "    			</tr>\n"
                    + "    		</tbody></table>\n"
                    + "                                    <!--[if mso]>\n"
                    + "                                  </td>\n"
                    + "                                </tr>\n"
                    + "                              </table>\n"
                    + "                            </center>\n"
                    + "                        <![endif]-->\n"
                    + "                    </td>\n"
                    + "                </tr>\n"
                    + "            </tbody></table>\n"
                    + "        </td>\n"
                    + "    </tr>\n"
                    + "</tbody></table>\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</tbody></table>\n"
                    + "</div>\n"
                    + "</center>\n"
                    + "\n"
                    + "\n"
                    + "</body></html>";
            String fileName = "new.png";
            String path = context.getRealPath("/images/logo/" + fileName);
            mailer.send(from, to, subject, body, path, fileName);
            /////////////////////////////////////////////////////

            user.setVerifyCode(code);
            session.update(user);
            t.commit();
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Gửi lại thất bại!");
        } finally {
            session.close();
        }
        return "verify-account";
    }
    @Autowired
    ServletContext context;

    @RequestMapping(value = "reg", method = RequestMethod.POST)
    public String reg(ModelMap model, @ModelAttribute("user") User user, @RequestParam("repassword") String repassword,
            @RequestParam("email") String to, HttpSession httpsession) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        if (!user.getEmail().matches("^[a-zA-Z][\\w-]+@([\\w]+\\.[\\w]+|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})$")) {
            model.addAttribute("message", "Sai định dạng email!");
        } else if (!vaidateReg(user.getEmail()).isEmpty()) {
            model.addAttribute("message", "Email này đã có người sử dụng!");
        } else if (!user.getPhone().matches("[0-9]{10}")) {
            model.addAttribute("message", "Số điện thoại phải nhập 10 chữ số!");
        } else if (!vaidateRegPhone(user.getPhone()).isEmpty()) {
            model.addAttribute("message", "Số điện thoại đã tồn tại!");
        } else if (user.getPassword().trim().length() < 6) {
            model.addAttribute("message", "Mật khẩu ít nhất phải là 6 chữ số!");
        } else if (!user.getPassword().equals(repassword)) {
            model.addAttribute("message", "Xác nhận mật khẩu không chính xác!");
        } else {
            try {

                String code = "";
                Random random = new Random();
                for (int i = 0; i < 6; i++) {
                    int r = random.nextInt(9); // randomly give a number each time (0-9)
                    code = code + r; //Put together the random numbers every time
                }
                String from = "nhophuonhxa@gmail.com";
                String subject = "XÁC NHẬN TÀI KHOẢN SG-ROSE";

                String body = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><html data-editor-version=\"2\" class=\"sg-campaigns\" xmlns=\"http://www.w3.org/1999/xhtml\"><head>\n"
                        + "	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n"
                        + "	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1\">\n"
                        + "\n"
                        + "	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\">\n"
                        + "\n"
                        + "	<style type=\"text/css\">\n"
                        + "		body, p, div {\n"
                        + "			font-family: inherit;\n"
                        + "			font-size: 14px;\n"
                        + "		}\n"
                        + "		body {\n"
                        + "			color: #000000;\n"
                        + "		}\n"
                        + "		body a {\n"
                        + "			color: #1188E6;\n"
                        + "			text-decoration: none;\n"
                        + "		}\n"
                        + "		p { margin: 0; padding: 0; }\n"
                        + "		table.wrapper {\n"
                        + "			width:100% !important;\n"
                        + "			table-layout: fixed;\n"
                        + "			-webkit-font-smoothing: antialiased;\n"
                        + "			-webkit-text-size-adjust: 100%;\n"
                        + "			-moz-text-size-adjust: 100%;\n"
                        + "			-ms-text-size-adjust: 100%;\n"
                        + "		}\n"
                        + "		img.max-width {\n"
                        + "			max-width: 100% !important;\n"
                        + "		}\n"
                        + "		.column.of-2 {\n"
                        + "			width: 50%;\n"
                        + "		}\n"
                        + "		.column.of-3 {\n"
                        + "			width: 33.333%;\n"
                        + "		}\n"
                        + "		.column.of-4 {\n"
                        + "			width: 25%;\n"
                        + "		}\n"
                        + "		@media screen and (max-width:480px) {\n"
                        + "			.preheader .rightColumnContent,\n"
                        + "			.footer .rightColumnContent {\n"
                        + "				text-align: left !important;\n"
                        + "			}\n"
                        + "			.preheader .rightColumnContent div,\n"
                        + "			.preheader .rightColumnContent span,\n"
                        + "			.footer .rightColumnContent div,\n"
                        + "			.footer .rightColumnContent span {\n"
                        + "				text-align: left !important;\n"
                        + "			}\n"
                        + "			.preheader .rightColumnContent,\n"
                        + "			.preheader .leftColumnContent {\n"
                        + "				font-size: 80% !important;\n"
                        + "				padding: 5px 0;\n"
                        + "			}\n"
                        + "			table.wrapper-mobile {\n"
                        + "				width: 100% !important;\n"
                        + "				table-layout: fixed;\n"
                        + "			}\n"
                        + "			img.max-width {\n"
                        + "				height: auto !important;\n"
                        + "				max-width: 100% !important;\n"
                        + "			}\n"
                        + "			a.bulletproof-button {\n"
                        + "				display: block !important;\n"
                        + "				width: auto !important;\n"
                        + "				font-size: 80%;\n"
                        + "				padding-left: 0 !important;\n"
                        + "				padding-right: 0 !important;\n"
                        + "			}\n"
                        + "			.columns {\n"
                        + "				width: 100% !important;\n"
                        + "			}\n"
                        + "			.column {\n"
                        + "				display: block !important;\n"
                        + "				width: 100% !important;\n"
                        + "				padding-left: 0 !important;\n"
                        + "				padding-right: 0 !important;\n"
                        + "				margin-left: 0 !important;\n"
                        + "				margin-right: 0 !important;\n"
                        + "			}\n"
                        + "		}\n"
                        + "	</style>\n"
                        + "	<!--user entered Head Start--><link href=\"https://fonts.googleapis.com/css?family=Muli&display=swap\" rel=\"stylesheet\"><style>\n"
                        + "		body {font-family: 'Muli', sans-serif;}\n"
                        + "	</style><!--End Head user entered-->\n"
                        + "</head>\n"
                        + "<body>\n"
                        + "	<center class=\"wrapper\" data-link-color=\"#1188E6\" data-body-style=\"font-size:14px; font-family:inherit; color:#000000; background-color:#FFFFFF;\">\n"
                        + "		<div class=\"webkit\">\n"
                        + "			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" class=\"wrapper\" bgcolor=\"#FFFFFF\">\n"
                        + "				<tbody><tr>\n"
                        + "					<td valign=\"top\" bgcolor=\"#FFFFFF\" width=\"100%\">\n"
                        + "						<table width=\"100%\" role=\"content-container\" class=\"outer\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                        + "							<tbody><tr>\n"
                        + "								<td width=\"100%\">\n"
                        + "									<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                        + "										<tbody><tr>\n"
                        + "											<td>\n"
                        + "                            <!--[if mso]>\n"
                        + "    <center>\n"
                        + "    <table><tr><td width=\"600\">\n"
                        + "    <![endif]-->\n"
                        + "    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%; max-width:600px;\" align=\"center\">\n"
                        + "    	<tbody><tr>\n"
                        + "    		<td role=\"modules-container\" style=\"padding:0px 0px 0px 0px; color:#000000; text-align:left;\" bgcolor=\"#FFFFFF\" width=\"100%\" align=\"left\"><table class=\"module preheader preheader-hide\" role=\"module\" data-type=\"preheader\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0;\">\n"
                        + "    			<tbody><tr>\n"
                        + "    				<td role=\"module-content\">\n"
                        + "    					<p></p>\n"
                        + "    				</td>\n"
                        + "    			</tr>\n"
                        + "    		</tbody></table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"100%\" role=\"module\" data-type=\"columns\" style=\"padding:30px 20px 30px 20px;\" bgcolor=\"#f6f6f6\">\n"
                        + "    			<tbody>\n"
                        + "    				<tr role=\"module-content\">\n"
                        + "    					<td height=\"100%\" valign=\"top\">\n"
                        + "    						<table class=\"column\" width=\"540\" style=\"width:540px; border-spacing:0; border-collapse:collapse; margin:0px 10px 0px 10px;\" cellpadding=\"0\" cellspacing=\"0\" align=\"left\" border=\"0\" bgcolor=\"\">\n"
                        + "    							<tbody>\n"
                        + "    								<tr>\n"
                        + "    									<td style=\"padding:0px;margin:0px;border-spacing:0;\"><table class=\"wrapper\" role=\"module\" data-type=\"image\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"72aac1ba-9036-4a77-b9d5-9a60d9b05cba\">\n"
                        + "\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"331cde94-eb45-45dc-8852-b7dbeb9101d7\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:0px 0px 20px 0px;\" role=\"module-content\" bgcolor=\"\">\n"
                        + "    												</td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"wrapper\" role=\"module\" data-type=\"image\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"d8508015-a2cb-488c-9877-d46adf313282\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"font-size:6px; line-height:10px; padding:0px 0px 0px 0px;\" valign=\"top\" align=\"center\">\n"
                        + "    													<img class=\"max-width\" border=\"0\" style=\"display:block; color:#000000; text-decoration:none; font-family:Helvetica, arial, sans-serif; font-size:16px;\" width=\"200\" height=\"80\" alt=\"\" data-proportionally-constrained=\"true\" data-responsive=\"false\" src=\"https://lh3.googleusercontent.com/DNdRvWVyuCXFR1Kry3ifLyC53jN0IlnvUgVo1KkTX9iiSaW_i_s7o2ONcd2f04sJc_yxjdmAhNZp4mTAKGXq-afopPhAWg75l65oG5HKE9sF3hh4Ko__IYlojEbwe4aBOL9ks4xHcw=w2400\" height=\"33\">\n"
                        + "    												</td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"27716fe9-ee64-4a64-94f9-a4f28bc172a0\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:0px 0px 30px 0px;\" role=\"module-content\" bgcolor=\"\">\n"
                        + "    												</td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"948e3f3f-5214-4721-a90e-625a47b1c957\" data-mc-module-version=\"2019-10-22\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:50px 30px 18px 30px; line-height:36px; text-align:inherit; background-color:#ffffff;\" height=\"100%\" valign=\"top\" bgcolor=\"#ffffff\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"font-size: 43px\">Cảm ơn đã Đăng Ký, <span style=\"color: black; font-size: 20px\">" + to + "</span>&nbsp;</span></div><div></div></div></td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"a10dcb57-ad22-4f4d-b765-1d427dfddb4e\" data-mc-module-version=\"2019-10-22\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:18px 30px 18px 30px; line-height:22px; text-align:inherit; background-color:#ffffff;\" height=\"100%\" valign=\"top\" bgcolor=\"#ffffff\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"font-size: 18px\">Vui lòng xác minh địa chỉ email của bạn để có quyền truy cập vào</span><span style=\"color: #000000; font-size: 18px; font-family: arial,helvetica,sans-serif\"> trang web SG-ROSE của chúng tôi và thỏa mãn nhu cầu mua sắm của bạn</span><span style=\"font-size: 18px\">.</span></div>\n"
                        + "    													<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffbe00; font-size: 18px\"><strong>Xin cảm ơn!&nbsp;</strong></span></div><div></div></div></td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"7770fdab-634a-4f62-a277-1c66b2646d8d\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td style=\"padding:0px 0px 20px 0px;\" role=\"module-content\" bgcolor=\"#ffffff\">\n"
                        + "    													</td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"d050540f-4672-4f31-80d9-b395dc08abe1\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td align=\"center\" bgcolor=\"#ffffff\" class=\"outer-td\" style=\"padding:0px 0px 0px 0px;\">\n"
                        + "    														<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                        + "    															<tbody>\n"
                        + "    																<tr>\n"
                        + "    																	<td align=\"center\" bgcolor=\"#ffbe00\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\">\n"
                        + "    																		<a style=\"background-color:#ffbe00; border:1px solid #ffbe00; border-color:#ffbe00; border-radius:0px; border-width:1px; color:#000000; display:inline-block; font-size:14px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:12px 40px 12px 40px; text-align:center; text-decoration:none; border-style:solid; font-family:inherit;\" target=\"_blank\">" + code + "</a>\n"
                        + "    																	</td>\n"
                        + "    																</tr>\n"
                        + "    															</tbody>\n"
                        + "    														</table>\n"
                        + "    													</td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"7770fdab-634a-4f62-a277-1c66b2646d8d.1\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td style=\"padding:0px 0px 50px 0px;\" role=\"module-content\" bgcolor=\"#ffffff\">\n"
                        + "    													</td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"a265ebb9-ab9c-43e8-9009-54d6151b1600\" data-mc-module-version=\"2019-10-22\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td style=\"padding:50px 30px 50px 30px; line-height:22px; text-align:inherit; background-color:#6e6e6e;\" height=\"100%\" valign=\"top\" bgcolor=\"#6e6e6e\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\"><strong>Tôi phải làm gì tiếp theo:</strong></span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">1. Sao chép Mã Xác Minh gồm 6 số ở phía trên.</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">2. Quay lại Website SG-ROSE và dán Mã Xác Minh vào ô xác minh.</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">3. Nhấn vào Button Xác Minh để kích hoạt tài khoản của bạn.</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">Bạn cần giúp đỡ? Nhóm hỗ trợ chúng tôi luôn luôn</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">sẵn sàng để giúp bạn!&nbsp;</span></div><div></div></div></td>\n"
                        + "    													</tr>\n"
                        + "    												</tbody>\n"
                        + "    											</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"d050540f-4672-4f31-80d9-b395dc08abe1.1\">\n"
                        + "    												<tbody>\n"
                        + "    													<tr>\n"
                        + "    														<td align=\"center\" bgcolor=\"#6e6e6e\" class=\"outer-td\" style=\"padding:0px 0px 0px 0px;\">\n"
                        + "    															<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                        + "    																<tbody>\n"
                        + "    																	<tr>\n"
                        + "    																		<td align=\"center\" bgcolor=\"#ffbe00\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\">\n"
                        + "    																			<a href=\"\" style=\"background-color:#ffbe00; border:1px solid #ffbe00; border-color:#ffbe00; border-radius:0px; border-width:1px; color:#000000; display:inline-block; font-size:14px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:12px 40px 12px 40px; text-align:center; text-decoration:none; border-style:solid; font-family:inherit;\" target=\"_blank\">Liên Hệ Hỗ Trợ</a>\n"
                        + "    																		</td>\n"
                        + "    																	</tr>\n"
                        + "    																</tbody>\n"
                        + "    															</table>\n"
                        + "    														</td>\n"
                        + "    													</tr>\n"
                        + "    												</tbody>\n"
                        + "    											</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"c37cc5b7-79f4-4ac8-b825-9645974c984e\">\n"
                        + "    												<tbody>\n"
                        + "    													<tr>\n"
                        + "    														<td style=\"padding:0px 0px 30px 0px;\" role=\"module-content\" bgcolor=\"6E6E6E\">\n"
                        + "    														</td>\n"
                        + "    													</tr>\n"
                        + "    												</tbody>\n"
                        + "    											</table></td>\n"
                        + "    										</tr>\n"
                        + "    									</tbody>\n"
                        + "    								</table>\n"
                        + "\n"
                        + "    							</td>\n"
                        + "    						</tr>\n"
                        + "    					</tbody>\n"
                        + "    				</table><div data-role=\"module-unsubscribe\" class=\"module\" role=\"module\" data-type=\"unsubscribe\" style=\"color:#444444; font-size:12px; line-height:20px; padding:16px 16px 16px 16px; text-align:Center;\" data-muid=\"4e838cf3-9892-4a6d-94d6-170e474d21e5\">\n"
                        + "    					<div class=\"Unsubscribe--addressLine\"><p class=\"Unsubscribe--senderName\" style=\"font-size:12px; line-height:20px;\">Được gửi từ SG-ROSE</p><p style=\"font-size:12px; line-height:20px;\"><span class=\"Unsubscribe--senderAddress\">Công viên phần mềm, Toà nhà Innovation lô 24</span>, <span class=\"Unsubscribe--senderCity\">Q. 12</span>, <span class=\"Unsubscribe--senderState\">Tp. HCM</span> <span class=\"Unsubscribe--senderZip\"></span></p></div>\n"
                        + "    					<p style=\"font-size:12px; line-height:20px;\"><a class=\"Unsubscribe--unsubscribeLink\" href=\"{{{unsubscribe}}}\" target=\"_blank\" style=\"\">© SG-Rose Inc</a> - <a href=\"{{{unsubscribe_preferences}}}\" target=\"_blank\" class=\"Unsubscribe--unsubscribePreferences\" style=\"\">2020 All rights reserved.</a></p>\n"
                        + "    				</div><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"550f60a9-c478-496c-b705-077cf7b1ba9a\">\n"
                        + "    					<tbody>\n"
                        + "    						<tr>\n"
                        + "    							<td align=\"center\" bgcolor=\"\" class=\"outer-td\" style=\"padding:0px 0px 20px 0px;\">\n"
                        + "    								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                        + "    									<tbody>\n"
                        + "    										<tr>\n"
                        + "    											<td align=\"center\" bgcolor=\"#f5f8fd\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\"><a href=\"https://sendgrid.com/\" style=\"background-color:#f5f8fd; border:1px solid #f5f8fd; border-color:#f5f8fd; border-radius:25px; border-width:1px; color:#a8b9d5; display:inline-block; font-size:10px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:5px 18px 5px 18px; text-align:center; text-decoration:none; border-style:solid; font-family:helvetica,sans-serif;\" target=\"_blank\">♥ Made with in SG-ROSE</a></td>\n"
                        + "    										</tr>\n"
                        + "    									</tbody>\n"
                        + "    								</table>\n"
                        + "    							</td>\n"
                        + "    						</tr>\n"
                        + "    					</tbody>\n"
                        + "    				</table></td>\n"
                        + "    			</tr>\n"
                        + "    		</tbody></table>\n"
                        + "                                    <!--[if mso]>\n"
                        + "                                  </td>\n"
                        + "                                </tr>\n"
                        + "                              </table>\n"
                        + "                            </center>\n"
                        + "                        <![endif]-->\n"
                        + "                    </td>\n"
                        + "                </tr>\n"
                        + "            </tbody></table>\n"
                        + "        </td>\n"
                        + "    </tr>\n"
                        + "</tbody></table>\n"
                        + "</td>\n"
                        + "</tr>\n"
                        + "</tbody></table>\n"
                        + "</div>\n"
                        + "</center>\n"
                        + "\n"
                        + "\n"
                        + "</body></html>";
                String fileName = "new.png";
                String path = context.getRealPath("/images/logo/" + fileName);
                mailer.send(from, to, subject, body, path, fileName);
                /////////////////////////////////////////////////////
                Active avt = new Active(3);
                Gender gd = new Gender(1);
                user.setName("Bạn");
                user.setAvatar("user-image.jpg");
                user.setGender(gd);
                user.setIsactive(avt);
                user.setVerifyCode(code);
                session.save(user);
                t.commit();

                httpsession.setAttribute("verifyemail", to);
                httpsession.setAttribute("idverify", user.getId());
                System.out.println("idverify: " + user.getId());
                return "redirect:/verify-account";
            } catch (Exception e) {
                t.rollback();
                e.printStackTrace();
                model.addAttribute("message", "Đăng ký thất bại!");
            } finally {
                session.close();
            }
        }
        return "register";
    }

    
     @RequestMapping("forgotpassword")
    public String forgotpassword() {

        return "forgotpassword";
    }
    
    @RequestMapping("confirm-codeforgot")
    public String confirmCodeforgot(){
        
        return "confirm-codeforgot";
    }
    
    @RequestMapping("makenewpassword")
    public String forgotpasswordChange() {

        return "makenewpassword";
    }

    @RequestMapping("change-password-complete")
    public String forgotpasswordChange(ModelMap model, HttpSession httpsession,
            @RequestParam("password") String password,
            @RequestParam("confirm-password") String confirmPassword) {
        String email = httpsession.getAttribute("emailforgotpass").toString();

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {

            String hql = "FROM User where email ='" + email + "'";
            Query query = session.createQuery(hql);
            User user = (User) query.list().get(0);

            if (password.equals("") || confirmPassword.equals("")) {
                model.addAttribute("message", "Vui lòng nhập mật khẩu!");
            } else if (password.trim().length() < 6 || confirmPassword.trim().length() < 6) {
                model.addAttribute("message", "Mật khẩu phải trên 6 số!");
            } else if (confirmPassword.equals(password)) {
                try {
                    user.setPassword(password);
                    session.update(user);
                    t.commit();
                    model.addAttribute("message", "Đổi mật khẩu thành công!");
                    httpsession.removeAttribute("emailforgotpass");
                    return "redirect:/login";

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                model.addAttribute("message", "Xác nhận mật khẩu không trùng khớp!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "makenewpassword";
    }

   

    @RequestMapping("confirmed-codeforgot")
    public String confirmCodeforgot(ModelMap model, HttpSession httpsession,
            @RequestParam("code") String code) {
        String email = httpsession.getAttribute("emailforgotpass").toString();

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {

            String hql = "FROM User where email ='" + email + "'";
            Query query = session.createQuery(hql);
            User user = (User) query.list().get(0);
            
            if (code.equals("")) {
                model.addAttribute("message", "Vui lòng nhập mã xác nhận!");
            } else if (code.trim().length() < 6) {
                model.addAttribute("message", "Vui lòng nhập mã xác nhận đủ 6 số!");
            } else if (user.getForgotCode().equals(code)) {
                model.addAttribute("message", "Xác nhận thành công!");
                return "redirect:/makenewpassword";
            } else {
                model.addAttribute("message", "Mã xác nhận không hợp lệ!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "confirm-codeforgot";
    }

    @RequestMapping(value = "confirmed-codeforgot",params = "btnResend", method = RequestMethod.POST)
    public String confirmCodeforgot(ModelMap model, HttpSession httpsession) {
        String to = httpsession.getAttribute("emailforgotpass").toString();
        
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            String code = "";
            Random random = new Random();
            for (int i = 0; i < 6; i++) {
                int r = random.nextInt(9); // randomly give a number each time (0-9)
                code = code + r; //Put together the random numbers every time
            }
            String from = "nhophuonhxa@gmail.com";
            String subject = "YÊU CẦU LẤY LẠI MẬT KHẨU SG-ROSE";

            String hql = "FROM User where email ='" + to + "'";
            Query query = session.createQuery(hql);
            if (!query.list().isEmpty()) {
                User user = (User) query.list().get(0);

                String body = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><html data-editor-version=\"2\" class=\"sg-campaigns\" xmlns=\"http://www.w3.org/1999/xhtml\"><head>\n"
                        + "	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n"
                        + "	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1\">\n"
                        + "\n"
                        + "	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\">\n"
                        + "\n"
                        + "	<style type=\"text/css\">\n"
                        + "		body, p, div {\n"
                        + "			font-family: inherit;\n"
                        + "			font-size: 14px;\n"
                        + "		}\n"
                        + "		body {\n"
                        + "			color: #000000;\n"
                        + "		}\n"
                        + "		body a {\n"
                        + "			color: #1188E6;\n"
                        + "			text-decoration: none;\n"
                        + "		}\n"
                        + "		p { margin: 0; padding: 0; }\n"
                        + "		table.wrapper {\n"
                        + "			width:100% !important;\n"
                        + "			table-layout: fixed;\n"
                        + "			-webkit-font-smoothing: antialiased;\n"
                        + "			-webkit-text-size-adjust: 100%;\n"
                        + "			-moz-text-size-adjust: 100%;\n"
                        + "			-ms-text-size-adjust: 100%;\n"
                        + "		}\n"
                        + "		img.max-width {\n"
                        + "			max-width: 100% !important;\n"
                        + "		}\n"
                        + "		.column.of-2 {\n"
                        + "			width: 50%;\n"
                        + "		}\n"
                        + "		.column.of-3 {\n"
                        + "			width: 33.333%;\n"
                        + "		}\n"
                        + "		.column.of-4 {\n"
                        + "			width: 25%;\n"
                        + "		}\n"
                        + "		@media screen and (max-width:480px) {\n"
                        + "			.preheader .rightColumnContent,\n"
                        + "			.footer .rightColumnContent {\n"
                        + "				text-align: left !important;\n"
                        + "			}\n"
                        + "			.preheader .rightColumnContent div,\n"
                        + "			.preheader .rightColumnContent span,\n"
                        + "			.footer .rightColumnContent div,\n"
                        + "			.footer .rightColumnContent span {\n"
                        + "				text-align: left !important;\n"
                        + "			}\n"
                        + "			.preheader .rightColumnContent,\n"
                        + "			.preheader .leftColumnContent {\n"
                        + "				font-size: 80% !important;\n"
                        + "				padding: 5px 0;\n"
                        + "			}\n"
                        + "			table.wrapper-mobile {\n"
                        + "				width: 100% !important;\n"
                        + "				table-layout: fixed;\n"
                        + "			}\n"
                        + "			img.max-width {\n"
                        + "				height: auto !important;\n"
                        + "				max-width: 100% !important;\n"
                        + "			}\n"
                        + "			a.bulletproof-button {\n"
                        + "				display: block !important;\n"
                        + "				width: auto !important;\n"
                        + "				font-size: 80%;\n"
                        + "				padding-left: 0 !important;\n"
                        + "				padding-right: 0 !important;\n"
                        + "			}\n"
                        + "			.columns {\n"
                        + "				width: 100% !important;\n"
                        + "			}\n"
                        + "			.column {\n"
                        + "				display: block !important;\n"
                        + "				width: 100% !important;\n"
                        + "				padding-left: 0 !important;\n"
                        + "				padding-right: 0 !important;\n"
                        + "				margin-left: 0 !important;\n"
                        + "				margin-right: 0 !important;\n"
                        + "			}\n"
                        + "		}\n"
                        + "	</style>\n"
                        + "	<!--user entered Head Start--><link href=\"https://fonts.googleapis.com/css?family=Muli&display=swap\" rel=\"stylesheet\"><style>\n"
                        + "		body {font-family: 'Muli', sans-serif;}\n"
                        + "	</style><!--End Head user entered-->\n"
                        + "</head>\n"
                        + "<body>\n"
                        + "	<center class=\"wrapper\" data-link-color=\"#1188E6\" data-body-style=\"font-size:14px; font-family:inherit; color:#000000; background-color:#FFFFFF;\">\n"
                        + "		<div class=\"webkit\">\n"
                        + "			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" class=\"wrapper\" bgcolor=\"#FFFFFF\">\n"
                        + "				<tbody><tr>\n"
                        + "					<td valign=\"top\" bgcolor=\"#FFFFFF\" width=\"100%\">\n"
                        + "						<table width=\"100%\" role=\"content-container\" class=\"outer\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                        + "							<tbody><tr>\n"
                        + "								<td width=\"100%\">\n"
                        + "									<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                        + "										<tbody><tr>\n"
                        + "											<td>\n"
                        + "                            <!--[if mso]>\n"
                        + "    <center>\n"
                        + "    <table><tr><td width=\"600\">\n"
                        + "    <![endif]-->\n"
                        + "    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%; max-width:600px;\" align=\"center\">\n"
                        + "    	<tbody><tr>\n"
                        + "    		<td role=\"modules-container\" style=\"padding:0px 0px 0px 0px; color:#000000; text-align:left;\" bgcolor=\"#FFFFFF\" width=\"100%\" align=\"left\"><table class=\"module preheader preheader-hide\" role=\"module\" data-type=\"preheader\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0;\">\n"
                        + "    			<tbody><tr>\n"
                        + "    				<td role=\"module-content\">\n"
                        + "    					<p></p>\n"
                        + "    				</td>\n"
                        + "    			</tr>\n"
                        + "    		</tbody></table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"100%\" role=\"module\" data-type=\"columns\" style=\"padding:30px 20px 30px 20px;\" bgcolor=\"#f6f6f6\">\n"
                        + "    			<tbody>\n"
                        + "    				<tr role=\"module-content\">\n"
                        + "    					<td height=\"100%\" valign=\"top\">\n"
                        + "    						<table class=\"column\" width=\"540\" style=\"width:540px; border-spacing:0; border-collapse:collapse; margin:0px 10px 0px 10px;\" cellpadding=\"0\" cellspacing=\"0\" align=\"left\" border=\"0\" bgcolor=\"\">\n"
                        + "    							<tbody>\n"
                        + "    								<tr>\n"
                        + "    									<td style=\"padding:0px;margin:0px;border-spacing:0;\"><table class=\"wrapper\" role=\"module\" data-type=\"image\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"72aac1ba-9036-4a77-b9d5-9a60d9b05cba\">\n"
                        + "\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"331cde94-eb45-45dc-8852-b7dbeb9101d7\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:0px 0px 20px 0px;\" role=\"module-content\" bgcolor=\"\">\n"
                        + "    												</td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"wrapper\" role=\"module\" data-type=\"image\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"d8508015-a2cb-488c-9877-d46adf313282\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"font-size:6px; line-height:10px; padding:0px 0px 0px 0px;\" valign=\"top\" align=\"center\">\n"
                        + "    													<img class=\"max-width\" border=\"0\" style=\"display:block; color:#000000; text-decoration:none; font-family:Helvetica, arial, sans-serif; font-size:16px;\" width=\"200\" height=\"80\" alt=\"\" data-proportionally-constrained=\"true\" data-responsive=\"false\" src=\"https://lh3.googleusercontent.com/DNdRvWVyuCXFR1Kry3ifLyC53jN0IlnvUgVo1KkTX9iiSaW_i_s7o2ONcd2f04sJc_yxjdmAhNZp4mTAKGXq-afopPhAWg75l65oG5HKE9sF3hh4Ko__IYlojEbwe4aBOL9ks4xHcw=w2400\" height=\"33\">\n"
                        + "    												</td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"27716fe9-ee64-4a64-94f9-a4f28bc172a0\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:0px 0px 30px 0px;\" role=\"module-content\" bgcolor=\"\">\n"
                        + "    												</td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"948e3f3f-5214-4721-a90e-625a47b1c957\" data-mc-module-version=\"2019-10-22\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:50px 30px 18px 30px; line-height:36px; text-align:inherit; background-color:#ffffff;\" height=\"100%\" valign=\"top\" bgcolor=\"#ffffff\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"font-size: 43px\">Yêu cầu lấy lại mật khẩu của bạn &nbsp;</span></div><div></div></div></td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"a10dcb57-ad22-4f4d-b765-1d427dfddb4e\" data-mc-module-version=\"2019-10-22\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:18px 30px 18px 30px; line-height:22px; text-align:inherit; background-color:#ffffff;\" height=\"100%\" valign=\"top\" bgcolor=\"#ffffff\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"font-size: 18px\">Bạn vừa yêu cầu thay đổi mật khẩu của mình</span><span style=\"color: #000000; font-size: 18px; font-family: arial,helvetica,sans-serif\"> hãy sử dụng Code dưới đây để hoàn tất yêu cầu thay đổi mật khẩu của bạn</span><span style=\"font-size: 18px\">.</span></div>\n"
                        + "    													<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffbe00; font-size: 18px\"><strong>Xin cảm ơn!&nbsp;</strong></span></div><div></div></div></td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"7770fdab-634a-4f62-a277-1c66b2646d8d\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td style=\"padding:0px 0px 20px 0px;\" role=\"module-content\" bgcolor=\"#ffffff\">\n"
                        + "    													</td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"d050540f-4672-4f31-80d9-b395dc08abe1\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td align=\"center\" bgcolor=\"#ffffff\" class=\"outer-td\" style=\"padding:0px 0px 0px 0px;\">\n"
                        + "    														<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                        + "    															<tbody>\n"
                        + "    																<tr>\n"
                        + "    																	<td align=\"center\" bgcolor=\"#ffbe00\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\">\n"
                        + "    																		<a style=\"background-color:#ffbe00; border:1px solid #ffbe00; border-color:#ffbe00; border-radius:0px; border-width:1px; color:#000000; display:inline-block; font-size:14px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:12px 40px 12px 40px; text-align:center; text-decoration:none; border-style:solid; font-family:inherit;\" target=\"_blank\">" + code + "</a>\n"
                        + "    																	</td>\n"
                        + "    																</tr>\n"
                        + "    															</tbody>\n"
                        + "    														</table>\n"
                        + "    													</td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"7770fdab-634a-4f62-a277-1c66b2646d8d.1\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td style=\"padding:0px 0px 50px 0px;\" role=\"module-content\" bgcolor=\"#ffffff\">\n"
                        + "    													</td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"a265ebb9-ab9c-43e8-9009-54d6151b1600\" data-mc-module-version=\"2019-10-22\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td style=\"padding:50px 30px 50px 30px; line-height:22px; text-align:inherit; background-color:#6e6e6e;\" height=\"100%\" valign=\"top\" bgcolor=\"#6e6e6e\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\"><strong>Tôi phải làm gì tiếp theo:</strong></span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">1. Sao chép mã xác nhận gồm 6 số ở phía trên.</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">2. Quay lại Website SG-ROSE và dán mã xác nhận vào ô xác nhận.</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">3. Nhấn vào Button xác nhận để kích hoạt tài khoản của bạn.</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">Bạn cần giúp đỡ? Nhóm hỗ trợ chúng tôi luôn luôn</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">sẵn sàng để giúp bạn!&nbsp;</span></div><div></div></div></td>\n"
                        + "    													</tr>\n"
                        + "    												</tbody>\n"
                        + "    											</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"d050540f-4672-4f31-80d9-b395dc08abe1.1\">\n"
                        + "    												<tbody>\n"
                        + "    													<tr>\n"
                        + "    														<td align=\"center\" bgcolor=\"#6e6e6e\" class=\"outer-td\" style=\"padding:0px 0px 0px 0px;\">\n"
                        + "    															<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                        + "    																<tbody>\n"
                        + "    																	<tr>\n"
                        + "    																		<td align=\"center\" bgcolor=\"#ffbe00\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\">\n"
                        + "    																			<a href=\"\" style=\"background-color:#ffbe00; border:1px solid #ffbe00; border-color:#ffbe00; border-radius:0px; border-width:1px; color:#000000; display:inline-block; font-size:14px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:12px 40px 12px 40px; text-align:center; text-decoration:none; border-style:solid; font-family:inherit;\" target=\"_blank\">Liên Hệ Hỗ Trợ</a>\n"
                        + "    																		</td>\n"
                        + "    																	</tr>\n"
                        + "    																</tbody>\n"
                        + "    															</table>\n"
                        + "    														</td>\n"
                        + "    													</tr>\n"
                        + "    												</tbody>\n"
                        + "    											</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"c37cc5b7-79f4-4ac8-b825-9645974c984e\">\n"
                        + "    												<tbody>\n"
                        + "    													<tr>\n"
                        + "    														<td style=\"padding:0px 0px 30px 0px;\" role=\"module-content\" bgcolor=\"6E6E6E\">\n"
                        + "    														</td>\n"
                        + "    													</tr>\n"
                        + "    												</tbody>\n"
                        + "    											</table></td>\n"
                        + "    										</tr>\n"
                        + "    									</tbody>\n"
                        + "    								</table>\n"
                        + "\n"
                        + "    							</td>\n"
                        + "    						</tr>\n"
                        + "    					</tbody>\n"
                        + "    				</table><div data-role=\"module-unsubscribe\" class=\"module\" role=\"module\" data-type=\"unsubscribe\" style=\"color:#444444; font-size:12px; line-height:20px; padding:16px 16px 16px 16px; text-align:Center;\" data-muid=\"4e838cf3-9892-4a6d-94d6-170e474d21e5\">\n"
                        + "    					<div class=\"Unsubscribe--addressLine\"><p class=\"Unsubscribe--senderName\" style=\"font-size:12px; line-height:20px;\">Được gửi từ SG-ROSE</p><p style=\"font-size:12px; line-height:20px;\"><span class=\"Unsubscribe--senderAddress\">Công viên phần mềm, Toà nhà Innovation lô 24</span>, <span class=\"Unsubscribe--senderCity\">Q. 12</span>, <span class=\"Unsubscribe--senderState\">Tp. HCM</span> <span class=\"Unsubscribe--senderZip\"></span></p></div>\n"
                        + "    					<p style=\"font-size:12px; line-height:20px;\"><a class=\"Unsubscribe--unsubscribeLink\" href=\"{{{unsubscribe}}}\" target=\"_blank\" style=\"\">© SG-Rose Inc</a> - <a href=\"{{{unsubscribe_preferences}}}\" target=\"_blank\" class=\"Unsubscribe--unsubscribePreferences\" style=\"\">2020 All rights reserved.</a></p>\n"
                        + "    				</div><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"550f60a9-c478-496c-b705-077cf7b1ba9a\">\n"
                        + "    					<tbody>\n"
                        + "    						<tr>\n"
                        + "    							<td align=\"center\" bgcolor=\"\" class=\"outer-td\" style=\"padding:0px 0px 20px 0px;\">\n"
                        + "    								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                        + "    									<tbody>\n"
                        + "    										<tr>\n"
                        + "    											<td align=\"center\" bgcolor=\"#f5f8fd\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\"><a href=\"https://sendgrid.com/\" style=\"background-color:#f5f8fd; border:1px solid #f5f8fd; border-color:#f5f8fd; border-radius:25px; border-width:1px; color:#a8b9d5; display:inline-block; font-size:10px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:5px 18px 5px 18px; text-align:center; text-decoration:none; border-style:solid; font-family:helvetica,sans-serif;\" target=\"_blank\">♥ Made with in SG-ROSE</a></td>\n"
                        + "    										</tr>\n"
                        + "    									</tbody>\n"
                        + "    								</table>\n"
                        + "    							</td>\n"
                        + "    						</tr>\n"
                        + "    					</tbody>\n"
                        + "    				</table></td>\n"
                        + "    			</tr>\n"
                        + "    		</tbody></table>\n"
                        + "                                    <!--[if mso]>\n"
                        + "                                  </td>\n"
                        + "                                </tr>\n"
                        + "                              </table>\n"
                        + "                            </center>\n"
                        + "                        <![endif]-->\n"
                        + "                    </td>\n"
                        + "                </tr>\n"
                        + "            </tbody></table>\n"
                        + "        </td>\n"
                        + "    </tr>\n"
                        + "</tbody></table>\n"
                        + "</td>\n"
                        + "</tr>\n"
                        + "</tbody></table>\n"
                        + "</div>\n"
                        + "</center>\n"
                        + "\n"
                        + "\n"
                        + "</body></html>";
                String fileName = "new.png";
                String path = context.getRealPath("/images/logo/" + fileName);
                mailer.send(from, to, subject, body, path, fileName);
                /////////////////////////////////////////////////////

                user.setForgotCode(code);
                session.update(user);
                t.commit();
                model.addAttribute("message", "Gửi lại thành công! Hãy kiểm tra mail!");
            } else {
                model.addAttribute("message", "Lỗi!");
            }

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Gửi lại thất bại!");
        } finally {
            session.close();
        }
        
        return "confirm-codeforgot";
    }
    
    @RequestMapping(value = "confirm-code", method = RequestMethod.POST)
    public String forgotpassword(ModelMap model, HttpSession httpsession,
            @RequestParam("email") String to) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            String code = "";
            Random random = new Random();
            for (int i = 0; i < 6; i++) {
                int r = random.nextInt(9); // randomly give a number each time (0-9)
                code = code + r; //Put together the random numbers every time
            }
            String from = "nhophuonhxa@gmail.com";
            String subject = "YÊU CẦU LẤY LẠI MẬT KHẨU SG-ROSE";

            String hql = "FROM User where email ='" + to + "'";
            Query query = session.createQuery(hql);
            if(!to.matches("^[a-zA-Z][\\w-]+@([\\w]+\\.[\\w]+|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})$")){
                model.addAttribute("message", "Định dạng email không hợp lệ!");
            } else if (!query.list().isEmpty()) {
                User user = (User) query.list().get(0);

                httpsession.setAttribute("emailforgotpass", to);

                String body = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><html data-editor-version=\"2\" class=\"sg-campaigns\" xmlns=\"http://www.w3.org/1999/xhtml\"><head>\n"
                        + "	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n"
                        + "	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1\">\n"
                        + "\n"
                        + "	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\">\n"
                        + "\n"
                        + "	<style type=\"text/css\">\n"
                        + "		body, p, div {\n"
                        + "			font-family: inherit;\n"
                        + "			font-size: 14px;\n"
                        + "		}\n"
                        + "		body {\n"
                        + "			color: #000000;\n"
                        + "		}\n"
                        + "		body a {\n"
                        + "			color: #1188E6;\n"
                        + "			text-decoration: none;\n"
                        + "		}\n"
                        + "		p { margin: 0; padding: 0; }\n"
                        + "		table.wrapper {\n"
                        + "			width:100% !important;\n"
                        + "			table-layout: fixed;\n"
                        + "			-webkit-font-smoothing: antialiased;\n"
                        + "			-webkit-text-size-adjust: 100%;\n"
                        + "			-moz-text-size-adjust: 100%;\n"
                        + "			-ms-text-size-adjust: 100%;\n"
                        + "		}\n"
                        + "		img.max-width {\n"
                        + "			max-width: 100% !important;\n"
                        + "		}\n"
                        + "		.column.of-2 {\n"
                        + "			width: 50%;\n"
                        + "		}\n"
                        + "		.column.of-3 {\n"
                        + "			width: 33.333%;\n"
                        + "		}\n"
                        + "		.column.of-4 {\n"
                        + "			width: 25%;\n"
                        + "		}\n"
                        + "		@media screen and (max-width:480px) {\n"
                        + "			.preheader .rightColumnContent,\n"
                        + "			.footer .rightColumnContent {\n"
                        + "				text-align: left !important;\n"
                        + "			}\n"
                        + "			.preheader .rightColumnContent div,\n"
                        + "			.preheader .rightColumnContent span,\n"
                        + "			.footer .rightColumnContent div,\n"
                        + "			.footer .rightColumnContent span {\n"
                        + "				text-align: left !important;\n"
                        + "			}\n"
                        + "			.preheader .rightColumnContent,\n"
                        + "			.preheader .leftColumnContent {\n"
                        + "				font-size: 80% !important;\n"
                        + "				padding: 5px 0;\n"
                        + "			}\n"
                        + "			table.wrapper-mobile {\n"
                        + "				width: 100% !important;\n"
                        + "				table-layout: fixed;\n"
                        + "			}\n"
                        + "			img.max-width {\n"
                        + "				height: auto !important;\n"
                        + "				max-width: 100% !important;\n"
                        + "			}\n"
                        + "			a.bulletproof-button {\n"
                        + "				display: block !important;\n"
                        + "				width: auto !important;\n"
                        + "				font-size: 80%;\n"
                        + "				padding-left: 0 !important;\n"
                        + "				padding-right: 0 !important;\n"
                        + "			}\n"
                        + "			.columns {\n"
                        + "				width: 100% !important;\n"
                        + "			}\n"
                        + "			.column {\n"
                        + "				display: block !important;\n"
                        + "				width: 100% !important;\n"
                        + "				padding-left: 0 !important;\n"
                        + "				padding-right: 0 !important;\n"
                        + "				margin-left: 0 !important;\n"
                        + "				margin-right: 0 !important;\n"
                        + "			}\n"
                        + "		}\n"
                        + "	</style>\n"
                        + "	<!--user entered Head Start--><link href=\"https://fonts.googleapis.com/css?family=Muli&display=swap\" rel=\"stylesheet\"><style>\n"
                        + "		body {font-family: 'Muli', sans-serif;}\n"
                        + "	</style><!--End Head user entered-->\n"
                        + "</head>\n"
                        + "<body>\n"
                        + "	<center class=\"wrapper\" data-link-color=\"#1188E6\" data-body-style=\"font-size:14px; font-family:inherit; color:#000000; background-color:#FFFFFF;\">\n"
                        + "		<div class=\"webkit\">\n"
                        + "			<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" class=\"wrapper\" bgcolor=\"#FFFFFF\">\n"
                        + "				<tbody><tr>\n"
                        + "					<td valign=\"top\" bgcolor=\"#FFFFFF\" width=\"100%\">\n"
                        + "						<table width=\"100%\" role=\"content-container\" class=\"outer\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                        + "							<tbody><tr>\n"
                        + "								<td width=\"100%\">\n"
                        + "									<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                        + "										<tbody><tr>\n"
                        + "											<td>\n"
                        + "                            <!--[if mso]>\n"
                        + "    <center>\n"
                        + "    <table><tr><td width=\"600\">\n"
                        + "    <![endif]-->\n"
                        + "    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%; max-width:600px;\" align=\"center\">\n"
                        + "    	<tbody><tr>\n"
                        + "    		<td role=\"modules-container\" style=\"padding:0px 0px 0px 0px; color:#000000; text-align:left;\" bgcolor=\"#FFFFFF\" width=\"100%\" align=\"left\"><table class=\"module preheader preheader-hide\" role=\"module\" data-type=\"preheader\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0;\">\n"
                        + "    			<tbody><tr>\n"
                        + "    				<td role=\"module-content\">\n"
                        + "    					<p></p>\n"
                        + "    				</td>\n"
                        + "    			</tr>\n"
                        + "    		</tbody></table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"100%\" role=\"module\" data-type=\"columns\" style=\"padding:30px 20px 30px 20px;\" bgcolor=\"#f6f6f6\">\n"
                        + "    			<tbody>\n"
                        + "    				<tr role=\"module-content\">\n"
                        + "    					<td height=\"100%\" valign=\"top\">\n"
                        + "    						<table class=\"column\" width=\"540\" style=\"width:540px; border-spacing:0; border-collapse:collapse; margin:0px 10px 0px 10px;\" cellpadding=\"0\" cellspacing=\"0\" align=\"left\" border=\"0\" bgcolor=\"\">\n"
                        + "    							<tbody>\n"
                        + "    								<tr>\n"
                        + "    									<td style=\"padding:0px;margin:0px;border-spacing:0;\"><table class=\"wrapper\" role=\"module\" data-type=\"image\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"72aac1ba-9036-4a77-b9d5-9a60d9b05cba\">\n"
                        + "\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"331cde94-eb45-45dc-8852-b7dbeb9101d7\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:0px 0px 20px 0px;\" role=\"module-content\" bgcolor=\"\">\n"
                        + "    												</td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"wrapper\" role=\"module\" data-type=\"image\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"d8508015-a2cb-488c-9877-d46adf313282\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"font-size:6px; line-height:10px; padding:0px 0px 0px 0px;\" valign=\"top\" align=\"center\">\n"
                        + "    													<img class=\"max-width\" border=\"0\" style=\"display:block; color:#000000; text-decoration:none; font-family:Helvetica, arial, sans-serif; font-size:16px;\" width=\"200\" height=\"80\" alt=\"\" data-proportionally-constrained=\"true\" data-responsive=\"false\" src=\"https://lh3.googleusercontent.com/DNdRvWVyuCXFR1Kry3ifLyC53jN0IlnvUgVo1KkTX9iiSaW_i_s7o2ONcd2f04sJc_yxjdmAhNZp4mTAKGXq-afopPhAWg75l65oG5HKE9sF3hh4Ko__IYlojEbwe4aBOL9ks4xHcw=w2400\" height=\"33\">\n"
                        + "    												</td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"27716fe9-ee64-4a64-94f9-a4f28bc172a0\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:0px 0px 30px 0px;\" role=\"module-content\" bgcolor=\"\">\n"
                        + "    												</td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"948e3f3f-5214-4721-a90e-625a47b1c957\" data-mc-module-version=\"2019-10-22\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:50px 30px 18px 30px; line-height:36px; text-align:inherit; background-color:#ffffff;\" height=\"100%\" valign=\"top\" bgcolor=\"#ffffff\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"font-size: 43px\">Yêu cầu lấy lại mật khẩu của bạn &nbsp;</span></div><div></div></div></td>\n"
                        + "    											</tr>\n"
                        + "    										</tbody>\n"
                        + "    									</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"a10dcb57-ad22-4f4d-b765-1d427dfddb4e\" data-mc-module-version=\"2019-10-22\">\n"
                        + "    										<tbody>\n"
                        + "    											<tr>\n"
                        + "    												<td style=\"padding:18px 30px 18px 30px; line-height:22px; text-align:inherit; background-color:#ffffff;\" height=\"100%\" valign=\"top\" bgcolor=\"#ffffff\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"font-size: 18px\">Bạn vừa yêu cầu thay đổi mật khẩu của mình</span><span style=\"color: #000000; font-size: 18px; font-family: arial,helvetica,sans-serif\"> hãy sử dụng Code dưới đây để hoàn tất yêu cầu thay đổi mật khẩu của bạn</span><span style=\"font-size: 18px\">.</span></div>\n"
                        + "    													<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffbe00; font-size: 18px\"><strong>Xin cảm ơn!&nbsp;</strong></span></div><div></div></div></td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"7770fdab-634a-4f62-a277-1c66b2646d8d\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td style=\"padding:0px 0px 20px 0px;\" role=\"module-content\" bgcolor=\"#ffffff\">\n"
                        + "    													</td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"d050540f-4672-4f31-80d9-b395dc08abe1\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td align=\"center\" bgcolor=\"#ffffff\" class=\"outer-td\" style=\"padding:0px 0px 0px 0px;\">\n"
                        + "    														<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                        + "    															<tbody>\n"
                        + "    																<tr>\n"
                        + "    																	<td align=\"center\" bgcolor=\"#ffbe00\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\">\n"
                        + "    																		<a style=\"background-color:#ffbe00; border:1px solid #ffbe00; border-color:#ffbe00; border-radius:0px; border-width:1px; color:#000000; display:inline-block; font-size:14px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:12px 40px 12px 40px; text-align:center; text-decoration:none; border-style:solid; font-family:inherit;\" target=\"_blank\">" + code + "</a>\n"
                        + "    																	</td>\n"
                        + "    																</tr>\n"
                        + "    															</tbody>\n"
                        + "    														</table>\n"
                        + "    													</td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"7770fdab-634a-4f62-a277-1c66b2646d8d.1\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td style=\"padding:0px 0px 50px 0px;\" role=\"module-content\" bgcolor=\"#ffffff\">\n"
                        + "    													</td>\n"
                        + "    												</tr>\n"
                        + "    											</tbody>\n"
                        + "    										</table><table class=\"module\" role=\"module\" data-type=\"text\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"a265ebb9-ab9c-43e8-9009-54d6151b1600\" data-mc-module-version=\"2019-10-22\">\n"
                        + "    											<tbody>\n"
                        + "    												<tr>\n"
                        + "    													<td style=\"padding:50px 30px 50px 30px; line-height:22px; text-align:inherit; background-color:#6e6e6e;\" height=\"100%\" valign=\"top\" bgcolor=\"#6e6e6e\" role=\"module-content\"><div><div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\"><strong>Tôi phải làm gì tiếp theo:</strong></span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">1. Sao chép mã xác nhận gồm 6 số ở phía trên.</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">2. Quay lại Website SG-ROSE và dán mã xác nhận vào ô xác nhận.</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">3. Nhấn vào Button xác nhận để kích hoạt tài khoản của bạn.</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><br></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">Bạn cần giúp đỡ? Nhóm hỗ trợ chúng tôi luôn luôn</span></div>\n"
                        + "    														<div style=\"font-family: inherit; text-align: center\"><span style=\"color: #ffffff; font-size: 18px\">sẵn sàng để giúp bạn!&nbsp;</span></div><div></div></div></td>\n"
                        + "    													</tr>\n"
                        + "    												</tbody>\n"
                        + "    											</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"d050540f-4672-4f31-80d9-b395dc08abe1.1\">\n"
                        + "    												<tbody>\n"
                        + "    													<tr>\n"
                        + "    														<td align=\"center\" bgcolor=\"#6e6e6e\" class=\"outer-td\" style=\"padding:0px 0px 0px 0px;\">\n"
                        + "    															<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                        + "    																<tbody>\n"
                        + "    																	<tr>\n"
                        + "    																		<td align=\"center\" bgcolor=\"#ffbe00\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\">\n"
                        + "    																			<a href=\"\" style=\"background-color:#ffbe00; border:1px solid #ffbe00; border-color:#ffbe00; border-radius:0px; border-width:1px; color:#000000; display:inline-block; font-size:14px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:12px 40px 12px 40px; text-align:center; text-decoration:none; border-style:solid; font-family:inherit;\" target=\"_blank\">Liên Hệ Hỗ Trợ</a>\n"
                        + "    																		</td>\n"
                        + "    																	</tr>\n"
                        + "    																</tbody>\n"
                        + "    															</table>\n"
                        + "    														</td>\n"
                        + "    													</tr>\n"
                        + "    												</tbody>\n"
                        + "    											</table><table class=\"module\" role=\"module\" data-type=\"spacer\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout: fixed;\" data-muid=\"c37cc5b7-79f4-4ac8-b825-9645974c984e\">\n"
                        + "    												<tbody>\n"
                        + "    													<tr>\n"
                        + "    														<td style=\"padding:0px 0px 30px 0px;\" role=\"module-content\" bgcolor=\"6E6E6E\">\n"
                        + "    														</td>\n"
                        + "    													</tr>\n"
                        + "    												</tbody>\n"
                        + "    											</table></td>\n"
                        + "    										</tr>\n"
                        + "    									</tbody>\n"
                        + "    								</table>\n"
                        + "\n"
                        + "    							</td>\n"
                        + "    						</tr>\n"
                        + "    					</tbody>\n"
                        + "    				</table><div data-role=\"module-unsubscribe\" class=\"module\" role=\"module\" data-type=\"unsubscribe\" style=\"color:#444444; font-size:12px; line-height:20px; padding:16px 16px 16px 16px; text-align:Center;\" data-muid=\"4e838cf3-9892-4a6d-94d6-170e474d21e5\">\n"
                        + "    					<div class=\"Unsubscribe--addressLine\"><p class=\"Unsubscribe--senderName\" style=\"font-size:12px; line-height:20px;\">Được gửi từ SG-ROSE</p><p style=\"font-size:12px; line-height:20px;\"><span class=\"Unsubscribe--senderAddress\">Công viên phần mềm, Toà nhà Innovation lô 24</span>, <span class=\"Unsubscribe--senderCity\">Q. 12</span>, <span class=\"Unsubscribe--senderState\">Tp. HCM</span> <span class=\"Unsubscribe--senderZip\"></span></p></div>\n"
                        + "    					<p style=\"font-size:12px; line-height:20px;\"><a class=\"Unsubscribe--unsubscribeLink\" href=\"{{{unsubscribe}}}\" target=\"_blank\" style=\"\">© SG-Rose Inc</a> - <a href=\"{{{unsubscribe_preferences}}}\" target=\"_blank\" class=\"Unsubscribe--unsubscribePreferences\" style=\"\">2020 All rights reserved.</a></p>\n"
                        + "    				</div><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"module\" data-role=\"module-button\" data-type=\"button\" role=\"module\" style=\"table-layout:fixed;\" width=\"100%\" data-muid=\"550f60a9-c478-496c-b705-077cf7b1ba9a\">\n"
                        + "    					<tbody>\n"
                        + "    						<tr>\n"
                        + "    							<td align=\"center\" bgcolor=\"\" class=\"outer-td\" style=\"padding:0px 0px 20px 0px;\">\n"
                        + "    								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"wrapper-mobile\" style=\"text-align:center;\">\n"
                        + "    									<tbody>\n"
                        + "    										<tr>\n"
                        + "    											<td align=\"center\" bgcolor=\"#f5f8fd\" class=\"inner-td\" style=\"border-radius:6px; font-size:16px; text-align:center; background-color:inherit;\"><a href=\"https://sendgrid.com/\" style=\"background-color:#f5f8fd; border:1px solid #f5f8fd; border-color:#f5f8fd; border-radius:25px; border-width:1px; color:#a8b9d5; display:inline-block; font-size:10px; font-weight:normal; letter-spacing:0px; line-height:normal; padding:5px 18px 5px 18px; text-align:center; text-decoration:none; border-style:solid; font-family:helvetica,sans-serif;\" target=\"_blank\">♥ Made with in SG-ROSE</a></td>\n"
                        + "    										</tr>\n"
                        + "    									</tbody>\n"
                        + "    								</table>\n"
                        + "    							</td>\n"
                        + "    						</tr>\n"
                        + "    					</tbody>\n"
                        + "    				</table></td>\n"
                        + "    			</tr>\n"
                        + "    		</tbody></table>\n"
                        + "                                    <!--[if mso]>\n"
                        + "                                  </td>\n"
                        + "                                </tr>\n"
                        + "                              </table>\n"
                        + "                            </center>\n"
                        + "                        <![endif]-->\n"
                        + "                    </td>\n"
                        + "                </tr>\n"
                        + "            </tbody></table>\n"
                        + "        </td>\n"
                        + "    </tr>\n"
                        + "</tbody></table>\n"
                        + "</td>\n"
                        + "</tr>\n"
                        + "</tbody></table>\n"
                        + "</div>\n"
                        + "</center>\n"
                        + "\n"
                        + "\n"
                        + "</body></html>";
                String fileName = "new.png";
                String path = context.getRealPath("/images/logo/" + fileName);
                mailer.send(from, to, subject, body, path, fileName);
                /////////////////////////////////////////////////////

                user.setForgotCode(code);
                session.update(user);
                t.commit();
                return "redirect:/confirm-codeforgot";
            } else {
                model.addAttribute("message", "Email không tồn tại!");
            }

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
            model.addAttribute("message", "Email không hợp lệ!");
        } finally {
            session.close();
        }
        return "forgotpassword";
    }

    public static boolean isNumeric(String str) {
        NumberFormat formatter = NumberFormat.getInstance();
        ParsePosition pos = new ParsePosition(0);
        formatter.parse(str, pos);
        return str.length() == pos.getIndex();
    }

    @RequestMapping("logoff")
    public String logoff(HttpSession httpSession) {
        httpSession.removeAttribute("user");
        httpSession.removeAttribute("staff");
        return "redirect:/login";
    }

    @ModelAttribute("genders")
    @SuppressWarnings("unchecked")
    public List<Gender> getGenders() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Gender";
        Query query = session.createQuery(hql);
        List<Gender> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsers() {
        Session session = factory.getCurrentSession();
        String hql = "FROM User";
        Query query = session.createQuery(hql);
        List<User> list = query.list();
        return list;
    }

    /////////////////////Validate///////////////////////
    @SuppressWarnings("unchecked")
    public List<User> vaidateReg(String email) {
        Session session = factory.getCurrentSession();
        String hql = "FROM User where email = :email";

        Query query = session.createQuery(hql);
        query.setParameter("email", email);
        List<User> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<User> vaidateRegPhone(String phone) {
        Session session = factory.getCurrentSession();
        String hql = "FROM User where phone = :phone";

        Query query = session.createQuery(hql);
        query.setParameter("phone", phone);
        List<User> list = query.list();
        return list;
    }
}
