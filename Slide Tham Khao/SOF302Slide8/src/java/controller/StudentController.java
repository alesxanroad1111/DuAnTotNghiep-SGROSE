package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bean.Major;
import bean.Student1;
import bean.Student2;

@Controller
@RequestMapping("/student/")
public class StudentController {
	
	@RequestMapping("validate1")
	public String validate1(ModelMap model) {
		model.addAttribute("student", new Student1());
		return "student1";
	}
	
@RequestMapping(value="validate1", method=RequestMethod.POST)
public String validate1(ModelMap model,
		@ModelAttribute("student") Student1 student,  BindingResult errors) {
        if(student.getName().trim().length() == 0){
                errors.rejectValue("name", "student",  "Vui lòng nhập họ tên !");
        }
        if(student.getMark() == null){
                errors.rejectValue("mark", "student",  "Vui lòng nhập điểm !");
        }
        else if(student.getMark() < 0 || student.getMark() > 10){
                errors.rejectValue("mark", "student",  "Điểm không hợp lệ  !");
        }
        if(student.getMajor() == null){
                errors.rejectValue("major", "student",  "Vui lòng chọn một chuyên ngành !");
        }
        if(errors.hasErrors()){
                model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
        }
        else{
                model.addAttribute("message", "Chúc mừng, bạn đã nhập đúng !");
        }
        
            return "student1";
    }

    @RequestMapping("validate2")
    public String validate2(ModelMap model) {
            model.addAttribute("student", new Student2());
            return "student3";
    }

    @RequestMapping(value="validate2", method=RequestMethod.POST)
    public String validate2(ModelMap model,
                    @Validated @ModelAttribute("student") Student2 student,  BindingResult errors) {
            if(errors.hasErrors()){
                    model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
            }
            else{
                    model.addAttribute("message", "Chúc mừng, bạn đã nhập đúng !");
            }
            return "student3";
    }

    @ModelAttribute("majors")
    public List<Major> getMajors() {
            List<Major> majors = new ArrayList<>();
            majors.add(new Major("APP", "Ứng dụng phần mềm"));
            majors.add(new Major("WEB", "Thiết kế trang web"));
            return majors;
    }
}
