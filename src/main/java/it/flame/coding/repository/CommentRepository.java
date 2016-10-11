package it.flame.coding.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import it.flame.coding.domain.Comment;
/**
 * Created by dskim on 2016. 9. 13..
 */
public interface CommentRepository extends JpaRepository<Comment, Long> {
}
