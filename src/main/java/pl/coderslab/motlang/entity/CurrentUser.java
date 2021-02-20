package pl.coderslab.motlang.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Set;

@Data
public class CurrentUser extends User{
    private final pl.coderslab.motlang.entity.User user;
    public CurrentUser(String username, String password,
                       Set<GrantedAuthority> authorities,
                       pl.coderslab.motlang.entity.User user) {
        super(username, password, authorities);
        this.user = user;
    }
    public pl.coderslab.motlang.entity.User getUser() {return user;}
}
