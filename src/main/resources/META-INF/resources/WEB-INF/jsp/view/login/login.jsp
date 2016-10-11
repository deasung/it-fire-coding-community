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


        $("#loginBtn").click(function(e){

            e.preventDefault();

            localStorage.clear();

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
                        <h3 class="pull-left"><i class="fa fa-credit-card red"></i>로그인</h3>
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
                                <label for="login" class="control-label col-lg-3">아이디</label>
                                <div class="col-lg-9">
                                    <input id="login" name="login" class="form-control" type="text" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label col-lg-3">패스워드</label>
                                <div class="col-lg-9">
                                    <input id="password" name="password" class="form-control" type="password" />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-9">
                                    <input type="button" id="loginBtn" class="btn btn-danger submit" value="로그인"></input>
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