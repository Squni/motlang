package pl.coderslab.motlang.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

    @RequestMapping(value = {"", "/home"})
    public String home(){return "home";}


}
