package pl.coderslab.motlang.service;

import org.springframework.stereotype.Service;
import pl.coderslab.motlang.dao.AppViews;
import pl.coderslab.motlang.entity.Language;
import pl.coderslab.motlang.entity.User;
import pl.coderslab.motlang.repository.UserRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AppViewsService implements AppViews {

    UserRepository userRepo;

    public AppViewsService(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    public List<Integer> languagesToIds(List<Language> toLearnLanguages) {
        List<Integer> toLearnLanguagesIds = new ArrayList<>();
        toLearnLanguages.forEach(language -> toLearnLanguagesIds.add(language.getId()));
        return toLearnLanguagesIds;
    }

    @Override
    public List<User> matchUsersByRating(List<Language> toLearnLanguages) {
        return userRepo.findTop5InMotherTongueIdsOrderByRating(languagesToIds(toLearnLanguages));
    }

    @Override
    public List<User> matchUsersByLevel(List<Language> toLearnLanguages) {
        return userRepo.findTop5InMotherTongueIdsOrderByLevel(languagesToIds(toLearnLanguages));
    }

    @Override
    public Map<String, List<User>> search(String searchParam) {
        Map<String, List<User>> results = new HashMap();
        if (searchParam.matches("^\\S+@\\S+\\.\\S+$")) {
            results.put("email", userRepo.findAllByEmail(searchParam));
        }
        if (searchParam.split(" ").length == 2) {
            String[] params = searchParam.split(" ");
            results.put("fullname", userRepo.findAllByNameAndLastName(params[0], params[1]));
        }
        results.put("name", userRepo.findAllByName(searchParam));
        results.put("lastName", userRepo.findAllByLastName(searchParam));
        results.put("motherTongue", userRepo.findAllByMotherTongueName(searchParam));
        results.put("userName", userRepo.findAllByUserName(searchParam));
        return results;
    }


}
