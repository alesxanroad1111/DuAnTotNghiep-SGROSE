
package controller;



import bean.Flower;
import dao.FlowerDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/")
public class HomeController {
    
    @RequestMapping("home")
    public String index(ModelMap model){
        FlowerDAO st = new FlowerDAO();
        List<Flower> list = new ArrayList<Flower>();
        list = st.showFlower("");
        model.addAttribute("listFlower", list);
        
        Flower sv = new Flower();
        sv = list.get(0);
        model.addAttribute("flower", sv);
        return "user/home";
    }
}
