package it.flame.coding.web.rest;

import it.flame.coding.domain.Comment;
import it.flame.coding.service.CommentService;
import it.flame.coding.service.dto.CommentDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by dskim on 2016. 9. 27..
 */
@RestController
@RequestMapping("/api")
public class CommentResource {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/comment/save", method = RequestMethod.POST)
    public Comment save(@RequestBody Comment comment) {
        return commentService.save(comment);
    }

    @RequestMapping(value = "/comment/{id}/likeCount", method = RequestMethod.GET)
    public CommentDTO likeCount(@PathVariable Long id) {

        Comment comment = commentService.likeCountUp(id);

        CommentDTO commentDTO = new CommentDTO();

        BeanUtils.copyProperties(comment,commentDTO);

        return commentDTO;
    }


}
