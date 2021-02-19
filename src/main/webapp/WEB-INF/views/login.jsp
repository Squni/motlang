<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V16</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href='<c:url value="/resources/loginPage/images/icons/favicon.ico"/>'/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/resources/loginPage/vendor/bootstrap/css/bootstrap.min.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/resources/loginPage/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/resources/loginPage/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/loginPage/vendor/animate/animate.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/resources/loginPage/vendor/css-hamburgers/hamburgers.min.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/resources/loginPage/vendor/animsition/css/animsition.min.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/loginPage/vendor/select2/select2.min.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/resources/loginPage/vendor/daterangepicker/daterangepicker.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/loginPage/css/util.css"/>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/loginPage/css/main.css"/>'>
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100"
         style="background-image: url(<c:url value="/resources/loginPage/images/bg-01.jpg"/>)">
        <div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Account Login
				</span>
            <c:if test="${registered != null}">
                <div style="color: greenyellow">${registered}</div>
            </c:if>
            <form modelAttribute="user" method="post" class="login100-form validate-form p-b-33 p-t-5">
                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" name="username" placeholder="User name"/>
                    <span class="focus-input100" data-placeholder="&#xe82a;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input name="password" class="input100" placeholder="Password"/>
                    <span class="focus-input100" data-placeholder="&#xe80f;"></span>
                </div>
                <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
                <div class="container-login100-form-btn m-t-32">
                    <button class="login100-form-btn">
                        Login
                    </button>
                    <%--TODO: On hoover button transparent--%>
                    <a href="/home" style="text-decoration: none" class="container-login100-form-btn">
                        Home Page
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src='<c:url value="/resources/loginPage/vendor/jquery/jquery-3.2.1.min.js"/>'></script>
<!--===============================================================================================-->
<script src='<c:url value="/resources/loginPage/vendor/animsition/js/animsition.min.js"/>'></script>
<!--===============================================================================================-->
<script src='<c:url value="/resources/loginPage/vendor/bootstrap/js/popper.js"/>'></script>
<script src='<c:url value="/resources/loginPage/vendor/bootstrap/js/bootstrap.min.js"/>'></script>
<!--===============================================================================================-->
<script src='<c:url value="/resources/loginPage/vendor/select2/select2.min.js"/>'></script>
<!--===============================================================================================-->
<script src='<c:url value="/resources/loginPage/vendor/daterangepicker/moment.min.js"/>'></script>
<script src='<c:url value="/resources/loginPage/vendor/daterangepicker/daterangepicker.js"/>'></script>
<!--===============================================================================================-->
<script src='<c:url value="/resources/loginPage/vendor/countdowntime/countdowntime.js"/>'></script>
<!--===============================================================================================-->
<script src='<c:url value="/resources/loginPage/js/main.js"/>'></script>

</body>
</html>