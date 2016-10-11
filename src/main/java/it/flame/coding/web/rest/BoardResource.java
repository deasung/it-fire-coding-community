package it.flame.coding.web.rest;

import it.flame.coding.domain.Board;
import it.flame.coding.domain.BoardType;
import it.flame.coding.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

/**
 * Created by dskim on 2016. 9. 13..
 */
@RestController
@RequestMapping("/api")
public class BoardResource {


    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "/board/save", method = RequestMethod.POST)
    public Board save(@RequestBody Board board) {
        return boardService.save(board);
    }

    @RequestMapping(value = "/board/{boardType}", method = RequestMethod.GET)
    public Page<Board> list(@PathVariable String boardType,
                            @RequestParam(value = "page", required = false) Integer pageNumber,
                            @RequestParam(value = "keyword", required = false) String keyword,
                            @RequestParam(value = "pageSize", required = false) Integer pageSize,
                            @RequestParam(value = "sortVariable", required = false) String sortVariable) {
        return boardService.list(boardType,keyword,pageNumber,pageSize,sortVariable);
    }

    @RequestMapping(value = "/board/{id}/likeCount", method = RequestMethod.GET)
    public Board likeCount(@PathVariable Long id) {
        return boardService.likeCountUp(id);
    }

}
