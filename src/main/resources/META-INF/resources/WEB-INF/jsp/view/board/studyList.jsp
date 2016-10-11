<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/include.jsp"></jsp:include>
</head>

<script>

    $(document).ready(function(){

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
<div class="outer">

    <jsp:include page="../common/sidebar.jsp"/>

    <!-- Mainbar starts -->
    <div class="mainbar">

        <jsp:include page="../common/header.jsp">
            <jsp:param name="login" value="${login}" />
        </jsp:include>
        <div class="main-content">
            <div class="container">

                <div class="page-content">

                    <!-- Heading -->
                    <div class="single-head">
                        <!-- Heading -->
                        <h3 class="pull-left"><i class="fa fa-picture-o red"></i>스터디 모집</h3>
                        <!-- Bread crumbs -->
                        <div class="breads pull-right">
                            <input type="button" id="boardWriteBtn" class="btn btn-danger submit" value="스터디모집"></input>
                            <%--<strong>Nav</strong> : <a href="#">Home</a> / <a href="#">Sign</a> / Home--%>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <!-- Gallery page -->
                    <div class="page-gallery">
                        <div id="gallery">
                            <!-- Each element -->
                            <div class="element">
                                <!-- Gallery image -->
                                <a href="img/portfolio/1.jpg" class="prettyphoto">
                                    <img src="${pageContext.request.contextPath}/img/portfolio/tn1.jpg" class="img-responsive" alt=""/>
                                </a>
                                <!-- Gallery caption -->
                                <div class="gall-caption">
                                    <ul class="list-unstyled">
                                        <li><strong>스터디명:</strong> 갤포스2기</li>
                                        <li><strong>스터디시작일:</strong> 2016-10-15</li>
                                        <li><strong>스터디종료일:</strong> 2016-11-15</li>
                                        <li><strong>모집기간:</strong> 2016-10-10 ~ 2016-10-14</li>
                                        <li><strong>인원:</strong> 10명</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Each element -->
                            <div class="element">
                                <!-- Gallery image -->
                                <a href="img/portfolio/2.jpg" class="prettyphoto">
                                    <img src="${pageContext.request.contextPath}/img/portfolio/tn2.jpg" class="img-responsive" alt=""/>
                                </a>
                                <!-- Gallery caption -->
                                <div class="gall-caption">
                                    <ul class="list-unstyled">
                                        <li><strong>스터디명:</strong> 갤포스2기</li>
                                        <li><strong>스터디시작일:</strong> 2016-10-15</li>
                                        <li><strong>스터디종료일:</strong> 2016-11-15</li>
                                        <li><strong>모집기간:</strong> 2016-10-10 ~ 2016-10-14</li>
                                        <li><strong>인원:</strong> 10명</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Each element -->
                            <div class="element">
                                <!-- Gallery image -->
                                <a href="img/portfolio/3.jpg" class="prettyphoto">
                                    <img src="${pageContext.request.contextPath}/img/portfolio/tn3.jpg" class="img-responsive" alt=""/>
                                </a>
                                <!-- Gallery caption -->
                                <div class="gall-caption">
                                    <ul class="list-unstyled">
                                        <li><strong>스터디명:</strong> 갤포스2기</li>
                                        <li><strong>스터디시작일:</strong> 2016-10-15</li>
                                        <li><strong>스터디종료일:</strong> 2016-11-15</li>
                                        <li><strong>모집기간:</strong> 2016-10-10 ~ 2016-10-14</li>
                                        <li><strong>인원:</strong> 10명</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Each element -->
                            <div class="element">
                                <!-- Gallery image -->
                                <a href="img/portfolio/4.jpg" class="prettyphoto">
                                    <img src="${pageContext.request.contextPath}/img/portfolio/tn4.jpg" class="img-responsive" alt=""/>
                                </a>
                                <!-- Gallery caption -->
                                <div class="gall-caption">
                                    <ul class="list-unstyled">
                                        <li><strong>스터디명:</strong> 갤포스2기</li>
                                        <li><strong>스터디시작일:</strong> 2016-10-15</li>
                                        <li><strong>스터디종료일:</strong> 2016-11-15</li>
                                        <li><strong>모집기간:</strong> 2016-10-10 ~ 2016-10-14</li>
                                        <li><strong>인원:</strong> 10명</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Each element -->
                            <div class="element">
                                <!-- Gallery image -->
                                <a href="img/portfolio/5.jpg" class="prettyphoto">
                                    <img src="${pageContext.request.contextPath}/img/portfolio/tn5.jpg" class="img-responsive" alt=""/>
                                </a>
                                <!-- Gallery caption -->
                                <div class="gall-caption">
                                    <ul class="list-unstyled">
                                        <li><strong>스터디명:</strong> 갤포스2기</li>
                                        <li><strong>스터디시작일:</strong> 2016-10-15</li>
                                        <li><strong>스터디종료일:</strong> 2016-11-15</li>
                                        <li><strong>모집기간:</strong> 2016-10-10 ~ 2016-10-14</li>
                                        <li><strong>인원:</strong> 10명</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Each element -->
                            <div class="element">
                                <!-- Gallery image -->
                                <a href="img/portfolio/6.jpg" class="prettyphoto">
                                    <img src="${pageContext.request.contextPath}/img/portfolio/tn6.jpg" class="img-responsive" alt=""/>
                                </a>
                                <!-- Gallery caption -->
                                <div class="gall-caption">
                                    <ul class="list-unstyled">
                                        <li><strong>스터디명:</strong> 갤포스2기</li>
                                        <li><strong>스터디시작일:</strong> 2016-10-15</li>
                                        <li><strong>스터디종료일:</strong> 2016-11-15</li>
                                        <li><strong>모집기간:</strong> 2016-10-10 ~ 2016-10-14</li>
                                        <li><strong>인원:</strong> 10명</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Each element -->
                            <div class="element">
                                <!-- Gallery image -->
                                <a href="img/portfolio/7.jpg" class="prettyphoto">
                                    <img src="${pageContext.request.contextPath}/img/portfolio/tn7.jpg" class="img-responsive" alt=""/>
                                </a>
                                <!-- Gallery caption -->
                                <div class="gall-caption">
                                    <ul class="list-unstyled">
                                        <li><strong>스터디명:</strong> 갤포스2기</li>
                                        <li><strong>스터디시작일:</strong> 2016-10-15</li>
                                        <li><strong>스터디종료일:</strong> 2016-11-15</li>
                                        <li><strong>모집기간:</strong> 2016-10-10 ~ 2016-10-14</li>
                                        <li><strong>인원:</strong> 10명</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Each element -->
                            <div class="element">
                                <!-- Gallery image -->
                                <a href="img/portfolio/8.jpg" class="prettyphoto">
                                    <img src="${pageContext.request.contextPath}/img/portfolio/tn8.jpg" class="img-responsive" alt=""/>
                                </a>
                                <!-- Gallery caption -->
                                <div class="gall-caption">
                                    <ul class="list-unstyled">
                                        <li><strong>스터디명:</strong> 갤포스2기</li>
                                        <li><strong>스터디시작일:</strong> 2016-10-15</li>
                                        <li><strong>스터디종료일:</strong> 2016-11-15</li>
                                        <li><strong>모집기간:</strong> 2016-10-10 ~ 2016-10-14</li>
                                        <li><strong>인원:</strong> 10명</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div style="text-align: center;">
                            <!-- Pagination -->
                            <ul class="pagination pagination-sm">
                                <li><a href="#">&laquo;</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                            <div class="clearfix"></div>
                            <hr /><!-- Horizontal Line -->

                        </div>


                    </div> <!-- Gallery page end -->




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

        $(document).ready(function() {
            $('#data-table').dataTable({
                "sPaginationType": "full_numbers"
            });
        });

    });


</script>



</body>
</html>