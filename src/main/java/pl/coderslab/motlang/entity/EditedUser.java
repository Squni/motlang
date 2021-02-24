package pl.coderslab.motlang.entity;

import lombok.Data;

import java.util.List;

@Data
public class EditedUser {
    private Long id;
    private String name;
    private String lastName;
    private String email;
    private List<Language> toLearnLanguages;
    private String bio;
    private String password;
}
