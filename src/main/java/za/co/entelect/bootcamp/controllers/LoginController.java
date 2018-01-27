package za.co.entelect.bootcamp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController extends BaseController {

    @Override
    protected String getNavSection() {
        return "home";
    }

    @GetMapping("/login")
    public String loginPage(ModelMap modelMap) {
        return "login";
    }
}
