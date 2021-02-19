package pl.coderslab.motlang.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.motlang.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUserName(String userName);

    boolean existsByUserNameOrEmail(String userName, String email);
}
