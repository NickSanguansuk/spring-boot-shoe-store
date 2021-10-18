<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Login Page</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/styles-login-login.css">
    <!-- JavaScript -->
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <%--<h1>Login Page</h1>--%>
    <%--<br>--%>
</header>
<main>
    <section class="bg-light text-dark p-4 text-center my-section-container">
        <div class="container">
            <form method="post" action="/login/j_security_check" style="max-width: 360px; margin: auto;">
                <img class="rounded m-4"
                     src="${pageContext.request.contextPath}/resources/images/logo/feetfirst8.jpg"
                     alt="FeetFirst Logo" width="300" height="auto">
                <h1 class="h3, mb-3">Please sign in</h1>

                <c:if test="${error}">
                    <div style="color:red">Sign in FAILED: Invalid username or password.</div>
                </c:if>

                <div class="">
                    <c:if test="${not empty loginMessage}">
                        <span style='color:red'>${loginMessage}</span>
                        <br>
                    </c:if>
                </div>
                <hr>

                <div class="text-start">
                    <label class="sr-only form-label" for="my-login-form-username">Username (Email address)</label>
                    <%--<input class="form-control" type="email" id="my-login-form-username" name="username" value=""--%>
                    <%--       placeholder="example@domain.com" required autofocus>--%>
                    <input class="form-control" type="email" id="my-login-form-username" name="username" value=""
                           placeholder="Username" required>
                </div>

                <div class="text-start">
                    <label class="sr-only form-label" for="my-login-form-password">Password</label>
                    <input class="form-control" type="password" id="my-login-form-password" name="password" value=""
                           placeholder="Password" required>
                </div>

                <div class="checkbox mt-3 mb-3">
                    <label>
                        <input type="checkbox" value="remember-me">
                        Remember me
                    </label>
                </div>

                <div class="mt-3">
                    <button type="submit" class="btn btn-lg btn-primary btn-block">Sign In</button>
                </div>

                <%--<label>--%>
                <%--    Username:--%>
                <%--    <input type="text" name="username" value="" required>--%>
                <%--</label>--%>
                <%--<br>--%>

                <%--<label>--%>
                <%--    Password:--%>
                <%--    <input type="password" name="password" value="" required>--%>
                <%--</label>--%>
                <%--<br>--%>

                <%--<input type="submit" name="login" value="Login">--%>
            </form>
        </div>
    </section>
</main>
<footer>
    <%--<br>--%>
    <jsp:include page="../include/footer.jsp"/>
</footer>
<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
