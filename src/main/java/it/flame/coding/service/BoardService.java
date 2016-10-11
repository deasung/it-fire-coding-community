package it.flame.coding.service;

import it.flame.coding.domain.Board;
import it.flame.coding.domain.BoardType;
import it.flame.coding.domain.User;
import it.flame.coding.repository.BoardRepository;
import it.flame.coding.repository.UserRepository;
import it.flame.coding.repository.spec.BoardSpec;
import it.flame.coding.security.SecurityUtils;
import it.flame.coding.service.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.time.ZonedDateTime;
import java.util.Date;

/**
 * Created by dskim on 2016. 9. 13..
 */
@Service
@Transactional
public class BoardService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PageUtil pageUtil;

    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private UserRepository userRepository;


    /**
     * 게시판 저장
     * @param _board
     * @return
     */
    public Board save(Board _board) {

        User user = userRepository.findOneByLogin(SecurityUtils.getCurrentUserLogin()).get();

        _board.setCreatedBy(user.getLogin());
        _board.setUser(user);
        _board.setCommentCount(0);
        _board.setLikeCount(0);
        _board.setBoardViewCount(0);

        Board board = boardRepository.save(_board);
        ZonedDateTime utc = board.getCreatedDate();
        Date now = Date.from(utc.toInstant());
        board.setCreateDate(now);

        return board;
    }

    /**
     * 게시판 찾기
     * @param id
     * @return
     */
    public Board findId(Long id) {

        Board board = boardRepository.findOne(id);

        viewCountUp(board);

        return board;
    }


    /**
     * 게시판 리스트
     * @param type
     * @param pageNumber
     * @param sortVariable
     * @return
     */
    public Page<Board> list(String type, String keyword , Integer pageNumber, Integer pageSize, String sortVariable) {

        BoardType boardType = null;

        String properties = null;

        switch (type) {
            case "STUDY" : boardType = BoardType.STUDY;
                break;
            case "QA" : boardType = BoardType.QA;
                break;
            case "DEFAULT" : boardType = BoardType.DEFAULT;
                break;
        }

        //기본 최신순으로
        if(ObjectUtils.isEmpty(sortVariable) == true) {
            properties = "lastModifiedBy";
        } else {
            properties = sortVariable;
        }


        Specifications specifications = null;

        //검색어가 있으면
        if(ObjectUtils.isEmpty(keyword) == false) {
            specifications = Specifications.where(BoardSpec.boardType(boardType)).and(BoardSpec.titleOrBoardDesc(keyword));
        } else {
            specifications = Specifications.where(BoardSpec.boardType(boardType));
        }


        Page<Board> result = boardRepository.findAll(specifications,pageUtil.getPageRequest(pageNumber, pageSize, Sort.Direction.DESC, properties));

        return result;
    }


    /**
     * 상세 뷰카운트 증가
     * @param _board
     */
    public void viewCountUp(Board _board) {

        Board board = boardRepository.findOne(_board.getId());

        if(ObjectUtils.isEmpty(board) != true) {

            Integer currentViewCount = board.getBoardViewCount();

            ++currentViewCount;

            board.setBoardViewCount(currentViewCount);

        }
    }


    public Board likeCountUp(Long id) {

        Board board = boardRepository.findOne(id);

        if(ObjectUtils.isEmpty(board) != true) {

            Integer currentLikeCount = board.getLikeCount();

            ++currentLikeCount;

            board.setLikeCount(currentLikeCount);

        }

        return board;
    }

}
