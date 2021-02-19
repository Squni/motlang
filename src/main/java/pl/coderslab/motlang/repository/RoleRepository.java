package pl.coderslab.motlang.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.motlang.entity.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {Role findByName(String name);}
