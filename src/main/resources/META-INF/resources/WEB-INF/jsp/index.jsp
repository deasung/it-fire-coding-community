<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="./../jsp/view/common/include.jsp"></jsp:include>
</head>

<body>

<div class="outer">

    <jsp:include page="./../jsp/view/common/sidebar.jsp"/>

    <!-- Mainbar starts -->
    <div class="mainbar">

        <jsp:include page="./../jsp/view/common/header.jsp"/>

        <div class="main-content">
            <div class="container">

                <div class="page-content">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="widget pages-widget">

                                <div class="widget-head br-red">
                                    <h3><i class="fa fa-file"></i> 스터디 모집합니다!</h3>
                                </div>

                                <div class="widget-body no-padd">

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
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">

                        <div class="col-md-4">
                            <!-- Pages widget -->
                            <div class="widget pages-widget">

                                <div class="widget-head br-red">
                                    <h3><i class="fa fa-file"></i> 스터디 모집</h3>
                                </div>

                                <div class="widget-body no-padd">

                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <!-- Table heading -->
                                            <tr>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>날짜</th>
                                            </tr>

                                            <c:if test="${fn:length(studyBoardList) > 0}">
                                                <c:forEach var="studyBoard" items="${studyBoardList}">
                                                    <tr>
                                                        <!-- Page name -->
                                                        <td><a href="#">${studyBoard.title}</a></td>
                                                        <!-- Page size -->
                                                        <td>${studyBoard.user.login}</td>
                                                        <!-- Status -->
                                                        <td>
                                                            <fmt:formatDate value="${studyBoard.createDate}" pattern="yyyy-MM-dd" var="thisYmd"/>
                                                                ${thisYmd}
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-4">
                            <!-- Pages widget -->
                            <div class="widget pages-widget">

                                <div class="widget-head br-red">
                                    <h3><i class="fa fa-file"></i> Q&A</h3>
                                </div>

                                <div class="widget-body no-padd">

                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <!-- Table heading -->
                                            <tr>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>날짜</th>
                                            </tr>

                                            <c:if test="${fn:length(qaBoardList) > 0}">
                                                <c:forEach var="qaBoard" items="${qaBoardList}">
                                                    <tr>
                                                        <!-- Page name -->
                                                        <td><a href="#">${qaBoard.title}</a></td>
                                                        <!-- Page size -->
                                                        <td>${qaBoard.user.login}</td>
                                                        <!-- Status -->
                                                        <td>
                                                            <fmt:formatDate value="${qaBoard.createDate}" pattern="yyyy-MM-dd" var="thisYmd"/>
                                                                ${thisYmd}
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>

                                        </table>
                                    </div>

                                </div>


                            </div>

                        </div>

                        <div class="col-md-4">
                            <!-- Pages widget -->
                            <div class="widget pages-widget">

                                <div class="widget-head br-red">
                                    <h3><i class="fa fa-file"></i> 자유게시판</h3>
                                </div>

                                <div class="widget-body no-padd">

                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <!-- Table heading -->
                                            <tr>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>날짜</th>
                                            </tr>

                                            <c:if test="${fn:length(defaultBoardList) > 0}">
                                                <c:forEach var="defaultBoard" items="${defaultBoardList}">
                                                    <tr>
                                                        <!-- Page name -->
                                                        <td><a href="#">${defaultBoard.title}</a></td>
                                                        <!-- Page size -->
                                                        <td>${defaultBoard.user.login}</td>
                                                        <!-- Status -->
                                                        <td>
                                                            <fmt:formatDate value="${defaultBoard.createDate}" pattern="yyyy-MM-dd" var="thisYmd"/>
                                                                ${thisYmd}
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>

                                        </table>
                                    </div>

                                </div>


                            </div>

                        </div>
                    </div>

                </div>

            </div>
        </div>

    </div>
    <!-- Mainbar ends -->

    <div class="clearfix"></div>
</div>


<script type="text/javascript">

    $(document).ready(function(){

        //alert("call");

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



</body>
</html>