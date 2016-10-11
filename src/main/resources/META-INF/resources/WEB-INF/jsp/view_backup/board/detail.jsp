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

    $(document).ready(function(){

        //본문 좋아요 클릭이벤트
        $(".board-detail-cotent-wrap .right-info").click(function(){

            commonAjax.url = "/api/board/${board.id}/likeCount";
            commonAjax.type = "GET";
            commonAjax.data = null;

            commonAjax.contentType = "application/json";
            commonAjax.ajaxCall(function(data) {

                var likeCount = data.likeCount;

                if(!isEmpty(likeCount)) {
                    $("#boardLikeCnt").text(likeCount);
                }

            });

        });

        //댓글 좋아요 클릭이벤트
        $(".comment-panel .comment-main .like-panel").click(function(){

            var selector = $(this);
            console.dir(selector);
            var comment_id = $(this).attr("comment-id");
            commonAjax.url = "/api/comment/"+comment_id+"/likeCount";
            commonAjax.type = "GET";
            commonAjax.data = null;

            commonAjax.contentType = "application/json";
            commonAjax.ajaxCall(function(data) {

                var likeCount = data.likeCount;

                if(!isEmpty(likeCount)) {
                    console.dir(selector);
                    selector.find(".like-count > span > em").text(likeCount);
                }

            });

        });



        //댓글 쓰기
        $("#createCommentBtn").click(function(){

            var commentDesc = $("#commentTxt").val();

            console.log("commentDesc :"+commentDesc);

            //댓글 내용 비웠는지 확인
            if(isEmpty(commentDesc)) {
                alert("댓글 내용을 적어주세요.");
                $("#commentTxt").focus();
                return false;
            }

            var comment = {
                "board" : {
                    "id" : "${board.id}"
                },
                "commentDesc" : commentDesc
            };


            commonAjax.url = "/api/comment/save";
            commonAjax.type = "POST";
            commonAjax.data = JSON.stringify(comment);

            commonAjax.contentType = "application/json";
            commonAjax.ajaxCall(function(data) {

                console.dir(data);
                var id = data.id;

                if(!isEmpty(id)) {
                    alert("댓글이 입력되었습니다.");
                    window.location.reload();
                }

            });



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

                    <h3 class="board-title">스터디 모집</h3>


                    <div class="board-detail-wrap">

                        <!-- -->
                        <div class="board-detail-info">
                            <div class="board-detail-user">
                                <i class="fa fa-user"></i>
                                <span><em>${board.user.login}</em> 님</span>
                                <h3>${board.createDate}</h3>
                            </div>
                            <div class="board-info">
                                <i class="fa fa-thumbs-o-up"></i>
                                <!-- 좋아요 수 -->
                                <span><em id="boardLikeCnt">${board.likeCount}</em>개</span>

                                <i class="fa fa-comments"></i>
                                <!-- 댓글 수 -->
                                <span><em>${fn:length(board.commentList)}</em>개</span>

                                <i class="fa fa-eye"></i>
                                <span><em>${board.boardViewCount}</em>개</span>
                            </div>
                        </div>
                        <div class="board-detail-cotent-wrap">
                            <div class="left-info">

                                <div class="tag-wrap">
                                    <div class="left-area">
                                        <p>#<span>${board.id}</span></p>
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
                                    <p>${board.title}</p>
                                </div>

                            </div>

                            <div class="right-info">
                                <div class="right-like-wrap">
                                    <i class="fa fa-thumbs-o-up"></i>
                                    <span>좋아요</span>
                                </div>
                            </div>
                        </div>
                        <div class="board-detail-article">
                            ${board.boardDesc}
                        </div>
                    </div>

                    <div class="board-detail-comment-wrap">

                        <div class="comment-count">
                            <h3>댓글 <em>${fn:length(board.commentList)}</em> 개</h3>
                        </div>

                        <div class="comment-panel">

                            <c:forEach var="comment" items="${comments}">

                                <div class="comment-main" style="cursor: pointer;">
                                    <div class="comment">
                                        <div class="writer">${comment.userDTO.login}</div>
                                        <div class="content">
                                            ${comment.commentDesc}
                                        </div>
                                    </div>

                                    <div class="like-panel" comment-id="${comment.id}">
                                        <div class="like">
                                            <i class="fa fa-thumbs-o-up"></i>
                                            <span>좋아요</span>
                                        </div>
                                        <div class="like-count">
                                            <span><em>${comment.likeCount}</em>개</span>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>


                            <div class="comment-write">

                                <div class="comment">
                                    <div class="writer">${board.user.login}</div>
                                    <div class="content">
                                        <textarea id="commentTxt" name="commentTxt"></textarea>
                                    </div>
                                </div>

                                <div class="comment-add-panel">
                                    <div class="comment-btn">
                                        <button id="createCommentBtn" class="btn btn-primary btn-block" type="button" style="width: 100px; margin-top: 10px;">댓글쓰기</button>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>



                </div>

            </div>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>

    </div>

</body>

</html>