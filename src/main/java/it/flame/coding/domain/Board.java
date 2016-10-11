package it.flame.coding.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by dskim on 2016. 8. 31..
 */
@Entity
@Getter
@Setter
@Table(name = "it_flame_study_board")
public class Board extends AbstractAuditingEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    //게시판타입
    @NotNull
    @Enumerated(EnumType.STRING)
    private BoardType boardType;

    //제목
    @NotNull
    private String title;

    //인원
    private Integer personnelCnt;

    //내용
    @NotNull
    @Column(columnDefinition="LONGTEXT")
    private String boardDesc;

    //태그
    private String tags;

    //좋아요
    private Integer likeCount;

    //글카운트
    private Integer boardViewCount;

    //댓글 리스트
    @OneToMany(mappedBy = "board", cascade = {CascadeType.ALL})
    private List<Comment> commentList;

    //댓글 카운트
    private Integer commentCount;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    private String userName;

    private Date createDate;

    @OneToMany(mappedBy = "board", cascade = {CascadeType.ALL})
    private List<S3bucketFileInfo> s3bucketFileInfo;

    //시작일자
    //@NotNull
    //private ZonedDateTime studyDate;

    //종료일자
    //@NotNull
    //private ZonedDateTime endStudyDate;

}
