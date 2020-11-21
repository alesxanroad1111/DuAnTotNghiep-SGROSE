package controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/uploader/")
public class UploaderController {
	@Autowired
	ServletContext context;
	
	@RequestMapping("form")
	public String index(ModelMap model) {
		return "uploader/form";
	}
	
	@RequestMapping("upload")
	public String upload(ModelMap model, 
			@RequestParam("image") MultipartFile image) {
		if(image.isEmpty()){
			model.addAttribute("message", "Vui lòng chọn file !");
		}
		else{
			try {
				String path = context.getRealPath("/images/"+image.getOriginalFilename());
				image.transferTo(new File(path));
                                System.out.println(path);
				model.addAttribute("name", image.getOriginalFilename());
				model.addAttribute("type", image.getContentType());
				model.addAttribute("size", image.getSize());
				return "uploader/success";
			} 
			catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file !");
			}
		}
		return "uploader/form";
	}
}
