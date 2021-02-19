<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up to MotLang</title>

    <!-- Font Icon -->
    <link rel="stylesheet"
          href='<c:url value="resources/register/fonts/material-icon/css/material-design-iconic-font.min.css"/>'/>

    <!-- Main css -->
    <link rel="stylesheet" href='<c:url value="/resources/register/css/style.css"/>'/>

    <!-- multiple-select -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
          rel="stylesheet"/>
</head>
<body>

<div class="main">

    <div class="container">
        <form:form method="post" class="appointment-form" id="appointment-form" modelAttribute="user">
            <h2>Join MotLang today!</h2>
            <c:if test="${exists != null}">
                <div id="e3" style="color: red; font-size: 1.1em; margin-bottom: 5px">${exists}</div>
            </c:if>
            <div class="form-group-1">
                <form:errors cssClass="error" path="userName"/><form:input placeholder="Username" path="userName"
                                                                           id="username"/>
                <form:errors cssClass="error" path="name"/><form:input placeholder="Name" path="name" id="name"/>
                <form:errors cssClass="error" path="lastName"/><form:input placeholder="Last name" path="lastName"
                                                                           id="lastname"/>
                <form:errors cssClass="error" path="email"/><form:input placeholder="Email" path="email" id="email"/>
                <form:errors cssClass="error" path="age"/><form:input placeholder="Age" path="age" id="age"/>
                <form:errors cssClass="error" path="password"/><form:password placeholder="Password" id="psw"
                                                                              pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                                                              path="password"/>
                <div id="message">
                    <div class="h3">Password must contain the following:</div>
                    <div id="letter" class="invalid">A <b>lowercase</b> letter</div>
                    <div id="capital" class="invalid">A <b>capital (uppercase)</b> letter</div>
                    <div id="number" class="invalid">A <b>number</b></div>
                    <div id="length" class="invalid">Minimum <b>8 characters</b></div>
                </div>
                <c:if test="${confirm != null}">
                    <div id="e2" style="color: red; font-size: 1.1em; margin-bottom: 5px">${confirm}</div>
                </c:if>
                <input placeholder="Confirm password" type="password" name="confirm" id="confirm"/>
                <div class="select-list">
                    <form:select path="motherTongue">
                        <form:option value="" label="Select mother tongue"/>
                        <form:options items="${languages}" itemLabel="name"/>
                    </form:select>
                </div>
            </div>
            <h3>Which languages you would like to learn?</h3>

            <!-- TODO: Options list is not expanding -->
            <div class="select-list" id="languagesToLearn">
                <form:select path="toLearnLanguages" multiple="multiple" class="js-example-basic-multiple">
                    <form:options items="${languages}" itemLabel="name"/>
                </form:select>
            </div>
            <div class="form-check" id="termsConditions">
                <c:if test="${terms != null}">
                    <div id="e1" style="color: red; font-size: 1.1em; margin-bottom: 5px">${terms}</div>
                </c:if>
                <input type="checkbox" required value="false" name="terms" id="agree-term" class="agree-term"/>
                <label for="agree-term" class="label-agree-term" id="terms"><span></span>I agree to the
                    <a href="#" class="term-service">Terms and Conditions</a></label><span id="star" style="color: red">*</span>
            </div>
            <div class="form-submit" style="display: flex; justify-content: space-around">
                <input type="submit" name="submit" id="submit" style="margin-bottom: 0px" class="submit"
                       value="Register"/>
                <a href="/home" type="button" name="Home page" style="background: darkred; text-decoration: none"
                   class="submit">Home Page</a>
            </div>
        </form:form>
    </div>

</div>
</div>
<!-- JS -->
<script src='<c:url value="/resources/register/vendor/jquery/jquery.min.js"/>'></script>
<script src='<c:url value="/resources/register/js/main.js"/>'></script>
<script src='<c:url value="/resources/register/js/custom.js"/>'></script>
<script>$(document).ready(function () {
    $('.js-example-basic-multiple').select2();
});</script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

</body>
</html>