package za.co.entelect.bootcamp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController extends BaseController {

    @Override
    protected String getNavSection() {
        return "home";
    }

    @GetMapping("")
    public String homePage(ModelMap modelMap) {
        return "index";
    }
}
