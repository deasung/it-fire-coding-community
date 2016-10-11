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

        $("#createUserBtn").click(function(e){
            e.preventDefault();

            var login = $("#login").val();
            var password = $('input[name=password]').val();
            var email = $("#email").val();
            var nickName = $("#nickname").val();

            //로그인 체크
            if(isEmpty(login)) {
                alert("로그인명을 적어주세요.");
                $("#login").focus();
                return false;
            }

            //패스워드 체크
            if(isEmpty(password)) {
                alert("패스워드가 비어있습니다.입력해주세요.");
                $('input[name=password]').focus();
                return false;
            }

            //이메일 체크
            if(isEmpty(email)) {
                alert("이메일이 비어있습니다.입력해주세요.");
                $("#email").focus();
                return false;
            }

            //닉네임 체크
            if(isEmpty(nickName)) {
                alert("닉네임이 비어있습니다.입력해주세요.");
                $("#nickname").focus();
                return false;
            }

            var user = {
                "login" : login,
                "password" : password,
                "email" : email,
                "nickName" : nickName
            }

            console.dir(user);
            commonAjax.url = "/api/user/create";
            commonAjax.type = "POST";
            commonAjax.data = JSON.stringify(user);
            commonAjax.contentType = "application/json";
            commonAjax.ajaxDefaultCall(function(data) {

                var id = data.id;

                if(isEmpty(id) != true) {
                    alert("회원가입이 되셨습니다. 로그인페이지로 가셔서 로그인해주세요");
                    location.href = "/login";
                    return false;
                } else {
                    alert("회원가입에 실패하셨습니다");
                    return false;
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

                <div class="register-page-wrap">

                    <h3>회원가입</h3>

                    <div class="register-page-form-wrap">

                        <div class="register-page-panel">
                            <h4>이메일 가입하기</h4>
                        </div>

                        <form id="createForm" class="form-signup form-user panel-body" name="form" role="form" method="post" action="/api/user/create" onSubmit="return false;">

                            <fieldset>

                                <input type="text" name="login" class="form-control input-sm" required="" placeholder="아이디" id="login">

                                <input type="password" id="password" name="password" class="form-control input-sm" placeholder="비밀번호">

                                <input type="email" class="form-control input-sm" placeholder="이메일" id="email" name="email" required>

                                <input type="text" id="nickname" name="nickname" class="form-control input-sm" placeholder="닉네임">

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="dmAllowed" value="true" checked="checked"> 이메일 수신 동의
                                    </label>
                                </div>
                            </fieldset>

                            <button id="createUserBtn" class="btn btn-primary btn-block" type="button">아래 약관을 동의하며 회원 가입</button>

                            <div class="signup-block">
                                <a href="javascript:preparing();" data-toggle="modal" data-target="#userAgreement">회원가입약관</a> <span class="inline-saperator">/</span> <a href="javascript:preparing();" data-toggle="modal" data-target="#userPrivacy">개인정보취급방침</a>
                            </div>
                        </form>

                    </div>

                </div>

            </div>

        <!-- 푸터 -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>

</div>

</body>

</html>