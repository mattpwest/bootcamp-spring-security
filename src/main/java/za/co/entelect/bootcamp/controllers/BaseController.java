package za.co.entelect.bootcamp.controllers;

import org.springframework.web.bind.annotation.ModelAttribute;

public abstract class BaseController {

    protected abstract String getNavSection();

    @ModelAttribute("nav")
    public String navSection() {
        return getNavSection();
    }
}
