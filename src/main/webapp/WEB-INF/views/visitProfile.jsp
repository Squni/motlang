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
                <div class="container emp-profile">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="profile-img">
                                <img src='<c:url value="/users/${visitUser.id}/avatar.jpg"/>' alt=""/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="profile-head">
                                <h5>
                                    ${visitUser.name} ${visitUser.lastName}
                                </h5>
                                <h6>
                                    Mother tongue: <b>${visitUser.motherTongue.name}</b>
                                </h6>
                                <p class="proile-rating">RATING :
                                    <span class="rating-input" style="display: inline-flex">
                                            <fmt:formatNumber var="rating" value="${visitUser.rating}"
                                                              maxFractionDigits="0"/>
                                            <input type="number" class="rating" data-readonly="true" value="${rating}">
                                        </span>
                                    <span>${visitUser.rating}</span></p>
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home"
                                           role="tab" aria-controls="home" aria-selected="true">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile"
                                           role="tab" aria-controls="profile" aria-selected="false">Timeline</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews"
                                           role="tab" aria-controls="reviews" aria-selected="false">Reviews</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="profile-work">
                                <p>WORK LINK</p>
                                <a href="">Website Link</a><br/>
                                <a href="">Bootsnipp Profile</a><br/>
                                <a href="">Bootply Profile</a>
                                <p>SKILLS</p>
                                <a href="">Web Designer</a><br/>
                                <a href="">Web Developer</a><br/>
                                <a href="">WordPress</a><br/>
                                <a href="">WooCommerce</a><br/>
                                <a href="">PHP, .Net</a><br/>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="tab-content profile-tab" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel"
                                     aria-labelledby="home-tab">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Name</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>${visitUser.name} ${visitUser.lastName}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Email</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>${visitUser.email}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Rank</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>${visitUser.level}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Wants to learn</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p><c:forEach items="${visitUser.toLearnLanguages}"
                                                          var="language">${language.name} </c:forEach></p>
                                        </div>
                                    </div>


                                </div>
                                <div class="tab-pane fade" id="profile" role="tabpanel"
                                     aria-labelledby="profile-tab">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Experience</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>Expert</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Hourly Rate</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>10$/hr</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Total Projects</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>230</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>English Level</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>Expert</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Availability</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>6 months</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Your Bio</label><br/>
                                            <p>Your detail description</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="reviews" role="tabpanel"
                                     aria-labelledby="reviews-tab">
                                    <div class="row" style="display: grid">
                                        <button id="add-review" style="width: 20%; margin-bottom: 50px"
                                                class="btn btn-primary"><i
                                                class="fa text-white fa-plus-circle pr-1 pl-1"></i>Add review
                                        </button>
                                        <form:form modelAttribute="comment" method="post" id="review-form" hidden="hidden">
                                            <form:input path="content"/>
                                            <span class="rating-input" style="display: inline-flex">
                                                <form:input type="number" path="rating" class="rating"/>
                                                </span>
                                            <button type="submit" class="btn btn-success">Add</button>
                                            <button type="button" class="btn btn-danger" id="review-cancel">Cancel</button>
                                        </form:form>
                                        <c:forEach items="${visitUser.comments}" var="comment">
                                            <div class="col-md-6" style="display: flex">
                                                <label style="flex: 0 0 50%">${comment.author.name} ${comment.author.lastName}</label>
                                                <span class="rating-input" style="display: inline-flex">
                                                <fmt:formatNumber var="commentRating" value="${comment.rating}"
                                                                  maxFractionDigits="0"/>
                                                <input type="number" class="rating" data-readonly="true"
                                                       value="${commentRating}">
                                                </span>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${comment.content}</p>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src='<c:url value="/resources/dashboard/ratingPlugin/bs4/build/bootstrap4-rating-input.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/dashboard/scripts/main.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/profile/js/review.js"/>'></script>
</body>
</html>
