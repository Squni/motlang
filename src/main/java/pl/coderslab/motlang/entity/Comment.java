package pl.coderslab.motlang.entity;

import lombok.Data;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Entity
@Data
@Table(name = "comment")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(max = 255)
    private String content;

    @ManyToOne
    private User owner;

    @ManyToOne
    private User author;

    @Min(1)
    @Max(5)
    private int rating;

    public Comment() {

    }
}
