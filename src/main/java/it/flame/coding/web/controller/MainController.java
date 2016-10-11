package it.flame.coding.web.controller;


import it.flame.coding.domain.Board;
import it.flame.coding.domain.BoardType;
import it.flame.coding.service.BoardService;
import it.flame.coding.service.util.PageUtil;
import it.flame.coding.web.controller.component.session.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by dskim on 2016. 9. 18..
 */
@Controller
public class MainController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private SessionUtils sessionUtils;

    private final String SORT_VARIABLE = "lastModifiedBy";

    @RequestMapping("/")
    public String index(Model model) {


        model.addAttribute("login",sessionUtils.getSessionCurrentLogin());

        Page<Board> boardStudyResult = boardService.list(BoardType.STUDY.toString(),null,1,5,SORT_VARIABLE);

        Page<Board> boardQaResult = boardService.list(BoardType.QA.toString(),null,1,5,SORT_VARIABLE);

        Page<Board> boardDefaultResult = boardService.list(BoardType.DEFAULT.toString(),null,1,5,SORT_VARIABLE);

        List<Board> studyBoardList = boardStudyResult.getContent();

        List<Board> qaBoardList = boardQaResult.getContent();

        List<Board> defaultBoardList = boardDefaultResult.getContent();

        model.addAttribute("studyBoardList",studyBoardList);

        model.addAttribute("qaBoardList",qaBoardList);

        model.addAttribute("defaultBoardList",defaultBoardList);


        return "index";
    }
}
