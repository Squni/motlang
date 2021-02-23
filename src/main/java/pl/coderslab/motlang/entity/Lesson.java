package pl.coderslab.motlang.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.time.LocalDateTime;

@Entity
@Data
public class Lesson {

    @Id
    private Long id;

    private LocalDateTime time;

    @OneToOne
    private User student;

}
