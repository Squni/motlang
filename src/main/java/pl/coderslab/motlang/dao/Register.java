package pl.coderslab.motlang.dao;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import pl.coderslab.motlang.entity.User;

public interface Register {

    boolean register(Model model, User user, String terms, String confirm, BindingResult result);

}
