<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <div class="app-page-title">
                    <div class="page-title-wrapper">
                        <div class="page-title-heading">
                            <div class="page-title-icon">
                                <i class="pe-7s-user icon-gradient bg-mean-fruit">
                                </i>
                            </div>
                            <div><c:out value="Welcome back ${user.name}!"/>
                                <div class="page-title-subheading">Today is <b>${date}</b> and you have <b>%NUMBER</b>
                                    planned lessons.
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-xl-4">
                        <div class="card mb-3 widget-content bg-midnight-bloom">
                            <div class="widget-content-wrapper text-white">
                                <div class="widget-content-left">
                                    <div class="widget-heading">Users online</div>
                                </div>
                                <div class="widget-content-right">
                                    <div class="widget-numbers text-white"><span>%number</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-4">
                        <div class="card mb-3 widget-content bg-arielle-smile">
                            <div class="widget-content-wrapper text-white">
                                <div class="widget-content-left">
                                    <div class="widget-heading">Your points</div>
                                </div>
                                <div class="widget-content-right">
                                    <div class="widget-numbers text-white"><span>${user.points}</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-4">
                        <div class="card mb-3 widget-content bg-grow-early">
                            <div class="widget-content-wrapper text-white">
                                <div class="widget-content-left">
                                    <div class="widget-heading">Your rating</div>
                                </div>
                                <div class="widget-content-right">
                                    <div class="widget-numbers text-white">
                                        <c:set value="${user.rating}" var="rating"/>
                                        <c:choose>
                                            <c:when test="${rating != 0}">
                                            <span class="rating-input" style="display: inline-flex; font-size: 0.8em;">
                                            <fmt:formatNumber var="rating" value="${user.rating}"
                                                              maxFractionDigits="0"/>
                                            <input type="number" class="rating"
                                                   style="display: inline-flex; font-size: 0.5em" data-readonly="true"
                                                   value="${rating}"/>
                                        </span>
                                                <span>${user.rating}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <div>No rating yet</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="main-card mb-3 card">
                    <div class="card-header">BEST TEACHERS
                        <div class="btn-actions-pane-right">
                            <div role="group" class="btn-group-sm btn-group">
                                <button class="active btn btn-focus" id="filter-rating">Rating</button>
                                <button class="btn btn-focus" id="filter-rank">Rank</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="align-middle mb-0 table table-borderless table-striped table-hover">
                            <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th>Name</th>
                                <th class="text-center">Wants to learn</th>
                                <th class="text-center">Rating</th>
                                <th class="text-center">Rank</th>
                                <th class="text-center">Actions</th>
                            </tr>
                            </thead>

                            <tbody hidden="hidden" id="pair-by-rank">
                            <c:forEach items="${pairedUsersByRank}" var="pair">
                                <tr>
                                    <td class="text-center text-muted">${pair.id}</td>
                                    <td>
                                        <div class="widget-content p-0">
                                            <div class="widget-content-wrapper">
                                                <div class="widget-content-left mr-3">
                                                    <div class="widget-content-left">
                                                        <img width="40" class="rounded-circle"
                                                             src='<c:url value="/users/${pair.id}/avatar.jpg"/>'
                                                             alt="">
                                                    </div>
                                                </div>
                                                <div class="widget-content-left flex2">
                                                    <div class="widget-heading">${pair.name} ${pair.lastName}</div>
                                                    <div class="widget-subheading opacity-7">Speaks:
                                                        <b>${pair.motherTongue.name}</b></div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center"><c:forEach items="${pair.toLearnLanguages}"
                                                                       var="language">${language.name} </c:forEach></td>
                                    <td class="text-center">
                                        <div class="rating-input">
                                            <fmt:formatNumber var="rating" value="${pair.rating}"
                                                              maxFractionDigits="0"/>
                                            <input type="number" class="rating" data-readonly="true" value="${rating}">
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <div class="badge">${pair.level}</div>
                                    </td>
                                    <td class="text-center">
                                        <a href="/app/profile/${pair.id}" type="button" id="PopoverCustomT-1"
                                           class="btn btn-primary btn-sm">
                                            Details
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tbody id="pair-by-rating">
                            <c:forEach items="${pairedUsersByRating}" var="pair">
                                <tr>
                                    <td class="text-center text-muted">${pair.id}</td>
                                    <td>
                                        <div class="widget-content p-0">
                                            <div class="widget-content-wrapper">
                                                <div class="widget-content-left mr-3">
                                                    <div class="widget-content-left">
                                                        <img width="40" class="rounded-circle"
                                                             src='<c:url value="/users/${pair.id}/avatar.jpg"/>'
                                                             alt="">
                                                    </div>
                                                </div>
                                                <div class="widget-content-left flex2">
                                                    <div class="widget-heading">${pair.name} ${pair.lastName}</div>
                                                    <div class="widget-subheading opacity-7">Speaks:
                                                        <b>${pair.motherTongue.name}</b></div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center"><c:forEach items="${pair.toLearnLanguages}"
                                                                       var="language">${language.name} </c:forEach></td>
                                    <td class="text-center">
                                        <div class="rating-input">
                                            <fmt:formatNumber var="rating" value="${pair.rating}"
                                                              maxFractionDigits="0"/>
                                            <input type="number" class="rating" data-readonly="true" value="${rating}">
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <div class="badge">${pair.level}</div>
                                    </td>
                                    <td class="text-center">
                                        <a href="/app/visit/profile/${pair.id}" type="button" id="PopoverCustomT-2"
                                           class="btn btn-primary btn-sm">
                                            Details
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src='<c:url value="/resources/dashboard/ratingPlugin/bs4/build/bootstrap4-rating-input.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/dashboard/scripts/main.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/dashboard/scripts/custom.js"/>'></script>
</body>
</html>
