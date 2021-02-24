package pl.coderslab.motlang.dao;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import pl.coderslab.motlang.entity.Comment;
import pl.coderslab.motlang.entity.EditedUser;
import pl.coderslab.motlang.entity.User;

import java.io.IOException;
import java.util.List;

public interface Service {

    boolean register(Model model, User user, String terms, String confirm, BindingResult result) throws IOException;

    void edit(String password, String passConf, User user, EditedUser editedUser);

    User getUserWithComments(User user);

    User getUserWithComments(Long id);

    User getUserWithLessons(Long id);

    void addComment(Long id, Comment comment, User author);

    double countRating(List<Comment> comments);

    void updateRating(Long id);

}
