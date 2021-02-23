package pl.coderslab.motlang.entity;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.List;
import java.util.Set;

@Entity
@Data
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Username cannot be empty")
    @Size(min = 8, max = 20, message = "Username has to be between 8 and 20 characters.")
    private String userName;

    @NotBlank(message = "Name cannot be empty")
    @Size(min = 2, max = 20, message = "Name has to be between 2 and 20 characters.")
    private String name;

    @NotBlank(message = "Last name cannot be empty")
    @Size(min = 2, max = 20, message = "Last name has to be between 2 and 20 characters.")
    private String lastName;

    @NotNull(message = "Age cannot be empty")
    @Positive(message = "Age has to be greater than 0")
    @Max(110)
    private Integer age;

    @Email(message = "Please input valid email address")
    private String email;

    @Pattern(regexp = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}", message = "Password doesn't match requirements.")
    private String password;

    private int enabled;

    @Value("0.0")
    private double rating;

    @ManyToOne
    private Language motherTongue;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Language> toLearnLanguages;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    @Value("0")
    private Long points;

    @Value("1")
    private Long rank;

    @OneToMany
    private List<Lesson> lessons;

    @OneToMany
    private List<Comment> comments;

    public User() {
    }

    public User(String userName, String password, Set<GrantedAuthority> grantedAuthorities) {
    }
}
