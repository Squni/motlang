package pl.coderslab.motlang.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.motlang.entity.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUserName(String userName);

    boolean existsByUserNameOrEmail(String userName, String email);

    List<User> findAllByEmail(String email);

    List<User> findAllByNameAndLastName(String name, String lastName);

    List<User> findAllByLastName(String lastName);

    List<User> findAllByName(String name);

    List<User> findAllByMotherTongueName(String motherTongueName);

    List<User> findAllByUserName(String userName);


    @Query(value = "select * from user where mother_tongue_id in ?1 order by rating desc limit 5", nativeQuery = true)
    List<User> findTop5InMotherTongueIdsOrderByRating(List<Integer> motherTongueIds);

    @Query(value = "select * from user where mother_tongue_id in ?1 order by user.`rank` desc limit 5", nativeQuery = true)
    List<User> findTop5InMotherTongueIdsOrderByRank(List<Integer> motherTongueIds);

}
