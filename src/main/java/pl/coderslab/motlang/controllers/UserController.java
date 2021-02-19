package pl.coderslab.motlang.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.motlang.entity.Language;
import pl.coderslab.motlang.entity.User;
import pl.coderslab.motlang.repository.LanguageRepository;
import pl.coderslab.motlang.service.AuthenticationService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    private LanguageRepository langRepo;
    private AuthenticationService authService;


    public UserController(LanguageRepository langRepo, AuthenticationService authService) {
        this.langRepo = langRepo;
        this.authService = authService;
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
        if (authService.register(model, user, terms, confirm, result)) {
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

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password) {
        if (authService.verify(username, password)) {
            return "dashboard";
        }
        return "login";
    }

    public void edit(Long id) {
    }
}
