package pl.coderslab.motlang.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("app")
public class AppController {

    @GetMapping("dashboard")
    public String dashboard(){
        return "dashboard";
    }

}
