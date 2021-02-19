package pl.coderslab.motlang.service;

import lombok.Data;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import pl.coderslab.motlang.dao.Authentication;
import pl.coderslab.motlang.entity.Role;
import pl.coderslab.motlang.entity.User;
import pl.coderslab.motlang.repository.RoleRepository;
import pl.coderslab.motlang.repository.UserRepository;

import java.util.Arrays;
import java.util.HashSet;

@Service
@Data
public class AuthenticationService implements Authentication {

    private final UserRepository userRepo;
    private final RoleRepository roleRepository;

    AuthenticationService(UserRepository userRepo, RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
        this.userRepo = userRepo;
    }

    @Override
    public User findByUserName(String username) {
        return userRepo.findByUserName(username);
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
            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            user.setEnabled(1);
            Role userRole = roleRepository.findByName("ROLE_USER");
            user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
            userRepo.save(user);
            model.addAttribute("registered", "Successfully registered");
        }
        return check;
    }

    @Override
    public boolean verify(String username, String password) {
        User userToVerify = findByUserName(username);
        System.out.println(userToVerify);
        if (userToVerify != null && BCrypt.checkpw(password, userToVerify.getPassword())) {
            return true;
        }
        return false;
    }

    @Override
    public void edit(Long id) {

    }
}
