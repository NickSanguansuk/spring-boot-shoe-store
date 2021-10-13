<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Login Page</title>
    <%--<link rel="stylesheet" type="text/css" href="css/styles.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <%--<script type="text/javascript" src="js/script.js" defer></script>--%>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"/>
    <h1>Login Page</h1>
    <br>
</header>
<main>
    <section>
        <h2>Login form</h2>
        <p>This is the Login form.</p>

        <%--<form method="post" action="login">--%>
        <form method="post" action="/login/j_security_check">
            <c:if test="${error}">
                <div style="color:red">Sign In Failed: Invalid username or password.</div>
            </c:if>

            <c:if test="${not empty loginMessage}">
                <span style='color:red'>${loginMessage}</span>
                <br>
            </c:if>
            <hr>

            <label>
                Username:
                <input type="text" name="username" value="" required>
            </label>
            <br>

            <label>
                Password:
                <input type="password" name="password" value="" required>
            </label>
            <br>

            <input type="submit" name="login" value="Login">
        </form>
    </section>
</main>
<footer>
    <br>
    <jsp:include page="../include/footer.jsp"/>
</footer>
</body>
</html>
