package it.flame.coding.repository.spec;

import it.flame.coding.domain.Board;
import it.flame.coding.domain.BoardType;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * Created by dskim on 2016. 9. 23..
 */
public class BoardSpec {

    public static Specification<Board> boardType(final BoardType boardType) {

        return new Specification<Board>() {
            @Override
            public Predicate toPredicate(Root<Board> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                if (StringUtils.isEmpty(boardType)) return null;

                return cb.equal(root.get("boardType"),boardType);

            }
        };
    }

    public static Specification<Board> titleLike(final String keyword) {
        return new Specification<Board>() {
            @Override
            public Predicate toPredicate(Root<Board> root,
                                         CriteriaQuery<?> query, CriteriaBuilder cb) {
                return cb.like(root.get("title"), "%" + keyword + "%");
            }
        };
    }

    public static Specification<Board> titleOrBoardDesc(String searchTerm) {
        return (root, query, cb) -> {
            String containsLikePattern = getContainsLikePattern(searchTerm);
            return cb.or(
                    cb.like(cb.lower(root.<String>get("title")), containsLikePattern),
                    cb.like(cb.lower(root.<String>get("boardDesc")), containsLikePattern)
            );
        };
    }

    private static String getContainsLikePattern(String searchTerm) {
        if (searchTerm == null || searchTerm.isEmpty()) {
            return "%";
        }
        else {
            return "%" + searchTerm.toLowerCase() + "%";
        }
    }
}
