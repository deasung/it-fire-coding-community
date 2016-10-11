package it.flame.coding.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

/**
 * Created by dskim on 2016. 10. 10..
 */
@Entity
@Table(name = "s3_bucket_info")
@Getter
@Setter
public class S3bucketFileInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "s3_bucket_info_id")
    private Long id;

    private String bucketName;

    private String keyName;

    private long size;

    private String fileType;

    private String fileUrl;

    @ManyToOne
    @JsonBackReference
    private Board board;

}
