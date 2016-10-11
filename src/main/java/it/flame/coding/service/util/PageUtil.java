package it.flame.coding.service.util;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

/**
 * <pre>
 * Class Name  : PageUtil
 * Description :
 * Modification Information
 *
 *    수정일　　　 　　   수정자　　　     수정내용
 *    ────────────   ─────────   ───────────────────────────────
 *    2016. 6. 20.   anselmkim               최초생성
 * </pre>
 *
 * @author anselmkim
 * @since 2016. 6. 20.
 */
@Component
public class PageUtil {

    /**
     * 페이징 처리 관련 pageRequest 셋팅
     * @param pageNumber
     * @param size
     * @return
     */
    public PageRequest getPageRequest(Integer pageNumber, int size) {

        if (ObjectUtils.isEmpty(pageNumber)) {
            pageNumber = 1;
        }

        PageRequest pageRequest =
                new PageRequest(pageNumber - 1, size);

        return pageRequest;
    }

    /**
     * 페이징 처리 관려 pageRequest 셋팅
     *
     * @param pageNumber 페이지 번호
     * @param size 한페이지당 리스트 개수
     * @param direction desc, asc
     * @param properties 정렬 기준
     * @return pageRequest
     */
    public PageRequest getPageRequest(Integer pageNumber,
                                      int size,
                                      Sort.Direction direction,
                                      String... properties) {

        if (ObjectUtils.isEmpty(pageNumber)) {
            pageNumber = 1;
        }

        PageRequest pageRequest =
                new PageRequest(pageNumber - 1, size, direction, properties);

        return pageRequest;
    }
}
