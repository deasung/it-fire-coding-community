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
                        <h3 class="pull-left"><i class="fa fa-credit-card red"></i>글쓰기</h3>
                        <!-- Bread crumbs -->
                        <%--<div class="breads pull-right">--%>
                            <%--<strong>Nav</strong> : <a href="#">Home</a> / <a href="#">Sign</a> / Home--%>
                        <%--</div>--%>
                        <div class="clearfix"></div>
                    </div>

                    <!-- Form page -->
                    <div class="page-form validate-form">
                        <form id="signupForm" class="form-horizontal" role="form" method="post" action="">

                            <div class="form-group">
                                <label for="location" class="control-label col-lg-3">게시판타입</label>
                                <div class="col-lg-9">
                                    <select id="location" name="location" class="form-control">
                                        <option value="">------------------</option>
                                        <option value="ind">스터디모집</option>
                                        <option value="usa">Q&A</option>
                                        <option value="rus">자유게시판</option>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="title" class="control-label col-lg-3">제목</label>
                                <div class="col-lg-9">
                                    <input id="title" name="title" class="form-control" type="text" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="control-label col-lg-3">인원</label>
                                <div class="col-lg-9">
                                    <input id="lastname" name="lastname" class="form-control" type="text" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="boardDesc" class="control-label col-lg-3">내용</label>
                                <div class="col-lg-9">
                                    <textarea id="boardDesc" name="boardDesc" class="form-control" rows="3" placeholder="Textarea"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputFile" class="control-label col-lg-3">파일첨부</label>
                                <div class="col-lg-9">
                                    <input type="file" id="exampleInputFile">
                                    <p class="help-block">클릭해서 파일업로드 해주세요.</p>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-9">
                                    <input type="button" class="btn btn-danger submit" value="등록"></input>
                                    <input type="reset" class="btn btn-default" Value="취소"></input>
                                </div>
                            </div>
                        </form>
                    </div> <!-- Form page end -->


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