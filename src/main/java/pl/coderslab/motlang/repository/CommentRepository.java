package pl.coderslab.motlang.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.motlang.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {
}
