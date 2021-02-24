package pl.coderslab.motlang.controllers;


import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.motlang.entity.*;
import pl.coderslab.motlang.repository.LanguageRepository;
import pl.coderslab.motlang.repository.UserRepository;
import pl.coderslab.motlang.service.AppViewsService;
import pl.coderslab.motlang.service.UserService;

import javax.validation.Valid;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("app")
public class AppController {
    private User user;
    private final AppViewsService appService;
    private final UserService userService;
    private final UserRepository userRepository;
    private final LanguageRepository languageRepository;

    public AppController(AppViewsService appService, UserService userService, UserRepository userRepository, LanguageRepository languageRepository) {
        this.appService = appService;
        this.userService = userService;
        this.userRepository = userRepository;
        this.languageRepository = languageRepository;
    }

    @ModelAttribute("user")
    public User currentUser(@AuthenticationPrincipal CurrentUser currentUser) {
        this.user = currentUser.getUser();
        return user;
    }

    @ModelAttribute("languages")
    public List<Language> languages() {
        return languageRepository.findAll();
    }

    @ModelAttribute("pairedUsersByRating")
    public List<User> pairedByRating() {
        return appService.matchUsersByRating(user.getToLearnLanguages());
    }

    @ModelAttribute("pairedUsersByRank")
    public List<User> pairedByRank() {
        return appService.matchUsersByLevel(user.getToLearnLanguages());
    }

    @ModelAttribute("date")
    public String currentUser() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return formatter.format(LocalDate.now());
    }

    @GetMapping("dashboard")
    public String dashboard() {
        return "dashboard";
    }

    @GetMapping("profile")
    public String profile(Model model) {
        model.addAttribute("user", userService.getUserWithComments(user));
        EditedUser editedUser = new EditedUser();
        editedUser.setToLearnLanguages(user.getToLearnLanguages());
        model.addAttribute("editedUser", editedUser);
        return "profile";
    }

    @PostMapping("edit")
    public String profile(EditedUser editedUser,
                          @RequestParam String password, @RequestParam String passConfirm) {
        userService.edit(password, passConfirm, user, editedUser);
        return "redirect:/app/profile";
    }

    @GetMapping("visit/profile/{id}")
    public String visitProfile(@PathVariable String id, Model model) {
        if (NumberUtils.isParsable(id)) {
            Long idL = Long.parseLong(id);
            model.addAttribute("comment", new Comment());
            model.addAttribute("visitUser", userService.getUserWithComments(idL));
            return "visitProfile";
        } else {
            return "error";
        }
    }

    @PostMapping("visit/profile/{id}")
    public String addComment(@PathVariable String id, Comment comment) {
        Long idL = Long.parseLong(id);
        userService.addComment(idL, comment, user);
        userService.updateRating(idL);
        return "redirect:{id}";
    }

    @PostMapping("search")
    public String search(@RequestParam String param, Model model) {
        model.addAttribute("results", appService.search(param));
        return "search";
    }

    @GetMapping("explore")
    public String explore(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "explore";
    }
}
