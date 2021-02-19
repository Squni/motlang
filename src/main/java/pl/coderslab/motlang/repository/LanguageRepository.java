package pl.coderslab.motlang.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.motlang.entity.Language;

@Repository
public interface LanguageRepository extends JpaRepository<Language, Integer> {

}
