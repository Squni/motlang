package pl.coderslab.motlang.dao;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import pl.coderslab.motlang.entity.User;

public interface Service {

    boolean register(Model model, User user, String terms, String confirm, BindingResult result);

    void edit(String password, String passConf, User user);

}
