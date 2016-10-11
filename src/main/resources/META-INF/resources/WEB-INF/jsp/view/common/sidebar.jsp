<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Sidebar starts -->
<div class="sidebar">

    <div class="sidey">

        <!-- Logo -->
        <div class="logo">
            <h1><a href="index.html"><i class="fa fa-desktop br-red"></i> IT 불꽃코딩 <span>ver 0.2</span></a></h1>
        </div>

        <!-- Sidebar navigation starts -->

        <!-- Responsive dropdown -->
        <div class="sidebar-dropdown"><a href="#" class="br-red"><i class="fa fa-bars"></i></a></div>

        <div class="side-nav">

            <div class="side-nav-block">
                <!-- Sidebar heading -->
                <h4>Main</h4>
                <!-- Sidebar links -->
                <ul class="list-unstyled">
                    <li><a href="/login/create"><i class="fa fa-user"></i> 회원가입</a></li>
                    <li><a href="/board/STUDY"><i class="fa fa-desktop"></i> 스터디 모집</a></li>
                    <li><a href="/board/QA"><i class="fa fa-bullseye"></i> Q&A <span class="badge badge-danger pull-right">6</span></a></li>
                    <li><a href="/board/DEFAULT"><i class="fa fa-signal"></i> 자유게시판 <span class="badge badge-info pull-right">5</span></a></li>
                </ul>
            </div>

            <div class="side-nav-block">
                <h4>불꽃코딩이란?</h4>
                <ul class="list-unstyled">
                    <li><a href="0-base.html" class=""><i class="fa fa-desktop"></i> 사이트소개</a></li>
                    <li><a href="login.html"><i class="fa fa-sign-in"></i> 운영진소개</a></li>
                    <!--<li><a href="404.html"><i class="fa fa-times"></i> Error Page</a></li>-->
                    <!--<li><a href="grid.html"><i class="fa fa-th-large"></i> Grids</a></li>-->
                    <!--<li><a href="lock.html"><i class="fa fa-lock"></i> Lock</a></li>-->
                </ul>
            </div>


        </div>

        <!-- Sidebar navigation ends -->

    </div>
</div>
<!-- Sidebar ends -->