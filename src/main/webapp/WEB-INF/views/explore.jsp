<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<%@include file="sections/head.jsp" %>
<body>
<div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
    <%@include file="sections/headerNav.jsp" %>
    <div class="app-main">
        <div class="app-sidebar sidebar-shadow">
            <div class="app-header__logo">
                <div class="logo-src"></div>
                <div class="header__pane ml-auto">
                    <div>
                        <button type="button" class="hamburger close-sidebar-btn hamburger--elastic"
                                data-class="closed-sidebar">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="app-header__mobile-menu">
                <div>
                    <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                    </button>
                </div>
            </div>
            <div class="app-header__menu">
                        <span>
                            <button type="button"
                                    class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                                <span class="btn-icon-wrapper">
                                    <i class="fa fa-ellipsis-v fa-w-6"></i>
                                </span>
                            </button>
                        </span>
            </div>
            <%@include file="sections/sidebar.jsp" %>
        </div>
        <div class="app-main__outer">
            <div class="app-main__inner">
                <link href='<c:url value="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>'
                      rel="stylesheet">
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <%-- user tab --%>
                            <c:forEach items="${users}" var="usr">
                            <div class="col-lg-4">
                                <div class="text-center card-box border">
                                    <div class="member-card pt-2 pb-2">
                                        <div class="thumb-lg member-thumb mx-auto"><img
                                                src='<c:url value="/users/${usr.id}/avatar.jpg"/>'
                                                class="rounded-circle img-thumbnail" alt="profile-image"></div>
                                        <div class="">
                                            <h6>${usr.name} ${usr.lastName}</h6>
                                            <p class="text-muted">Speaks<span> | </span><span><b>${usr.motherTongue.name}</b></span>
                                            </p>
                                        </div>
                                        <button type="button"
                                                class="btn btn-primary mt-3 btn-rounded waves-effect w-md waves-light">
                                            Message Now
                                        </button>
                                        <div class="mt-4">
                                            <div class="row">
                                                <div class="col-4">
                                                    <div class="mt-3">
                                                        <h4>2563</h4>
                                                        <p class="mb-0 text-muted">Wallets Balance</p>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="mt-3">
                                                        <h4>6952</h4>
                                                        <p class="mb-0 text-muted">Income amounts</p>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="mt-3">
                                                        <h4>1125</h4>
                                                        <p class="mb-0 text-muted">Total Transactions</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- container -->
                </div>
            </div>
        </div>
    </div>
</div>
<script src='<c:url value="/resources/register/vendor/jquery/jquery.min.js"/>'></script>
<script src='<c:url value="/resources/dashboard/ratingPlugin/bs4/build/bootstrap4-rating-input.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/dashboard/scripts/main.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/profile/js/custom.js"/>'></script>
</body>
</html>
