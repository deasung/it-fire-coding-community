<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        $('#tags').tagsInput({
            'defaultText':'태그를 입력',
            'height':'100px',
            'width':'500px'
        });

        $("#createUserBtn").click(function(){

            //게시판 타입
            var board_type = $( "#boardType option:selected" ).val();
            //게시판 제목
            var board_title = $('input[name=title]').val();
            //게시판 내용
            var board_desc = $('#boardDesc').val();

            //1.selectbox check
            if(isEmpty(board_type)) {
                alert("게시판 글타입을 선택해주세요.");
                return false;
            }

            //2.타이틀 입력되었는지 확인
            if(isEmpty(board_title)) {
                alert("게시판 제목을 입력해주세요.");
                $('input[name=title]').focus();
                return false;
            }

            //3.내용이 입력되었는지 확인
            if(isEmpty(board_desc)) {
                alert("게시판 내용을 입력해주세요.");
                $('#boardDesc').focus();
                return false;
            }

            var boardTypeName = null;

            switch (board_type) {
                case "STUDY" : boardTypeName = "스터디"; break
                case "QA" : boardTypeName = "Q&A"; break
                case "DEFAULT" : boardTypeName = "자유게시판"; break
            }

            var board = {
                "boardType" : board_type,
                "title" : board_title,
                "boardDesc" : board_desc,
                //추후에 지울예정
                "createdBy" : "system",
                "tags" : ""
            };


            var total = $('div.tagsinput span.tag').length;
            $('div.tagsinput span.tag').each(function(index) {

                var text = $(this).text();
                //뒤에서 n번째 문자 제거
                var text_slice = text.slice(0,-1);
                //앞,뒤 공백제거
                var text_trim = trim(text_slice);

                if (index === total-1) {
                    // 마지막 인덱스에서 수행하는 작업
                    //board.tags += text_trim
                    board.tags += text_trim;
                } else {
                    board.tags += text_trim + ",";
                    //board.tags += text_trim + ",";
                }
            });

            if(!isEmpty(board.tags)) {
                board.tags = boardTypeName + "," + board.tags;
            } else {
                board.tags = boardTypeName;
            }



            console.dir(board);
            commonAjax.url = "/api/board/save";
            commonAjax.type = "POST";
            commonAjax.data = JSON.stringify(board);
            commonAjax.contentType = "application/json";
            commonAjax.ajaxCall(function(data) {
                console.dir(data);
                var id = data.id;

                if(!isEmpty(id)) {
                    alert("글이 입력되었습니다.");
                    location.href = "/board/" + board_type;
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
                    <h3 class="board-title">글쓰기</h3>
                    <%--<c:choose>--%>
                        <%--<c:when test="${boardType == 'STUDY'}">--%>
                            <%--<h3 class="board-title">스터디게시판 글쓰기</h3>--%>
                        <%--</c:when>--%>

                        <%--<c:when test="${boardType == 'QA'}">--%>
                            <%--<h3 class="board-title">Q&A게시판 글쓰기</h3>--%>
                        <%--</c:when>--%>

                        <%--<c:otherwise>--%>
                            <%--<h3 class="board-title">자유게시판 글쓰기</h3>--%>
                        <%--</c:otherwise>--%>

                    <%--</c:choose>--%>



                    <form id="boardCreateForm" class="form-signup form-user panel-body" name="form" role="form" method="post">

                        <fieldset>

                            <select id="boardType">
                                <option value="">게시판 글타입을 선택해주세요.</option>
                                <option value="STUDY">스터디</option>
                                <option value="QA">Q&A</option>
                                <option value="DEFAULT">자유게시판</option>
                            </select>

                            <h4>제목을 적어주세요.</h4>
                            <input type="text" id="title" name="title" class="form-control input-sm" required="" placeholder="제목" style="width: 422px;">

                            <h4>내용을 적어주세요.</h4>
                            <textarea id="boardDesc" name="boardDesc"></textarea>

                            <h4>TAG를 입력하세요.</h4>
                            <input name="tags" id="tags"/>



                        </fieldset>

                        <button id="createUserBtn" class="btn btn-primary btn-block" type="button" style="width: 100px; margin-top: 10px;">글쓰기</button>

                    </form>

                </div>
            </div>



            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>

    </div>

</body>

</html>