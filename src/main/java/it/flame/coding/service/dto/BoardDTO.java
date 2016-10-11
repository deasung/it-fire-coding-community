package it.flame.coding.service.dto;

import it.flame.coding.domain.BoardType;
import it.flame.coding.domain.User;

import java.util.Date;

/**
 * Created by dskim on 2016. 9. 26..
 */
public class BoardDTO {

    private Long id;

    //게시판타입

    private BoardType boardType;

    //제목
    private String title;

    //인원
    private Integer personnelCnt;

    //내용
    private String boardDesc;

    //태그
    private String tags;

    //좋아요
    private Integer likeCount;

    //글카운트
    private Integer boardViewCount;

    private UserDTO user;

    private String userName;


    private Date createDate;

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}

