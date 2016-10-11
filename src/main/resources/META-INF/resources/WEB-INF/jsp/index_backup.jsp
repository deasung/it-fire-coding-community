<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="./../jsp/view_backup/common/header.jsp"></jsp:include>
</head>

<!-- Initialize Swiper -->
<script>
    $(document).ready(function(){
        var swiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            paginationClickable: true,
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: 2500,
            autoplayDisableOnInteraction: false
        });

    });

</script>

<body>
<div class="container">
    <!-- 사이드바 -->
    <jsp:include page="./../jsp/view_backup/common/sidebar.jsp">
        <jsp:param name="login" value="${login}" />
    </jsp:include>

    <div class="content-wrap">

        <div class="content-main">

            <div class="panel">


                <div class="panel-swiper">

                    <c:choose>

                        <c:when test="${fn:length(studyBoardList) > 0}">

                            <!-- Swiper -->
                            <div class="swiper-container">
                                <div class="swiper-wrapper">

                                    <c:forEach var="studyBoard" items="${studyBoardList}">
                                        <div class="swiper-slide">${studyBoard.title}</div>
                                    </c:forEach>
                                </div>
                                <!-- Add Pagination -->
                                <div class="swiper-pagination"></div>
                                <!-- Add Arrows -->
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            </div>

                        </c:when>

                        <c:otherwise>
                            <h1>등록되어 있는 스터디가 없습니다</h1>
                        </c:otherwise>

                    </c:choose>
                </div>


                <div class="panel-home-wrap">
                    <div class="home-sub-wrap">
                        <h2>스터디 모집</h2>
                        <ul>
                            <c:if test="${fn:length(studyBoardList) > 0}">
                                <c:forEach var="studyBoard" items="${studyBoardList}">
                                    <li>
                                        <a href="/board/${studyBoard.boardType}/detail/${studyBoard.id}" style="color: black;">
                                            <div class="main">
                                                <div class="left-div">
                                                    <h1>${studyBoard.title}</h1>
                                                </div>
                                                <div class="right-div">
                                                    <div class="name">
                                                        <h1>${studyBoard.user.login}님</h1>
                                                    </div>
                                                    <div class="date">
                                                        <h1>
                                                            <fmt:formatDate value="${studyBoard.createDate}" pattern="yyyy-MM-dd" var="thisYmd"/>
                                                                ${thisYmd}
                                                        </h1>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>

                                    </li>
                                </c:forEach>
                            </c:if>

                        </ul>
                    </div>

                    <div class="home-sub-wrap">
                        <h2>Q & A</h2>
                        <ul>
                            <c:if test="${fn:length(qaBoardList) > 0}">
                                <c:forEach var="qaBoard" items="${qaBoardList}">
                                    <li>
                                        <a href="/board/${qaBoard.boardType}/detail/${qaBoard.id}" style="color: black;">
                                            <div class="main">
                                                <div class="left-div">
                                                    <h1>${qaBoard.title}</h1>
                                                </div>
                                                <div class="right-div">
                                                    <div class="name">
                                                        <h1>${qaBoard.user.login}님</h1>
                                                    </div>
                                                    <div class="date">
                                                        <h1>
                                                            <fmt:formatDate value="${qaBoard.createDate}" pattern="yyyy-MM-dd" var="thisYmd"/>
                                                                ${thisYmd}
                                                        </h1>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </c:forEach>
                            </c:if>

                        </ul>
                    </div>

                    <div class="home-sub-wrap">
                        <h2>자유 게시판</h2>
                        <ul>
                            <c:if test="${fn:length(defaultBoardList) > 0}">
                                <c:forEach var="defaultBoard" items="${defaultBoardList}">
                                    <li>
                                        <a href="/board/${defaultBoard.boardType}/detail/${defaultBoard.id}" style="color: black;">
                                            <div class="main">
                                                <div class="left-div">
                                                    <h1>${defaultBoard.title}</h1>
                                                </div>
                                                <div class="right-div">
                                                    <div class="name">
                                                        <h1>${defaultBoard.user.login}님</h1>
                                                    </div>
                                                    <div class="date">
                                                        <h1>
                                                            <fmt:formatDate value="${defaultBoard.createDate}" pattern="yyyy-MM-dd" var="thisYmd"/>
                                                                ${thisYmd}
                                                        </h1>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </c:forEach>
                            </c:if>

                        </ul>

                    </div>

                </div>


            </div>


        </div>

        <!-- 푸터 -->
        <jsp:include page="./../jsp/view_backup/common/footer.jsp"></jsp:include>
    </div>

</div>


</body>

</html>