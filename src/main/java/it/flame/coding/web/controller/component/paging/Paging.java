package it.flame.coding.web.controller.component.paging;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by dskim on 2016. 9. 23..
 */
@Getter
@Setter
public class Paging {

    //총 레코드 갯수
    private int totalCount;

    //현재페이지 인덱스
    private int currentIndex;

    // 전체 인덱스 수
    private int totalIndexCount;

    private int first;

    private int last;

    private int prev;

    private int next;
}
