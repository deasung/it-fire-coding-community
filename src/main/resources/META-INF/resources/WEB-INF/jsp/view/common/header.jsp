<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Mainbar head starts -->
<div class="main-head">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-6">
                <!-- Page title -->
                <h2><i class="fa fa-desktop lblue"></i> 메인</h2>
            </div>

            <div class="col-md-3 col-sm-4 col-xs-6">
                <!-- Search block -->
                <div class="head-search">
                    <form class="form" role="form">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search...">
										  <span class="input-group-btn">
											<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
										  </span>
                        </div>
                    </form>
                </div>
            </div>

            <c:choose>
                <c:when test="${param.login != 'null'}">
                    <!-- 2016-10-05 로그인 했을 경우 -->
                    <div class="col-md-3 hidden-sm hidden-xs">
                        <!-- Head user -->
                        <div class="head-user dropdown pull-right">
                            <a href="#" data-toggle="dropdown" id="profile">
                                <!-- Icon
                                <i class="fa fa-user"></i>  -->

                                <img src="${pageContext.request.contextPath}/img/user2.png" alt="" class="img-responsive img-circle"/>

                                <!-- User name -->
                                    ${param.login}<%-- <span class="label label-danger">5</span>--%>
                                <i class="fa fa-caret-down"></i>
                            </a>
                            <!-- Dropdown -->
                            <ul class="dropdown-menu" aria-labelledby="profile">
                                <li><a href="#">프로필 수정</a></li>
                                <%--<li><a href="#">Change Settings</a></li>--%>
                                <%--<li><a href="#">Messages <span class="badge badge-danger pull-right">5</span></a></li>--%>
                                <li><a href="#">로그아웃</a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                </c:when>

                <c:otherwise>
                    <!-- 2016-10-05 로그인 안했을 경우 -->
                    <div class="col-md-3 hidden-sm hidden-xs">
                        <!-- Head user -->
                        <div class="head-user dropdown pull-right">
                            <a href="/login">로그인</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </c:otherwise>
            </c:choose>





        </div>
    </div>

</div>
<!-- Mainbar head ends -->