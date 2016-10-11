<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../common/header.jsp"></jsp:include>
</head>
<script>

    //ajax 요청 시작시에 spin 시작
    $(document).ajaxSend(function() {
        spinner.start();
    });
    //ajax 요청 끝나면 spin 종료
    $(document).ajaxStop(function() {
        spinner.stop();
    });

    //.board-search-wrap ul > li
    $(document).ready(function(){

        $(".board-search-wrap ul > li > a").click(function(){

            var boardType = "${boardType}";
            var sortVariable = $(this).attr("orderType");

            location.href = "/board/" + boardType + "?page=1&sortVariable=" + sortVariable;

        });


        //검색 버튼 이벤트
        $("#searchBtn").click(function(){

            var boardType = "${boardType}";
            var keyword = $("#searchKeyWord").val();

            if(isEmpty(keyword)) {
                alert("검색어가 비어있습니다. 검색어를 입력한후 검색버튼 눌러주세요.");
                return false;
            }

            location.href = "/board/" + boardType + "?page=1&keyword=" + keyword;

        });


        //글쓰기 버튼이벤트
        $("#boardWriteBtn").click(function(){
            ///board/${boardType}/write

            if(loginCheck() != false) {
                location.href = "/board/${boardType}/write";
            } else {
                alert("로그인하셔야 글을 쓸수 있습니다.");
                return false;
            }
        });

    });


</script>

<body>

<div class="container">

    <!-- 사이드바 -->
    <jsp:include page="../common/sidebar.jsp">
        <jsp:param name="login" value="${login}" />
    </jsp:include>

    <div class="content-wrap">

        <div class="content-main">

            <div class="panel">

                <div class="panel-board-wrap">

                    <c:choose>
                        <c:when test="${boardType == 'STUDY'}">
                            <h3 class="board-title">스터디 모집</h3>
                        </c:when>

                        <c:when test="${boardType == 'QA'}">
                            <h3 class="board-title">Q&A</h3>
                        </c:when>

                        <c:otherwise>
                            <h3 class="board-title">자유게시판</h3>
                        </c:otherwise>

                    </c:choose>

                    <div class="board-nav-wrap">

                        <div class="board-search-wrap" style="float: left;">
                            <ul>
                                <li><a href="javascript:;" style="color: black;" orderType="lastModifiedBy">최신순</a></li>
                                <li><a href="javascript:;" style="color: black;" orderType="likeCount">추천순</a></li>
                                <li><a href="javascript:;" style="color: black;" orderType="commentCount">댓글순</a></li>
                                <li><a href="javascript:;" style="color: black;" orderType="boardViewCount">조회순</a></li>
                            </ul>
                        </div>

                        <div class="board-search-input-wrap">

                            <div class="left-wrap">
                                <div class="input-group input-group-sm" style="padding: 5px;">
                                    <input type="search" name="query" id="searchKeyWord"class="form-control" placeholder="검색어" value="">
                                <span class="input-group-btn">
                                    <button type="button" id="searchBtn" class="btn btn-default"><i class="fa fa-search"></i></button>

                                </span>
                                </div>
                            </div>

                            <div class="right-wrap">
                                <a href="javascript:;" id="boardWriteBtn" class="create btn btn-success btn-wide pull-right" style="margin-top: 3px;">
                                    <i class="fa fa-pencil"></i> 글 쓰기
                                </a>
                            </div>

                        </div>


                    </div>

                    <div class="board-content-wrap">

                        <div class="board-table-wrap">

                            <table class="board-table">
                                <colgroup>
                                    <col width="50%">
                                    <col width="10%">
                                    <col width="10%">
                                    <col width="10%">
                                    <col width="10%">
                                    <col width="10%">
                                </colgroup>

                                <thead>
                                <th>제목</th>
                                <th>좋아요</th>
                                <th>댓글수</th>
                                <th>작성자</th>
                                <th>조회수</th>
                                <th>날짜</th>
                                </thead>

                                <tbody>

                                <c:choose>

                                    <c:when test="${fn:length(boardList) > 0}">

                                        <c:forEach var="board" items="${boardList}" varStatus="boardStatus">

                                            <tr>
                                                <td>
                                                    <div class="tag-wrap">
                                                        <div class="left-area">
                                                            <p style="color: #9d9d9d; margin: 0;padding: 5px;">#<span>${board.id}</span></p>
                                                        </div>
                                                        <div class="right-area">
                                                            <c:set var="tags_array" value="${fn:split(board.tags,',')}"/>

                                                            <c:forEach var="tags" items="${tags_array}" varStatus="status">
                                                                <c:if test="${status.first }">
                                                                    <a href="javascript:;" class="list-group-item-text item-tag label label-info"><i class="fa fa-users"></i> ${tags }</a>
                                                                </c:if>
                                                                <c:if test="${not status.first }">
                                                                    <a href="javascript:;" class="list-group-item-text item-tag label label-gray">${tags }</a>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="title-wrap">
                                                        <a href="/board/${boardType}/detail/${board.id}" style="color:black;">${board.title}</a>
                                                    </div>

                                                </td>

                                                <!-- 좋아요 수 -->
                                                <td>
                                                    <i class="fa fa-thumbs-o-up"></i>
                                                    <span><em>${board.likeCount}</em>개</span>
                                                </td>
                                                <!-- 댓글 수 -->
                                                <td>
                                                    <i class="fa fa-comments"></i>
                                                    <span><em>${fn:length(board.commentList)} </em>개</span>
                                                </td>
                                                <!-- 작성 자 -->
                                                <td>
                                                    <em>${board.user.login}</em>
                                                </td>
                                                <!-- 조회 수 -->
                                                <td>
                                                    <i class="fa fa-eye"></i>
                                                    <span><em>${board.boardViewCount}</em>개</span>
                                                </td>
                                                <td>
                                                    <em>
                                                            <%--${board.lastModifiedDate}--%>
                                                        <fmt:formatDate value="${board.createDate}" pattern="yyyy-MM-dd hh:mm:ss" var="thisYmd"/>
                                                            ${thisYmd}
                                                    </em>
                                                </td>
                                            </tr>

                                        </c:forEach>

                                    </c:when>

                                    <c:otherwise>

                                        <tr>
                                            <td colspan="6">글이 없습니다.</td>
                                        </tr>

                                    </c:otherwise>


                                </c:choose>




                                </tbody>
                            </table>
                        </div>

                    </div>

                    <!-- 페이징 -->
                    <jsp:include page="../board/paging.jsp">
                        <jsp:param name="boardType" value="${boardType}" />
                        <jsp:param name="totalCount" value="${paging.totalCount}" />
                        <jsp:param name="currentIndex" value="${paging.currentIndex}" />
                        <jsp:param name="totalIndexCount" value="${paging.totalIndexCount}" />
                        <jsp:param name="first" value="${paging.first}" />
                        <jsp:param name="last" value="${paging.last}" />
                        <jsp:param name="prev" value="${paging.prev}" />
                        <jsp:param name="next" value="${paging.next}" />
                    </jsp:include>

                </div>
            </div>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>

    </div>

</body>

</html>