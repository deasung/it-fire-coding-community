package it.flame.coding.web.controller.board;

import it.flame.coding.domain.Board;
import it.flame.coding.domain.Comment;
import it.flame.coding.service.BoardService;
import it.flame.coding.service.dto.CommentDTO;
import it.flame.coding.service.dto.UserDTO;
import it.flame.coding.web.controller.component.paging.Paging;
import it.flame.coding.web.controller.component.paging.PagingUtils;
import it.flame.coding.web.controller.component.session.SessionUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.ArrayList;
import java.util.List;


/**
 * Created by dskim on 2016. 9. 22..
 */
@Controller
public class BoardController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BoardService boardService;

    @Autowired
    private SessionUtils sessionUtils;

    @Autowired
    PagingUtils pagingUtils;

    /**
     * 게시판 타입별 리스트
     * @param boardType
     * @param pageNumber
     * @param sortVariable
     * @param model
     * @return
     */
    @RequestMapping(value = "/board/{boardType}", method = RequestMethod.GET)
    public String board(@PathVariable String boardType,
                        @RequestParam(value = "page", required = false) Integer pageNumber,
                        @RequestParam(value = "keyword", required = false) String keyword,
                        @RequestParam(value = "sortVariable", required = false) String sortVariable,
                        Model model) {

        logger.debug("boardType >>>> :"+boardType);

        String view = "view/board/list";

        model.addAttribute("login",sessionUtils.getSessionCurrentLogin());

        model.addAttribute("boardType",boardType);

        if(boardType.equals("STUDY")) {
            view = "view/board/studyList";
        }

        Page<Board> result = boardService.list(boardType,keyword,pageNumber,10,sortVariable);

        List<Board> boardList = result.getContent();
        //List<Board> boardList = boardService.list(boardType,pageNumber).getContent();
        Paging paging = pagingUtils.setPaging(result);

        model.addAttribute("boardList",boardList);
        model.addAttribute("paging",paging);



        return view;
    }


    /**
     * 게시판 타입별 글쓰기
     * @param boardType
     * @param model
     * @return
     */
    @RequestMapping("/board/{boardType}/write")
    public String write(@PathVariable String boardType,Model model) {

        model.addAttribute("login",sessionUtils.getSessionCurrentLogin());

        model.addAttribute("boardType",boardType);

        return "view/board/write";
    }

    /**
     * 게시판 상세
     * @param boardType
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/board/{boardType}/detail/{id}")
    public String detail(@PathVariable String boardType,@PathVariable Long id,Model model) {

        model.addAttribute("login",sessionUtils.getSessionCurrentLogin());

        model.addAttribute("boardType",boardType);

        Board board = boardService.findId(id);

        model.addAttribute("board",board);


        List<Comment> commentList = board.getCommentList();

        List<CommentDTO> commentDTOList = new ArrayList<>();

        for (Comment comment : commentList) {

            CommentDTO commentDTO = new CommentDTO();

            UserDTO userDTO = new UserDTO();

            BeanUtils.copyProperties(comment.getUser(),userDTO);

            commentDTO.setUserDTO(userDTO);

            BeanUtils.copyProperties(comment,commentDTO);



            commentDTOList.add(commentDTO);
        }

        model.addAttribute("comments",commentDTOList);

        return "view/board/detail";
    }


}
