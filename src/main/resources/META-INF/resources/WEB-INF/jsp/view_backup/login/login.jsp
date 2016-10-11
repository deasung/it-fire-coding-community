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


        $("#loginBtn").click(function(e){

            e.preventDefault();

            var user = {
                "username" : $("#login").val(),
                "password" : $('input[name=password]').val()
            }

            console.dir(user);
            commonAjax.url = "/api/authenticate";
            commonAjax.type = "POST";
            commonAjax.data = JSON.stringify(user);
            commonAjax.contentType = "application/json";
            commonAjax.ajaxDefaultCall(function(data) {

                if (typeof(Storage) !== "undefined") {
                    // Code for localStorage/sessionStorage.
                    console.log("id_token >>>> :"+data.id_token);

                    if(typeof(data.id_token) !== "undefined") {
                        alert("로그인 되셨습니다");
                        localStorage.setItem("it-authenticationToken", data.id_token);
                        location.href = "/";
                    }

                } else {
                    alert("로컬스토리지가 지원하지 않는 브라우저입니다.크롬을 이용해주세요.");
                }


            });

        });


    });

</script>


<body>
<div id="SpinnerBox"></div>
<div class="container">

    <!-- 사이드바 -->
    <jsp:include page="../common/sidebar.jsp">
        <jsp:param name="login" value="${login}" />
    </jsp:include>

    <div class="content-wrap">

        <div class="content-main">

            <div class="panel">

                <div class="login-page-wrap">

                    <h3>로그인</h3>

                    <div class="login-page-form-wrap">

                        <div style="width: 100%; height: 44px; border-bottom: 1px solid #ddd;">
                            <h4 style="margin-left: 30px; color: #6f7275;">아이디 로그인</h4>
                        </div>

                        <form class="form-signin form-user panel-body panel-margin" role="form" method="post">

                            <input type="text" name="login" id="login" class="username form-control input-sm" placeholder="아이디">
                            <input type="password" id="password" name="password" class="password form-control input-sm" placeholder="비밀번호">
                            <%--<div class="checkbox">--%>
                                <%--<label>--%>
                                    <%--<input type="checkbox" name="remember_me" id="remember_me" ng-model="vm.rememberMe" checked> 로그인 유지--%>
                                <%--</label>--%>
                            <%--</div>--%>
                            <button id="loginBtn" class="btn btn-primary btn-block" type="button">로그인</button>
                            <div class="signup-block">
                                <a href="javascript:preparing();">계정 찾기</a> <span class="inline-saperator">/</span> <a href="/login/create">회원 가입</a>
                            </div>
                        </form>

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