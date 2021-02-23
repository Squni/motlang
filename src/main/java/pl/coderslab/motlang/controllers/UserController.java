package pl.coderslab.motlang.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.motlang.entity.Language;
import pl.coderslab.motlang.entity.User;
import pl.coderslab.motlang.repository.LanguageRepository;
import pl.coderslab.motlang.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    private final LanguageRepository langRepo;
    private final UserService userService;


    public UserController(LanguageRepository langRepo, UserService userService) {
        this.langRepo = langRepo;
        this.userService = userService;
    }

    @ModelAttribute("languages")
    public List<Language> languages() {
        return langRepo.findAll();
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @Valid User user, BindingResult result, @RequestParam String terms,
                           @RequestParam String confirm) {
        if (userService.register(model, user, terms, confirm, result)) {
            return "redirect:login";
        }
        model.addAttribute("languages", langRepo.findAll());
        return "register";
    }

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

}
