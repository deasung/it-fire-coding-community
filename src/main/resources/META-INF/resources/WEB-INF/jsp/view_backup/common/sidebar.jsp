<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

    $(document).ready(function(){

        $(".sidebar > h1").click(function(){
            location.href = "/";
        });

    });

</script>

<div class="sidebar">
    <h1>IT 불꽃코딩</h1>

    <div class="login-wrap">

        <c:choose>
            <c:when test="${param.login != 'null'}">
                <ul id="loginInfo">
                    <li>
                        <a href="javascript:preparing('준비중입니다');" class="link">
                            <i class="fa fa-user"></i>
                            <span class="">${param.login}</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" onclick="logout();return false;" class="link">
                            <i class="fa fa-sign-out"></i>
                            <span class="">로그아웃</span>
                        </a>
                    </li>
                </ul>
            </c:when>

            <c:otherwise>
                <ul id="loginWrap">
                    <li>
                        <a href="/login" class="link">
                            <i class="fa fa-sign-in"></i>
                            <span class="">로그인</span>
                        </a>
                    </li>
                    <li>
                        <a href="/login/create" class="link">
                            <i class="fa fa-user"></i>
                            <span class="">회원가입</span>
                        </a>
                    </li>
                </ul>
            </c:otherwise>

        </c:choose>

    </div>

    <div class="sub-menu-wrap">


        <ul>
            <li>

                <a href="/board/STUDY">
                    <i class="nav-icon fa fa-users"></i>
                    <span>스터디 모집</span>

                </a>

            </li>

            <li>

                <a href="/board/QA">
                    <i class="nav-icon fa fa-question-circle-o"></i>
                    <span>Q&A</span>

                </a>

            </li>

            <li>

                <a href="/board/DEFAULT">
                    <i class="nav-icon fa fa-hand-peace-o"></i>
                    <span>자유게시판</span>

                </a>

            </li>
        </ul>




    </div>
</div>
