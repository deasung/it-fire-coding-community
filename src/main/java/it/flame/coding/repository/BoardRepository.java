package it.flame.coding.repository;

import it.flame.coding.domain.Board;


import it.flame.coding.domain.BoardType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


/**
 * Created by dskim on 2016. 8. 31..
 */
@Repository
public interface BoardRepository extends JpaRepository<Board, Long>  {

    @Query(value = "select b from Board b where b.boardType = :boardType")
    Page<Board> findAll(@Param("boardType") BoardType boardType, Pageable pageable);

    Page<Board> findAll(Specification specification,Pageable pageable);


}
