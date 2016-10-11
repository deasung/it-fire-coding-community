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

        $("#createUserBtn").click(function(e){
            e.preventDefault();

            var login = $("#login").val();
            var password = $('input[name=password]').val();
            var email = $("#email").val();
            var username = $("#username").val();

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
            if(isEmpty(username)) {
                alert("유저이름이 비어있습니다.입력해주세요.");
                $("#username").focus();
                return false;
            }

            var sexType = $(':radio[name="sexType"]:checked').val();

            var phone = $("#phone").val();

            var user = {
                "login" : login,
                "password" : password,
                "email" : email,
                "username" : username,
                "sexType" : sexType,
                "phone" : phone
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
                        <h3 class="pull-left"><i class="fa fa-credit-card red"></i>회원가입</h3>
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
                                <label for="login" class="control-label col-lg-3">로그인아이디</label>
                                <div class="col-lg-9">
                                    <input id="login" name="login" class="form-control" type="text" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="username" class="control-label col-lg-3">이름</label>
                                <div class="col-lg-9">
                                    <input id="username" name="username" class="form-control" type="text" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label col-lg-3">패스워드</label>
                                <div class="col-lg-9">
                                    <input id="password" name="password" class="form-control" type="password" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm_password" class="control-label col-lg-3">패스워드 재확인</label>
                                <div class="col-lg-9">
                                    <input id="confirm_password" name="confirm_password" class="form-control" type="password" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="phone" class="control-label col-lg-3">전화번호</label>
                                <div class="col-lg-9">
                                    <input id="phone" name="phone" class="form-control" type="text" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email" class="control-label col-lg-3">이메일</label>
                                <div class="col-lg-9">
                                    <input id="email" name="email" class="form-control" type="email" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">성별</label>
                                <div class="col-lg-9">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="sexType" id="optionsRadios1" value="MALE"> 남자
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="sexType" id="optionsRadios2" value="FEMALE"> 여자
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-9">
                                    <input type="button" id="createUserBtn" class="btn btn-danger submit" value="등록"></input>
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



    });


</script>



</body>
</html>