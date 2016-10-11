package it.flame.coding.repository;

import it.flame.coding.domain.S3bucketFileInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by dskim on 2016. 10. 10..
 */
@Repository
public interface S3bucketFileInfoRepository extends JpaRepository<S3bucketFileInfo,Long> {
}
