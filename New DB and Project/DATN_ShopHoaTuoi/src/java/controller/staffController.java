package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class staffController {
    @RequestMapping("staff")
    public String staff(){
        return "admin/staff";
    }
}
