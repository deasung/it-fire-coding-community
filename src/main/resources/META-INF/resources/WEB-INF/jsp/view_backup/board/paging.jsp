<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="board-paging-wrap">
    <ul class="pagination pagination-sm">
        <!--  << -->
        <c:choose>
            <c:when test="${param.totalIndexCount > 10}">
                <li class="prev"><a href="/articles/questions?offset=20&amp;max=20&amp;sort=id&amp;order=desc" class="step"><<</a>
                <li class="prev"><a href="/articles/questions?offset=20&amp;max=20&amp;sort=id&amp;order=desc" class="step"><</a></li>
            </c:when>

            <c:when test="${param.totalIndexCount <=10 && param.totalIndexCount > 1}">
                <li class="prev"><a href="/articles/questions?offset=20&amp;max=20&amp;sort=id&amp;order=desc" class="step"><<</a></li>
            </c:when>

        </c:choose>

        <c:forEach var="i" begin="${param.first}" end="${param.first+param.last}" step="1">
            <c:choose>
                <c:when test="${i != param.currentIndex}">
                    <li>
                        <a href="/board/${param.boardType}?page=${i}" class="step">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="/board/${param.boardType}?page=${i}" class="active">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!--  >> -->
        <c:choose>
            <c:when test="${param.totalIndexCount > 10}">
                <li class="next"><span> > </span></li>
                <li class="next"><span> >> </span></li>
            </c:when>

            <c:when test="${param.totalIndexCount <=10 && param.totalIndexCount > 1}">
                <li class="next"><span> >> </span></li>
            </c:when>
        </c:choose>




        <%--<li class="active"><span>1</span></li>--%>
        <%--<li><a href="/articles/questions?offset=20&amp;max=20&amp;sort=id&amp;order=desc" class="step">2</a></li>--%>
        <%--<li><a href="/articles/questions?offset=40&amp;max=20&amp;sort=id&amp;order=desc" class="step">3</a></li>--%>
        <%--<li><a href="/articles/questions?offset=60&amp;max=20&amp;sort=id&amp;order=desc" class="step">4</a></li>--%>
        <%--<li><a href="/articles/questions?offset=80&amp;max=20&amp;sort=id&amp;order=desc" class="step">5</a></li>--%>
        <%--<li><a href="/articles/questions?offset=100&amp;max=20&amp;sort=id&amp;order=desc" class="step">6</a></li>--%>
        <%--<li><a href="/articles/questions?offset=120&amp;max=20&amp;sort=id&amp;order=desc" class="step">7</a></li>--%>
        <%--<li><a href="/articles/questions?offset=140&amp;max=20&amp;sort=id&amp;order=desc" class="step">8</a></li>--%>
        <%--<li><a href="/articles/questions?offset=160&amp;max=20&amp;sort=id&amp;order=desc" class="step">9</a></li>--%>
        <%--<li><a href="/articles/questions?offset=180&amp;max=20&amp;sort=id&amp;order=desc" class="step">10</a></li>--%>
        <%--<li class="next"><a href="/articles/questions?offset=20&amp;max=20&amp;sort=id&amp;order=desc" class="step">»</a></li>--%>
    </ul>
</div>