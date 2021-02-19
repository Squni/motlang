package pl.coderslab.motlang.dao;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import pl.coderslab.motlang.entity.User;

public interface Authentication {

    boolean register(Model model, User user, String terms, String confirm, BindingResult result);

    boolean verify(String username, String password);

    User findByUserName(String name);

    void edit(Long id);
}
