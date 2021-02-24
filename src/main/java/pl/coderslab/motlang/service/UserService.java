package pl.coderslab.motlang.service;

import lombok.Data;
import org.apache.commons.io.FileUtils;
import org.hibernate.Hibernate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import pl.coderslab.motlang.dao.Service;
import pl.coderslab.motlang.entity.Comment;
import pl.coderslab.motlang.entity.Role;
import pl.coderslab.motlang.entity.User;
import pl.coderslab.motlang.repository.CommentRepository;
import pl.coderslab.motlang.repository.RoleRepository;
import pl.coderslab.motlang.repository.UserRepository;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@org.springframework.stereotype.Service
@Data
public class UserService implements Service {

    private final UserRepository userRepo;
    private final RoleRepository roleRepo;
    private final BCryptPasswordEncoder passwordEncoder;
    private final CommentRepository commentRepo;

    UserService(UserRepository userRepo, RoleRepository roleRepo, BCryptPasswordEncoder passwordEncoder, CommentRepository commentRepo) {
        this.roleRepo = roleRepo;
        this.userRepo = userRepo;
        this.passwordEncoder = passwordEncoder;
        this.commentRepo = commentRepo;
    }

    @Override
    public boolean register(Model model, User user, String terms, String confirm, BindingResult result) throws IOException {
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
            Role userRole = roleRepo.findByName("ROLE_USER");
            user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
            userRepo.save(user);
            Long id = userRepo.findByUserName(user.getUserName()).getId();
            File newUserDirectory = new File("src/main/webapp/users/" + id);
            File defaultAvatar = new File("src/main/webapp/resources/userDefault/avatar.jpg");
            FileUtils.copyFileToDirectory(defaultAvatar, newUserDirectory);
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

    @Override
    public User getUserWithComments(User user) {
        User userWithComments = userRepo.findById(user.getId()).get();
        Hibernate.initialize(userWithComments.getComments());
        return userWithComments;
    }

    @Override
    public User getUserWithComments(Long id) {
        User userWithComments = userRepo.findById(id).get();
        Hibernate.initialize(userWithComments.getComments());
        return userWithComments;
    }

    @Override
    public User getUserWithLessons(Long id) {
        User userWithLessons = userRepo.findById(id).get();
        Hibernate.initialize(userWithLessons.getLessons());
        return userWithLessons;
    }

    @Override
    public void addComment(Long id, Comment comment, User author) {
        User user = userRepo.findById(id).get();
        comment.setOwner(user);
        comment.setAuthor(author);
        commentRepo.save(comment);
    }



}
