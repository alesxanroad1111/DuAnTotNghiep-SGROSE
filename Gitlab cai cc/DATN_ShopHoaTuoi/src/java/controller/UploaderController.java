package controller;

import java.io.File;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;



@Controller
@RequestMapping("/admin/")
public class UploaderController {

    @Autowired
    ServletContext context;
    
    @RequestMapping("upload")
    public String upload(ModelMap model){
        return "admin/upload";
    }
    
    @RequestMapping(value = "upload", method = RequestMethod.POST, params = "btnUpload")
    public String upload(ModelMap model, @RequestParam("image") CommonsMultipartFile[] image) {
        if (image != null && image.length > 0) {

            try {
                for (CommonsMultipartFile aFile : image) {
                    
                    System.out.println("Saving file: " + aFile.getOriginalFilename());
                    String path = context.getRealPath("/images/" +  aFile.getOriginalFilename());
                    aFile.transferTo(new File(path));
                    model.addAttribute("message", "Tải lên Thành Công!");
                }
                return "admin/upload";
            } catch (Exception e) {
                model.addAttribute("message", "Vui lòng chọn file !");
                e.printStackTrace();
            }
        } else {
            model.addAttribute("message", "Vui lòng chọn file !");
        }
        return "admin/upload";
    }
}
