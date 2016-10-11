package it.flame.coding.service.dto;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by dskim on 2016. 9. 27..
 */
@Getter
@Setter
public class CommentDTO {

    private Long id;

    //코멘트 내용
    private String commentDesc;

    //좋아요
    private Integer likeCount;

    private UserDTO userDTO;

}
