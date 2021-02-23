package pl.coderslab.motlang.service;

import lombok.Data;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import pl.coderslab.motlang.dao.Service;
import pl.coderslab.motlang.entity.Role;
import pl.coderslab.motlang.entity.User;
import pl.coderslab.motlang.repository.RoleRepository;
import pl.coderslab.motlang.repository.UserRepository;

import java.util.Arrays;
import java.util.HashSet;

@org.springframework.stereotype.Service
@Data
public class UserService implements Service {

    private final UserRepository userRepo;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    UserService(UserRepository userRepo, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
        this.roleRepository = roleRepository;
        this.userRepo = userRepo;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public boolean register(Model model, User user, String terms, String confirm, BindingResult result) {
        boolean check = true;
        if (result.hasErrors()) {
            check = false;
        }
        if (terms == null) {
            check = false;
            model.addAttribute("terms", "Please accept terms and conditions");
        }
        if (!user.getPassword().equals(confirm)) {
            check = false;
            model.addAttribute("confirm", "Password doesn't match confirmation.");
        }
        if (userRepo.existsByUserNameOrEmail(user.getUserName(), user.getEmail())) {
            check = false;
            model.addAttribute("exists", "User already exists");
        }
        if (check) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setEnabled(1);
            Role userRole = roleRepository.findByName("ROLE_USER");
            user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
            userRepo.save(user);
            model.addAttribute("registered", "Successfully registered");

        }
        return check;
    }

    @Override
    public void edit(String password, String passConf, User user) {
        if (!password.isBlank() && password.equals(passConf)
                && password.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}")) {
            user.setPassword(passwordEncoder.encode(password));
        }
        userRepo.save(user);
    }

}
