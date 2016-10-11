package it.flame.coding.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by dskim on 2016. 9. 13..
 */
@Entity
@Getter
@Setter
@Table(name = "it_flame_study_comment")
public class Comment extends AbstractAuditingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ManyToOne
    @JsonBackReference
    private Board board;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    //코멘트 내용
    @Column(columnDefinition="LONGTEXT")
    private String commentDesc;

    //좋아요
    private Integer likeCount;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    private Date createDate;

}
