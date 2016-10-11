package it.flame.coding.service;

import it.flame.coding.domain.Board;
import it.flame.coding.domain.Comment;
import it.flame.coding.domain.User;
import it.flame.coding.repository.BoardRepository;
import it.flame.coding.repository.CommentRepository;
import it.flame.coding.repository.UserRepository;
import it.flame.coding.security.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

/**
 * Created by dskim on 2016. 9. 27..
 */
@Service
@Transactional
public class CommentService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private CommentRepository commentRepository;

    private Logger logger = LoggerFactory.getLogger(this.getClass());


    public Comment save(Comment comment) {

        User user = userRepository.findOneByLogin(SecurityUtils.getCurrentUserLogin()).get();

        Comment result = null;

        //로그인한 유저이면
        if(ObjectUtils.isEmpty(user) != true) {

            //보드 아이디
            Board board = boardRepository.findOne(comment.getBoard().getId());

            Integer currentBoardCommentCount = board.getCommentCount();

            board.setCommentCount(++currentBoardCommentCount);

            comment.setLikeCount(0);
            comment.setBoard(board);
            comment.setUser(user);
            comment.setCreatedBy(user.getLogin());

            result = commentRepository.save(comment);
        }

        return result;
    }


    public Comment likeCountUp(Long id) {

        Comment comment = commentRepository.findOne(id);

        if(ObjectUtils.isEmpty(comment) != true) {

            Integer currentLikeCount = comment.getLikeCount();

            ++currentLikeCount;

            comment.setLikeCount(currentLikeCount);

        }

        return comment;
    }

}
