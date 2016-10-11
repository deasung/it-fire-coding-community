package it.flame.coding.web.controller.component.paging;

import it.flame.coding.domain.Board;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

/**
 * Created by dskim on 2016. 9. 23..
 */
@Component
public class PagingUtils {


    public Paging setPaging(Page<Board> result) {

        int totalCount = (int) result.getTotalElements();

        int currentIndex = result.getNumber() + 1;

        int totalIndexCount = (int) Math.ceil(totalCount / 10);

        int first = (((currentIndex) / 10) * 10) + 1;

        int last = ((totalIndexCount/10) == (currentIndex/10)) ? totalIndexCount%10 : 10;

        int prev = (((currentIndex-1)/10)*10) - 9 > 0 ? (((currentIndex-1)/10)*10) - 9 : 1;
        int next = (((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;

        Paging paging = new Paging();

        paging.setTotalCount(totalCount);
        paging.setCurrentIndex(currentIndex);
        paging.setTotalIndexCount(totalIndexCount);


        if(currentIndex%10 == 0) {
            first = first - 1;
        }

        paging.setFirst(first);
        paging.setLast(last);
        paging.setPrev(prev);
        paging.setNext(next);


        return paging;
    }

}
