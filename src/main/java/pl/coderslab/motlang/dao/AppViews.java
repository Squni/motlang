package pl.coderslab.motlang.dao;

import pl.coderslab.motlang.entity.Language;
import pl.coderslab.motlang.entity.User;

import java.util.List;
import java.util.Map;

public interface AppViews {

    List<User> matchUsersByRating(List<Language> languages);

    List<User> matchUsersByLevel(List<Language> toLearnLanguages);

    Map<String, List<User>> search(String searchParam);

}
